#Manuales
M4: Sistemes Operatius en Xarxa
Grupo: G4
Año: 24/25**

![[banana.gif|400]]

**HECHO EN MARKDOWN - OBSIDIAN**

---
**_💡 NOTA: Este documento se encuentra en mi [carpeta compartida de drive](https://drive.google.com/drive/folders/1M5qyT5SJvh1-kIyB4v6okQtKAwJb1ifH?usp=sharing) y se encuentra en la dirección:_**
``` shell
  /"Seguridad Informática"/EXPERIENCIA/Proyectos/Samba-AD-DC/"Creación de un Samba Active Directory Domain Controller"
```

**_También tenéis acceso a las imágenes en:_**

``` shell
/"Seguridad Informática"/1.Imagenes/Proyectos/Samba-AD-DC
```

---
# ÍNDICE

```table-of-contents
```





# Pasos previos:

Se requiere la configuración de la interfaz de red de las máquinas virtuales en adaptador NAT y adaptador a Red Interna

---

	UBUNTU SERVER ADAPTER CONFIGURATION

![[u-server-nat.png]]

![[u-server-interna.png]]

---

	WINDOWS 11 CLIENT CONFIGURATION

![[w11-adapter.png]]


---

## INSTALACIÓN DEL UBUNTU SERVER

Para la instalación de ambas máquinas, utilizaremos VirtualBox. Al tener 2 adaptadores, nos saldrá en la configuración de red que el adaptador `enp0s8` está deshabilitado y que deberemos de configurarlo más adelante. 

![[adaptadores_de_red.png]]

Deberemos de seleccionar que la instalación se haga en el disco que le hemos asignado. He aquí un resumen de la instalación.

![[resumen_de_instalacion.png]]

También, configuraremos un usuario y el hostname:

``` shell
user: carpi
password: 12345
hostname: smb4duarte
```

![[username_password.png]]

## Configuración de los adaptadores de red + IPTABLES

Para la configuración de la red interna, utilizaremos el adaptador `enp0s8`. Deberemos de ir al archivo de configuración de netplan con el siguiente prompt:

``` shell
cd /etc/netplan/
nvim [TAB]
```

![[netplan-configuration.png]]
Aquí estaremos configurando que el adaptador `enp0s8` tenga la dirección IP 192.168.0.1/24.
Para aplicar la configuración:
```shell
sudo netplan apply
```

Para verificar que se ha configurado correctamente:

``` shell
ip a
```

![[ip-a.png]]

Aquí podemos ver que el adaptador `enp0s8` ahora sí tiene una dirección IP, que es la que acabamos de configurar (color naranja).

Para que nuestras máquinas clientes posean salida a internet, deberemos de configurar IPTABLES para el redireccionamiento entre adaptadores. E aquí un esquema de lo que se quiere conseguir:

[[Esquema de red (CONSULTINGTHOS.LAN).canvas|Esquema de red (CONSULTINGTHOS.LAN)]]
![[esquema-samba-ad-dc.png]]
``` python
🟩 - Dominio
🟧 - Ubuntu Server
⬛ - Servicios
🟦 - Red interna + clientes
🟥 - Red externa
🟪 - Internet
```

Tenemos los clientes conectados al adaptador `enp0s8` y queremos que IPTABLES redireccione todas las peticiones hacia el adaptador `enp0s3` (la NAT). Para ello, en `/etc/`, podemos colocar el script `rc.local`.

Crearemos el fichero en la dirección correspondiente y le daremos permisos de ejecución con el siguiente comando:
``` shell
touch rc.local
chmod +x rc.local
```

Ahora, editaremos el fichero y pondremos lo siguiente:
``` bash
#!/bin/bash 
iptables -t nat -F 
iptables -F 
iptables -X 
iptables -t nat -X 
iptables -Z 
iptables -P INPUT DROP 
iptables -P FORWARD DROP 
iptables -A INPUT -i lo -j ACCEPT 
iptables -A INPUT -i enp0s3 -j ACCEPT 
iptables -A INPUT -i enp0s8 -j ACCEPT 
iptables -A INPUT -i enp0s3 -m conntrack --ctstate ESTABLISHED,RELATED
iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT 
iptables -A FORWARD -i enp0s3 -o enp0s8 -m conntrack --ctstate ESTABLISHED,RELATED
iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE 
echo "1" > /proc/sys/net/ipv4/ip_forward 
ufw disable 
exit 0
```
![[iptables_rc-local.png]]

He de resaltar que en la línea 15 se encuentra:

```bash
echo "1" > /proc/sys/net/ipv4/ip_forward
```

Esto nos servirá para aceptar las redirecciones de IPTABLES.

Ejecutamos:
![[rc-local.png]]

Y si no nos da ningún tipo de error, estamos bien. Si eso ocurre, revisa la sintaxis del fichero.

---

## Instalación de Samba-ad-dc + Kerberos

Antes de nada deberemos de actualizar la máquina con el siguiente comando:

``` bash
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y
```

Una vez actualizados, instalaremos los siguientes paquetes:

``` bash
sudo apt install samba krb5-config winbind smbclient -y
```

Cuando nos llegue el momento de instalar `Kerberos`, nos pedirá el `REALM`. En realidad se refiere al nombre del dominio, y en nuestro caso es CONSULTINGTHOS.LAN (NOTA: toda la configuración del kerberos va en mayúsculas).

### Primera pantalla:

``` python
REALM = CONSULTINGTHOS.LAN
```

Después, el instalador nos solicita el nombre de los _servidores de Kerberos para nuestro reino_. En este caso, se refiere a los controladores de dominio que tengamos definidos. En este caso, solo tenemos uno y se llama SMB-CONSULTINGTHOS.LAN
### Segunda pantalla:

![[kerberos-realm.png]]

Por último, nos solicita el _servidor administrativo para nuevo reino de Kerberos_. Volvemos a escribir el nombre SMB-CONSULTINGTHOS.LAN 
### Tercera pantalla:

![[server-administrativo.png]]

Después de esto, la instalación continuará por algunos segundos más, pero ya no se necesita ningún aporte de información.

---

## Configurar Samba

Antes de continuar con la configuración, debemos de cambiar de sitio el archivo _smb.conf_ que contiene la configuración predeterminada.

Para cambiar el nombre del archivo, deberemos de escribir lo siguiente:

``` bash
sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.old
```

Ahora, ya podremos proseguir con la configuración.

Utilizaremos la herramienta **_samba-tool_** para configurar samba:

``` bash
sudo samba-tool domain provision
```

Se nos pedirá el `realm (es el nombre en mayúsculas del dominio usado por Kerberos)`, `domain (es el NetBIOS domain name, usado por Samba)`, `server role`, `DNS backend` y `DNS forwarder`. Deberemos de introducir lo siguiente en cada caso:

- **Realm**: CONSULTINGTHOS.LAN
- **DOMAIN**: CONSULTINGTHOS
- **SERVER ROLE**: dc
- **DNS backend**: SAMBA_INTERNAL
- **DNS forwarder**: 8.8.8.8

Además de la contraseña para el usuario "administrator".

![[samba-tool-domain-provision.png]]

Después de eso, comenzará a hacer algunas acciones y al finalizar nos ofrecerá un pequeño resumen de la configuración:

![[domain-provision results.png]]

Con esto, además de configurarse _Samba_, también se ha generado un archivo de configuración para _Kerberos_ en la ruta `/var/lib/samba/private/krb5.conf`. 
Deberemos de copiarlo a `/etc/` con:

``` bash
sudo cp /var/lib/samba/private/krb5.conf /etc
```

![[copia-kerberos-a-etc.png]]

---

## Detención de servicios

Lo siguiente será ajustar la resolución de nombres, y comenzaremos deteniendo y deshabilitando los servicios implicados:

``` bash
sudo systemctl stop smbd nmbd winbind systemd-resolved && \
sudo systemctl disable smbd nmbd winbind systemd-resolved
```

![[stop-servicios.png]]

A continuación, nos aseguramos de que el servicio _samba-ad-dc_ se podrá iniciar sin problemas, evitando cualquier enmascaramiento que pueda existir:

``` bash
sudo systemctl unmask samba-ad-dc
```

![[unmask-samba.png]]

---

## Configuración de resolv & hosts y activación de Samba

Ahora, deberemos de eliminar el archivo _resolv.conf_ que, en realidad, es un enlace a `../run/systemd/resolve/stub-resolv.conf`. Podemos comprobarlo con:

```bash
sudo ls -l /etc/resolv.conf
```

![[comprovacion-etc-resolv.png]]

Borramos el archivo y creamos uno nuevo para editarlo con:

``` bash
sudo rm /etc/resolv.conf
sudo nvim /etc/resolv.conf
```

![[borrado-resolv.png]]

Una vez dentro, deberemos de introducir lo siguiente:

``` ini
domain smb.consultingthos.lan
nameserver 127.0.0.1
```

![[resolv.png]]
Guarda y sal.

El archivo `/etc/hosts` tiene la relación de direcciones IP con sus correspondientes nombres lógicos. Cuando hagamos referencia a un ordenador que esté identificado en esta lista, el acceso es inmediato, algo así como un DNS integrado.

Este archivo contiene una referencia al nombre del propio servidor y le deberemos de añadir tanto el nombre DNS como el nombre _NetBIOS_ (**smb-consultingthos.lan y smb**) con su respectiva IP estática (la dirección interna del servidor, _192.168.0.1_):

![[hosts.png]]

solo nos queda iniciar el servicio samba y habilitarlo

``` bash
sudo systemctl start samba-ad-dc && sudo systemctl enable samba-ad-dc
```

![[start-samba.png]]

---

## Comprobaciones

Una vez terminado, haremos las comprobaciones con `samba-tool`.

Para consultar el nivel del dominio, deberemos de introducir lo siguiente:

``` bash
sudo samba-tool domain level show
```

![[samba-tool-domain-level-show.png]]

Aquí, comprobamos que el nivel del dominio y del bosque donde se encuentra equivale a una instalación _Windows Server 2008 R2_. 

Como parece que la instalación es correcta, probamos a crear un usuario:

``` bash
sudo samba-tool user create usuario-prueba
```

![[user-create.png]]

Funciona, así que bien.

### Confirmar que el DNS funciona

Lo primero será comprobar el servicio _LDAP_ sobre el protocolo _TCP_ y _Kerberos_ sobre protocolo _UDP_:

``` bash
host -t SRV _ldap._tcp.consultingthos.lan && \
host -t SRV _kerberos._udp.consultingthos.lan
```

Si todo es correcto, recibiremos lo siguiente:

![[host-tSRV_LDAP_kerberos.png]]

Por último, toca revisar la resolución de nuestro servidor:

```bash
sudo host -t A consultingthos.lan
```

![[host-tAconsultingthos.png]]

Para completar, usaremos `nslookup`.

Al ejecutar, nos aparecerá un “>”, donde podremos ir escribiendo argumentos.
Para comenzar, escribiremos el comando _server_ seguido de la _dirección IP_ del equipo y verificamos que resuelve bien.

Después, establecemos el tipo de consulta que utilice los registros SRV y añadimos el nombre de servicio a consultar. Al hacerlo, verificamos que también se resuelve de forma satisfactoria.

![[nslookup.png]]


### Comprobación de Kerberos

Con `smbclient`, podemos comprobar los servicios que puede obtener un determinado usuario. Por ejemplo, _"administrator"_

``` bash
sudo smbclient -L smb.consultingthos.lan -U 'administrator'
```

![[smbclient-L-smb.consultingthos-lan.png]]

Si la autenticación es correcta, ya sabremos que _Kerberos_ está haciendo su trabajo.

Si queremos, incluso podemos iniciar sesión en el servidor usando la cuenta de administración:

``` bash
sudo smbclient //localhost/netlogon -U 'administrator'
```

![[smbclient-localhost-netlogon.png]]

Para concluir, utilizaremos `testparm`, el cual comprueba la integridad de la configuración de _Samba_ (podemos también obtener un volcado completo del archivo pulsando `ENTER`):

``` bash
sudo testparm
```

![[testparm.png]]

Si has llegado hasta aquí…
Felicidades, has configurado correctamente Samba-ad-dc 🗿👌

### Posibles errores en la configuración
- Kerberos no da tickets correctos o no los da → Verificar la zona horaria.

## Creación de una carpeta compartida

### Creación de la carpeta

Para crear una carpeta compartida, primero tenemos que definirla en algún sitio

En este caso, estará en la carpeta `/home`

``` bash
mkdir /home Carpeta_compartida
chmod 777 /home/Carpeta_compartida
```

Para hacer una prueba más tarde, voy a colocar un fichero `README.txt` dentro de la carpeta:

``` bash
echo "carpeta_compartida" > /home/Carpeta_compartida/README.txt
```
![[path-carpeta-compartida+test.png]]
### Configuración smb.conf

Para que la carpeta sea visible desde los usuarios dentro del dominio, deberemos de ir a `/etc/samba` y añadir lo siguiente al fichero `smb.conf`:
``` ini
[Compartit]
	path = /home/Carpeta_compartida
	comment = Carpeta compartida desde Samba AD-DC
	writable = yes
	guests ok = yes
```
![[smb-conf-carpetacompartida.png]]

## Creación de un script para el dominio

En caso de que necesitemos crear un script de inicio de sesión para los usuarios que se administren desde un Windows como administrador, como `ROOT` deberemos de ir a la siguiente ruta:

``` bash
cd /var/lib/samba/sysvol/consultingthos.lan/scripts
```

En este caso, crearemos un pequeño script en `bat` (**Nombre: conecta.bat**) para que cuando un usuario al cual se le haya asignado el script, conecte automáticamente la carpeta compartida de antes en la unidad Z:\

![[script-creation+path.png]]

``` POWERSHELL
@echo off

net use z: \\smb4duarte\Compartit
```

![[script.png]]

---

# INSTALACIÓN Y CONFIGURACIÓN DEL WIN11 CLIENTE

## Instalación del Windows

Para que después se puedan utilizar los RSAT, deberemos de configurar la instalación de 
`Windows 11 PRO`.
![[win11PRO.png]]

Cuando lo tengamos listo, seleccionaremos el disco vacío e instalaremos.
![[disk-selection.png]]

Cuando nos aparezca la ventana de iniciar sesión con una cuenta de Microsoft, haremos lo siguiente:

``` python
Otras opciones de inicio de sesion > Conectar a dominio
```

Luego de esto, nos pedirá un nombre de usuario para la cuenta local. No hará falta una contraseña para el usuario si no queremos. 

``` python
username: carpi
password: 
```

![[username.png]]

## Configuración de la red y comprobación de conexión

Para que los equipos (servidor y cliente) se vean entre sí, deberemos de configurar las direcciones IP y el DNS:

``` python
Configuracion de Ethernet > (EDITAR)-Asignación de IP > Manual > IPv4

IP: 192.168.0.100
MASCARA: 255.255.255.0
PUERTA DE ENLACE: 192.168.0.1
DIRECCION DNS: 192.168.0.1
```

![[ip-configuration.png]]

Por si acaso, desactivaremos el _**Firewall de dominio**_:
``` python
Firewall y protección de red > Red de dominio > Desactivar el switch
```
![[domain-firewall.png]]

Para comprobar la conectividad entre cliente/servidor y conexión a internet, abrimos el CMD (a ser posible, cada comando en un CMD distinto) y ponemos lo siguiente

``` POWERSHELL
ping 192.168.0.1
ping 8.8.8.8
ping google.es
tracert google.es
```

![[ping+tracert.png]]

Si no tenemos ningún paquete perdido, podemos dar esta configuración por concluida.

## Conexión al dominio

Para conectarse al dominio haremos lo siguiente:

``` python
Panel de control > (buscar)-Dominio > Unirse a dominio > Cambiar > Dominio-(consultingthos.lan)
```

Si nos pide la configuración de administrador, la introducimos:

![[domain-union.png]]

Una vez introducido, nos aparecerá la confirmación:

![[domain-union-confirmed.png]]

Deberemos reiniciar el equipo para que se realicen los cambios.

Una vez reiniciado, iniciamos como "_administrator_":

``` python
"ABAJO A LA IZQUIERDA" > Otro usuario > 

	usuario: administrator
	password: -'CONFIDENCIAL'-
```

![[domain-administrator-logged-in.png]]

### Posibles errores de conexión al dominio:
- Verifica que el DNS está apuntando al servidor (**192.168.0.1/24**)
- **EN EL SERVIDOR** → Verifica que las resoluciones DNS estén bien configuradas (tanto en el /etc/resolv.conf como en /etc/samba/smb.conf)

## Instalación de las RSAT

Para instalar las RSAT, deberemos entrar a configuración y buscar "Características Opcionales"

``` python
Configuración > (buscar)-"Caracteristicas opcionales" > Ver caracteristicas > (buscar)-"RSAT"
```

![[rsat-search.png]]

Le damos a instalar y esperamos

![[rsat-adds.png]]

## Selección del servidor para administrar

Abriremos la aplicación "Administrador del servidor" y seleccionaremos el primer apartado ("**_Agregar otros servidores para administrar_**")

![[agregar-servidores-para-administrar.png]]

Añadiremos el servidor samba (aparecerá con su hostname)

![[añadir-server.png]]

Le damos a aceptar.

## Creación de un grupo de seguridad y un usuario

En este caso, crearemos al grupo CEO como grupo de seguridad y crearemos también al usuario Gerard Prat, el cual formará parte de ese grupo.

``` python
(buscar)-Usuarios y equipos de active directory > (clic derecho a consultingthos.lan)-nuevo > grupo > (nombre)-CEO
```

![[group-creation.png]]

Ahora el usuario:

``` python
(Dentro de)-users > (clic derecho en cualquier lado)-Nuevo > usuario
```

Ponemos las siguientes credenciales:

``` python
Nombre de pila: Gerard
Iniciales: GP
Apellidos: Prat
--
Nombre de inicio de sesión del usuario:
gprat@consultingthos.lan
```

![[user-creation1.png]]

Haremos que su contraseña no caduque nunca:

![[user-creation2.png]]

Cerraremos sesión (o reiniciar) e iniciaremos sesión como GPrat:

``` python
"ABAJO A LA IZQUIERDA" > Otro usuario > 

	usuario: gprat
	password: -'CONFIDENCIAL'-
```

![[user-login.png]]
![[user-confirmation.png]]

## Verificación de visibilidad de la carpeta compartida

Antes, hemos generado una carpeta compartida en el fichero `smb.conf` en el servidor. Verifiquemos a ver si es visible:

``` python
CTRL+E > (click derecho a "Este equipo")-Conectar unidad de red
--
Unidad: Z:
Carpeta: \\smb4duarte\Compartit
```

![[shared-directory-connection.png]]

Si le damos a finalizar, se nos abrirá automáticamente la unidad Z, y podremos ver el fichero `README.txt` que creamos cuando configuramos la carpeta compartida:

![[shared-directory-test.png]]

## Configuración del script de inicio de sesión

Iniciamos sesión como `**_administrator_**` y iremos a:

``` python
Usuarios y equipos de active directory > users > (click derecho)-Gerard GP. Prats > Propiedades > Perfil 
--
Script de inicio de sesión: conecta.bat
```

![[script-configuration-for-gprat.png]]

Aplicamos y reincidamos. Luego iniciaremos sesión como Gprat.

Abrimos el Explorador de archivos y automáticamente, en la pestaña de "Este equipo" debería de haber conectado automáticamente en la unidad Z: la carpeta compartida:

![[script-confirmation.png]]

