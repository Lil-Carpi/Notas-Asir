**Creador: Sebastian Ariel Duarte Oruez
M4: Sistemes operatius en xarxa
Grupo: G4
Año: 24/25**
![[banana.gif]]

**FET EN MARKDOWN - OBSIDIAN**

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

---

# Índex

```table-of-contents
```


<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

---

# Fase 0: Anàlisi
**Descripció de la compartició**

Els departaments de l'empresa Thos Prime necessiten disposar de diferents espais en la xarxa amb els següents requisits:

- El departament de CEO ha de disposar d'un espai de treball propi comú a tots els seus usuaris per desar i compartir fitxers entre els membres del departament sense cap restricció d’accés. No es permet l’accés de cap altre departament.
- El departament de PUBLICITAT ha de disposar d'un espai de treball propi comú a tots els usuaris per desar i compartir fitxers entre els membres del departament sense cap restricció d'accés. Es permet l’accés en mode lectura únicament per part del departament CEO.
- El departament de FACTURACIO ha de disposar d'un espai de treball propi comú a tots els usuaris per desar i compartir fitxers entre els membres del departament sense cap restricció d'accés. Es permet l’accés en mode lectura i escriptura únicament per part del departament CEO.
- Hi ha d'haver un espai on s’emmagatzemen documents oficials de l’empresa (Sistema de Gestió Documental), en el qual tots els usuaris de tots els departaments tindran accés de lectura, exceptuant CEO que també hi podrà escriure.
- En cap cas es permet l’accés d'usuaris no autenticats (és a dir, no s’han d’admetre els usuaris convidats).
- Hi ha d'haver un espai de lliure intercanvi de fitxers per a tots els usuaris de la xarxa on poder deixar fitxers disponibles per tothom, però on no es poden esborrar els fitxers dels altres usuaris.

Així, les carpetes han de crear-se totes a partir de **/srv/smb** i s'han d'anomenar de la següent manera:

- **/srv/smb/ceo** ---> compartida pels usuaris de CEO.
- **/srv/smb/publicitat** ---> compartida pels usuaris de Publicitat.
- **/srv/smb/facturació** ---> compartida pels usuaris de Facturació.
- **/srv/smb/sgd** ---> compartida per al sistema de gestió documental.
- **/srv/smb/public** ---> espai de lliure intercanvi.


| Propietats        | Directoris          | Acces                                                                                         |
| ----------------- | ------------------- | --------------------------------------------------------------------------------------------- |
| CEO               | /srv/smb/ceo        | Només pot accedir el grup CEO                                                                 |
| Publicitat        | /srv/smb/publicitat | Poden accedir amb llibertat el grup Publicitat, a mes de CEO, pero amb mode lectura.          |
| Facturació        | /srv/smb/facturacio | Poden accedir amb llibertat el grup Facturacio, a mes de CEO en mode lectura i escriptura     |
| Gestió Documental | /srv/smb/sgd        | Poden accedir tots els usuaris amb mode lectura, exceptuant CEO, el qual podra també escriure |
| Public            | /srv/smb/public     | Tothom pot ingresar fitxers                                                                   |

---
# Fase 1: Instal·lació de SAMBA al servidor
Per instal·lar SAMBA al servidor:
```shell
sudo apt install samba
```
![[install-samba.png]]

---

## Creació d'usuaris i grups
Crearem els usuaris i grups per afegir-los al SAMBA:
- Per crear usuaris: `useradd USER -G GROUPNAME` (para home, añadir -m)
- Per crear grups: `groupadd -g GROUPID GROUPNAME`

**Grup gCEO:**
```shell
sudo groupadd -g 1000 gCEO
```

**Grup gPublicitat**:
```shell
sudo groupadd -g 1001 gPublicitat
```

**Grup gFacturacio**:
```shell
sudo groupadd -g 1002 gFacturacio
```

**Usuari gceo**:
```shell
sudo useradd uceo
```

**Usuari gpublicitat**:
```shell
sudo useradd upublicitat
```

**Usuari gfacturacio**:
```shell
sudo useradd ufacturacio
```
![[Pasted image 20250522154441.png]]
*Ignoreu que els usuaris es diuen guser. He canviat per que siguin uuser*

Ara, afegim els usuaris a SAMBA:

``` shell
sudo smbpasswd -a <usuari>
```
![[Pasted image 20250522233805.png]]
*nota: tambe he creat el grup gSDG per el directori sdg, encara que no ha servit de res.*
Podem comprovar els usuaris afegits a SAMBA amb:

```shell
sudo pdbedit -L
```
![[Pasted image 20250522233843.png]]

---
## Fase 2. Creació de l'estructura de directoris.

Creem els directoris necesaris:
![[Pasted image 20250522194430.png]]

Els donem aquestos permissos:
![[Pasted image 20250523225728.png]]
Un tree dels directoris:
![[Pasted image 20250522194814.png]]

---
# Creacio del fitxer de configuracio de SAMBA
Posem el seguent a `/etc/samba/smb.conf`:
```ini
[global]
        server string = Thos Prime
        workgroup = WORKGROUP
        security = user
        map to guest = never
        guest ok = no
        idmap config * : backend = tdb

[CEO]
        comment = Carpeta CEO
        path = /srv/smb/ceo
        valid users = @gCEO
        force group = gCEO
        create mask = 0660
        directory mask = 0770
        read only = no

[Publicitat]
        comment = Carpeta Publicitat                           
        path = /srv/smb/publicitat
        valid users = @gPublicitat @gCEO 
        write list = @gPublicitat
        force group = gCEO  
        create mask = 0740  
        directory mask = 0750 
        read only = no                                                           
[Facturacio]                                                                      
        comment = Carpeta Facturacio
        path = /srv/smb/facturacio
        valid users = @gFacturacio @gCEO
        write list = @gFacturacio @gCEO
        force group = gCEO
        create mask = 0770
        directory mask = 0770
        read only = no
[SDG]
        comment = Sistema De Gestio
        path = /srv/smb/sdg
        valid users = @gCEO @gSDG
        write list = gCEO
        force group = gSDG
        create mask = 0640
        directory mask = 0750
        read only = no

[Public]
        comment = Carpeta Publica
        path = /srv/smb/public
        valid users = uceo ufacturacio upublicitat 
        read only = no
        force group = users
        create mask = 0666
        directory mask = 1777

```

Reiniciem el serveis `smbd` i `nmbd`. Podem veure si tot està correcte amb un `testparm`:
![[Pasted image 20250522235638.png]]

---
# Comprovació de funcionament al client UBUNTU

Primer de tot, he afegit a l'usuari com **SUBUNTU** al `/etc/host`:
![[Pasted image 20250522235924.png]]

Escriptura de CEO en CEO:
![[Pasted image 20250523000915.png]]

Escriptura de CEO en Publicitat:
![[Pasted image 20250523220105.png]]

Escriptura de CEO en Facturació:
![[Pasted image 20250523220208.png]]

Escriptura de CEO en SDG (no ha funcionat com deuria):
![[Pasted image 20250523221125.png]]

Escriptura de CEO en Públic:
![[Pasted image 20250523221351.png]]

Accedir per GUI:
![[Pasted image 20250523221606.png]]
![[Pasted image 20250523221943.png]]
