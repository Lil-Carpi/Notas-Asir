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

# Fase 1: Instal·lació de SAMBA
Per instal·lar SAMBA al servidor:
```shell
sudo apt install samba
```
![[install-samba.png]]

## Creació d'usuaris i grups
Crearem els usuaris i grups per afegir-los al SAMBA:
- Per crear usuaris: `useradd USER -G GROUPNAME` (per crear el seu home, cal afegir -m)
- Per crear grups: `groupadd -g GROUPID GROUPNAME`

**Grup gCEO, gPublicitat i gFacturacio**:
```shell
sudo groupadd -g 2000 gCEO
sudo groupadd -g 2001 gPublicitat
sudo groupadd -g 2002 gFacturacio
sudo groupadd -g 2003 gSDG
```

**Usuaris uceo, upublicitat i ufacturacio (aprofitem tambe per assignar-lis els seus grups)**:
```shell
sudo useradd uceo -G gCEO
sudo useradd upublicitat -G gPublicitat gSDG
sudo useradd ufacturacio -G gFacturacio gSDG
```
![[Pasted image 20250522154441.png]]

## Afegir els usuaris a SAMBA
Per poder afegir els usuaris al SAMBA, ho farem de la seguent manera:
```shell
#nota: Demanarà contrasenya cada que fem smbpasswd
sudo smbpasswd -a uceo
sudo smbpasswd -a upublicitat
sudo smbpasswd -a ufacturacio
```
![[Pasted image 20250522233805.png]]

Podem veure els usuaris que estiguin a SAMBA amb la comanda:
```shell
sudo pdbedit -L
```
![[Pasted image 20250522233843.png]]

---

# Fase 2: Creació de l'estructura de directoris
Com hem dit abans, necessitarem la següent estructura de carpetes:

| Propietats        | Directoris          | Acces                                                                                         |
| ----------------- | ------------------- | --------------------------------------------------------------------------------------------- |
| CEO               | /srv/smb/ceo        | Només pot accedir el grup CEO                                                                 |
| Publicitat        | /srv/smb/publicitat | Poden accedir amb llibertat el grup Publicitat, a mes de CEO, pero amb mode lectura.          |
| Facturació        | /srv/smb/facturacio | Poden accedir amb llibertat el grup Facturacio, a mes de CEO en mode lectura i escriptura     |
| Gestió Documental | /srv/smb/sdg        | Poden accedir tots els usuaris amb mode lectura, exceptuant CEO, el qual podra també escriure |
| Public            | /srv/smb/public     | Tothom pot ingresar fitxers                                                                   |
Primer de tot, creem els directoris:
```shell
sudo mkdir -p /srv/smb/ceo
sudo mkdir /srv/smb/publicitat
sudo mkdir /srv/smb/facturacio
sudo mkdir /srv/smb/public
sudo mkdir /srv/smb/sdg
```
![[Pasted image 20250522194430.png]]

Ara, canviarem els permisos, usuaris propietaris i grups propietaris com calgui:
```shell
pwd: /srv/smb
sudo chmod 750 ceo/
sudo chmod 770 smb/
sudo chmod 777 public/
sudo chmod 750 publicitat/
sudo chmod 770 sdg/
sudo chown uceo:gCEO ceo/
sudo chown ufacturacio:gCEO facturacio/
sudo chown upublicitat:gCEO publicitat/
sudo chown uceo:gSDG sdg/
```
![[Pasted image 20250523225728.png]]
*Un tree del directori /srv/*:
![[Pasted image 20250522194814.png]]

---

# Fase 3: Creació del fitxer de configuració de SAMBA
Coses que cal aclarir de la meva configuració:
- `[global]`: Aquí definirem la configuració general del servidor SAMBA.
	-  `server string`: Missatge descriptiu que apareixerà en fer una cerca a la xarxa. Serveix com si fos un *nom familiar* del servidor.
	- `idmap config * : backend = tdb`: Defineix el backend per mapejar els UID/GID dels usuaris i grups entre Windows i Linux. És completament opcional, però en un entorn real, capaç és necessari (tdb s'anomena *Trivial DataBase*, que és la base de dades interna del SAMBA).

***CONFIGURACIÓ `/etc/samba/smb.conf`***:
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
![[Pasted image 20250523233322.png]]![[Pasted image 20250523233339.png]]
Una vegada ho posem, reiniciem el serveis:
```shell
sudo systemctl restart smbd nmbd
```
Podem veure si la configuració és correcta amb un 
```shell
testparm
```
![[Pasted image 20250522235638.png]]

---
# Fase 4: Proves
Abans de res, per no posar la direccio IP per cada vegada, ho posaré a `/etc/hosts`:
![[Pasted image 20250522235924.png]]

Haurem d'instal·lar `smbclient` amb:
``` shell
sudo apt install smbclient
```

Haurem de crear un fitxer qualsevol per poder fer un *put (escriure)*
![[Pasted image 20250523234354.png]]
Una vegada instal·lat, podem començar amb les proves.

### Escriptura de CEO en CEO/
```shell
smbclient //SUBUNTU/ceo -U uceo
put testuceo.txt
```
![[Pasted image 20250523000915.png]]

### Escriptura de CEO en Publicitat/
```shell
smbclient //SUBUNTU/publicitat -U uceo
put testuceo.txt
ACCESS_DENIED
```
![[Pasted image 20250523220105.png]]

### Escriptura de CEO en Facturacio/
```shell
smbclient //SUBUNTU/Facturacio -U uceo
put testuceo.txt
```
![[Pasted image 20250523220208.png]]

### Escriptura de CEO en SDG
```shell
smbclient //SUBUNTU/SDG -U uceo
put testuceo.txt
```
![[Pasted image 20250523234016.png]]

### Escriptura de CEO en Public:
```shell
smbclient //SUBUNTU/Public -U uceo
put testuceo.txt
```
![[Pasted image 20250523234134.png]]

## Acces per Nautilus
Obrim el *NAUTILUS*, anem a Xarxa i posem
```shell
smb://subuntu
```
![[Pasted image 20250523221606.png]]![[Pasted image 20250523221943.png]]