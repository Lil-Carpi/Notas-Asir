**Creador: Sebastian Ariel Duarte Oruez
M4: Sistemes operatius en xarxa
Grupo: G4
Año: 24/25**
![[banana.gif]]

**FET EN MARKDOWN - OBSIDIAN**

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

# Índex
```table-of-contents
```

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>


---
# 1. Instal·lacio i configuracio del servei NFS en el sistema Ubuntu Server
## Instal·lacio del servei NFS
Per instal·lar NFS, hem de fer servir la seguent commanda:
``` shell
sudo apt install nfs-kernel-server
```

## Creació dels directoris
Crearem dues carpetes (`/srv/nfs/public` i `/srv/nfs/restricted`) en el servidor.

```shell
sudo mkdir -p /srv/nfs/public ; sudo mkdir /srv/nfs/restricted
```
![[creacio-directoris-srv_nfs.png]]
Ara, li canviarem els permisos:
```shell
sudo chown nobody:nogroup /srv/nfs ; sudo chmod 555 /srv/nfs
sudo chown carpi:carpi /srv/nfs/public ; sudo chmod 777 /srv/nfs/public
sudo chmod 006 /srv/nfs/restricted
```
![[ls-l_srv.png]]
![[canvi-permissos-users-srv_nfs.png]]
Aquí, estem declarant que:
- El directori **/srv/nfs** tingui els permisos `r-x r-x r-x` I que l'usuari propietari sigui ***nobody*** i el grup propietari sigui ***nogroup***.
- El directori **/srv/nfs/public** tinguin els permisos `rwx rwx rwx` i que l'usuari i grup propietari sigui ***carpi (jo)***.
- El directori **/srv/nfs/restricted** no tingui permisos, que l'usuari i grup propietari sigui ***root*** (recordem que root se salta els permissos) i que altres pugin llegir i escriure.

## Compartim els directoris

Ara, anirem als fitxers de configuració que es troba a `/etc/exports` i posarem el següent:

```ini
/srv/nfs/public        *(rw,root_squash)
/srv/nfs/restricted    192.168.0.100(rw,no_root_squash)
```
![[etc-exports.png]]
Aquí definim que:
- Directori `/srv/nfs/public`: Qualsevol màquina pot veure la carpeta compartida per la xarxa i canvia la propietat de tot el que crea root a nobody.
- Directori `/srv/nfs/restricted`: Només la màquina `192.168.0.100` pot veure la carpeta compartida i manté la propietat de tot el que crea root com root.

Apliquem la configuració amb:
```shell
sudo exportfs -a
```
![[exportfs-a.png]]
---
# Connectar una màquina client al servei NFS

## Instal·lem el servei NFS al client:
```shell
sudo apt install nfs-common
```
![[install_nfs_common.png]]

## Muntem els directoris
Creem els directoris a on muntarem els directoris compartits:
```shell
sudo mkdir /mnt/public , sudo mkdir /mnt/restricted
```
![[creacio-mnt-public.png]]
Muntarem els directoris a `/mnt`:
```shell
sudo mount 192.168.0.1:/srv/nfs/public /mnt/public
sudo mount 192.168.0.1:/srv/nfs/restricted /mnt/restricted
```
![[mount-cubuntu.png]]

Ara, per comprovar si funciona, amb root, crearé un arxiu a `/mnt/public`:
```shell
cd /mnt/public ; sudo touch prova-root
total 0
-rw-r--r-- 1 nobody nogroup 0 may 15 15:52 prova-root
```
![[sudo-touch-prova-root.png]]

Verifiquem al servidor:
```shell
cd /srv/nfs/public ; ls -l
total 0
-rw-r--r-- 1 nobody nogroup 0 may 15 15:52 prova-root
```
![[prova-root-server.png]]
Podem veure que l'usuari i grup propietari és `nobody nogroup`, ja que els paràmetres que vam indicar al fitxer `/etc/exports` són que tot el que faci `Root` a `public`, no pertany a ningú amb `root_squash`.


### Creacio de fitxer amb usuari local
![[Pasted image 20250518211508.png]]
![[Pasted image 20250518211539.png]]

Veiem que l'usuari propietari i grup propietari és `carpi`, ja que ho està creant aquest usuari a un lloc amb permisos adequats.

### Creació de fitxer amb root a restricted
![[Pasted image 20250518211710.png]]
![[Pasted image 20250518211741.png]]

Veiem que podem crear fitxers amb root, perquè com hem declarat abans, al directori `restricted`, només té accés l'usuari root.

### Creació de fitxers amb usuari local a restrictet

![[Pasted image 20250518211811.png]]

És impossible crear fitxers a restrictet sense ser-hi amb root.

## Desmuntar les carpetes compartides
![[Pasted image 20250518212100.png]]

## Muntar automaticament amb fstab
Per configurar fstab:
![[Pasted image 20250518214213.png]]

Apliquem els canvis amb:
![[Pasted image 20250518214800.png]]
