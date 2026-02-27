
```table-of-contents
```

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

---
Hay 2 posibles comparticiones
entre Windows y Linux
y entre Linux y Linux

Para ello, se rescata la compartición de la UF4 samba-ad-dc, oo seautilizar de nuevo SAMBA.

Otro protocolo que se utilizara es el NFS (Network file system - solo Linux). Para esta, necesitamos al menos 3 máquinas:
- un servidor Linux
- cliente Linux
- cliente Windows

---

## Permisos
Los permisos que se comparten entre SAMBA y Linux, se complementan entre sí. Un ejemplo: las carpetas home:

```shell
drwxr-x--- 3 ubuntu ubuntu 4096 May 5 15:00 ubuntu
```
En este caso, el usuario Ubuntu puede entrar, leer, ejecutar y escribir cualquier cosa. Su grupo puede leer y ejecutar y los otros no pueden hacer nada. 

En caso de que SAMBA diga que otros grupos pueden acceder al directorio, los permisos de Linux se sobrepone por encima de los permisos de SAMBA, diciendo que nadie puede excepto el usuario y el grupo entrar (excepto root. A root se la pelan los permisos).

## Compartir directorios por red
Para compartir directorios, necesitaremos SAMBA. Para instalarlo:

```shell
sudo apt install samba
```

Los ficheros de configuración de SAMBA se encuentran en `/etc/samba`. El fichero de configuración es `/etc/samba/smb.conf`

Vamos a compartir carpetas desde samba:

### 1.º paso: Crear el directorio

Para crear el directorio a compartir, deberiamos de buscar una direccion la cual sea accesible generalmente para todos. En este caso, podemos escojer el directorio `/home`.

Creamos el directorio:

```shell
cd /home ; mkdir Compartit ; sudo chmod 007 Compartit
```

### 2.º paso: Compartir el directorio en la red

En el fitxers de configuració de SAMBA, en l'última línea:

```ini
/etc/smb.conf
-------------
[cp1]
	comment = carpeta compartida per tothom
	path = /home/Compartit
	browsable = yes
	writable = yes
	guest ok = yes # si volem validar usuaris o grups, comentem aquesta linea.
	valid users = ubuntu #en cas de grup, posem @<group>
```

Estamos declarando lo siguiente:
- `[cp1]`: Sirve para dar nombre en la red que se le dara al directorio compartido.
- `comment`: Un comentario para el directorio.
- `browseable`: Sirve para que el directorio el cual estamos compartiendo sea visible en la red. En caso de poner `no`, el directorio compartido estará oculto para los demas.
- `writable`: Para dar permisos de escritura.
- `guest ok`: Es para activar o desactivar l'autenticació d'usuaris. 
- `valid users`: En cas que volguéssim només donar permís a un usuari o grup. Si volem donar permís a grup, la sintaxi és `@<user>` (sense "<>").

## Afegim un usuari a samba

Per poder compartir la carpeta per usuaris específics, primer haurem de tenir l'usuari fet al samba.

Per verificar usuaris al **SAMBA**:
```shell
sudo pdbedit -L
```

És perfectament normal que no surti cap usuari o grup si acabem d'instal·lar **SAMBA**, ja que no n'hi ha cap usuari creat.

Per crear un usuari al **SAMBA**:

```shell
sudo smbpasswd -a ubuntu
```

Haurem de posar la contrasenya per l'usuari ***ubuntu*** dues vegades.

Si fem un altra vegada un pdbedit:

```shell
sudo pdbedit -L
ubuntu:1000:
```

Ara si surt l'usuari Ubuntu. Podem ara muntar la carpeta compartida amb l'usuari ***ubuntu*** amb `cifs-utils`:
``` shell
sudo apt install cifs-utils
```

Per muntar la carpeta compartida, hem de crear un directori a `/mnt`:
```shell
sudo mkdir /mnt/smb ; cd /mnt
```
i ara fem:
```shell
sudo mount -t cifs //192.168.209.2/cp1 /mnt/smb/ -o username=ubuntu
Password for ubuntu@192.168.205.6/cp1:
```

Ara, cada vegada que entrem al directori `/mnt/smb`, estarem entrant a la carpeta compartida al ***SAMBA***.

---
# Connexió des de Windows

---

# NFS - Compartir entre Linux

Per poder compartir arxius entre dispositius Linux, necessitarem el Network file system (tant al servidor com al client):

```shell
sudo apt install nfs-kernel-server
```

Posem que volem compartir el directori que es troba a `/home` i s'anomena `nfs`:

```shell
cd /home ; sudo mkdir nfs ; sudo chmod 777 nfs/
```

Ara, anem editem l'arxiu `/etc/exports`:

``` shell
sudo nvim /etc/exports
```

Posarem el següent a última linea:

``` ini
/home/nfs          *(rw)

```
Aquí estem declarant que el directori /home/nfs s'ha de compartir amb aquestes opcions:
- * : Compartit amb totes les màquines de la xarxa 
- **rw**: Lectura i Escriptura.
També existeixen les opcions:
- ro: read only
- **root_squash**: Canvia la propietat de root a nobody.
- **no_root_squash**: permet que els usuaris root actuin com root.
- **subtree_check**: revisa permisos dels fitxers abans de crear.
En cas de voler compartir-ne només a una màquina en específic, cal posar l'adreça IP en comptes de "asterisc".

Per aplicar la configuracio, fem la seguent commanda:
```shell
sudo exportfs -a
```

Ara, en el client, muntem el directori compartit: 

anem a mnt:
```shell
cd /mnt
```

creem la carpeta nfs:
```shell
mkdir nfs
```

muntem el directori amb format nfs:
```shell
sudo mount -t nfs 192.168.20.2 /home/nfs
```
Aquí s'ha d'indicar la ruta absoluta

## Perfil mòbil
Pel perfil mòbil, al client, haurem d'editar el fitxer fstab i posar el següent:

```ini
192.168.209.2:/home       /home     nfs     default    0 0 
```
Aquí, estem declarant que, durant systemd inici, farà que fstab munti la carpeta /home assignada a nosaltres al servidor **samba**.


``` ini
//192.168.XXX.XXX/share /home/ubuntutower/smbshare cifs username=myname,password=nicetry,uid=1000,gid=1000,noperms 0 0
```