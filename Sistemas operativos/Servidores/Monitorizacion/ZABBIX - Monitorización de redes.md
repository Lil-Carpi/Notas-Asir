#MonitorizacionDeRedes #Manuales 
Proveniente de [[Sistema de monitorizacion de redes]]

---
![[Zabbix.png]]

Enunciado:
- [Pràctica 8.1. Inventari i monitorització](https://aulavirtual.iesthosicodina.cat/moodle/pluginfile.php/275267/mod_assign/intro/Pt8.1.%20Inventari%20i%20monitoritzaci%C3%B3.pdf?time=1743484617695)
---
## Aclaraciones previas:
No estoy utilizando VirtualBox, sino KVM/QEMU para hacer esta práctica. Es posible que se vean algunas diferencias conforme al virtualizador antes mencionado.

---

**Zabbix** es un [[Sistema de monitorizacion de redes|Sistema de monitorizacion de redes]] creado por [Alexei Vladishev.]() Está diseñado para monitorizar y registrar el estado de varios servicios de red, Servidores y hardware de red.

Usa MySQL, PostgreSQL, SQLite, Oracle o IBM DB2 como base de datos. Su backend está escrito en C y su frontent en PHP. Zabbix ofrece varias opciones de monitorización para obtener información:
- Chequeos simples que pueden verificar la disponibilidad y el nivel de resupesta de servicios estándar como [[SMTP|SMTP]], o [[HTTP - Protocolos de red|HTTP]] sin necesidad de instalar ningún software sobre el host monitorizado.
- Ofrece la opción de instalar un agente Zabbix en máquinas [[Índice - Unix|UNIX]] y [[Windows|Windows]] para obtener estadísticas más detalladas, como la carga de CPU, la utilización de red y el espacio en disco.
- Como alternativa a instalar el agente sobre los hosts, Zabbix incluye soporte para monitorizar vía protocolos [[SNMP|SNMP]], [[TCP_IP - Protocolos de red|TCP]] e [[ICMP - Protocolos de red|ICMP]], como también sobre [[IPMI|IPMI]], [[JMX|JMX]], [[SSH|SSH]], [[Telnet|telnet]] y usando parámetros de configuración personalizados. Estas opciones de monitorización permiten recopilar información sobre los dispositivos de red, como direcciones [[IPV4 - Protocolos de red|IP]], nombres de host, fabricante y otros detalles relevantes. Por lo tanto, Zabbix puede desempeñar el papel de una herramienta de inventario de red al mantener un registro de los activos de la red y proporcionar una visión completa de la infraestructura de la red.
- Zabbix soporta una variedad de mecanismos de notificación en tiempo real, incluyendo [[XMPP|XMPP]].

Lanzado sobre los términos de la versión 2 de la [[GNU General Public License|GNU General Public License]], Zabbix es de software libre.

## Funcionalidades
- Alto rendimiento y alta capacidad ( posibilidad de monitorizar cientos de miles de dispositivos)
- Autodescubrimiento de servidores y dispositivos de red
- Monitorización distribuida y una administración Web centralizada
- Agentes nativos en múltiples plataformas
- Posibilidad de monitorización sin agentes
- Monitorización [[JMX|JMX]]
- Monitorización Web
- Configuración de permisos por usuarios y grupos
- Métricas SLA e [[ITIL|ITIL]]
- Sistema flexible de notificación de eventos (Email, XMPP, etc.)

-*Wikipedia ([Zabbix](https://es.wikipedia.org/wiki/Zabbix))*

---
## Creación del entorno de red
#### Entorno de red

El entorno de red será el siguiente:
Red NAT (Zabbix)
- ¡Identificador de red: 192.168.100.0/24
![[zabbixNatNetworkConfig.png]]

---
## Máquinas virtuales
Direcciones IP y Hostnames de las máquinas virtuales estarán definidas por el DHCP del propio virtualizador.

¡Las máquinas virtuales que usaré son las siguientes:
![[zabbixVmsShowcase.png]]

- **SUBUNTU**: Servidor Zabbix. IP: 125
- **CUBUNTU**: Ubuntu cliente con interfaz gráfica. IP: 146
- **WCLIENT**: Windows 11: IP 89

### Conexión entre máquinas:
Ping de WCLIENT a CUBUNTU y SUBUNTU:
![[zabbixWPing.png]]

Ping de CUBUNTU a SUBUNTU y WCLIENT:
![[zabbixCPing.png]]

Ping de SUBUNTU a CUBUNTU y WCLIENT:
![[zabbixUPing.png]]

---
## Instalación de los servidores
Para Zabbix, necesitamos Apache2 y una base de datos. Utilizaré MariaDB.
```shell
sudo apt install apache2 mariadb-server mariadb-client -y
```
![[zabbixapache&mariadbinstallation.png]]

Entramos a MariaDB y creamos la base de datos `zabbix` y al siguiente usuario:
`'zabbix'@'localhost' IDENTIFIED BY '12345'`
```SQL
CREATE DATABASE zabbix CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER zabbix@localhost IDENTIFIED BY '12345';
GRANT ALL PRIVILEGFES ON zabbix.* TO zabbix@localhost;
SET GLOBAL log_bin_trust_function_creators=1;
FLUSH PRIVILEGES;
EXIT;
```
![[zabbixDBConfig.png]]

---
## Instalación de Zabbix
Para instalar Zabbix, debemos clonarlo de su repositorio con wget:
```shell
wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_7.0-2+ubuntu24.04_all.deb
```
![[zabbixWget.png]]
Instalamos el repositorio y luego actualizamos repositorios:
```shell
sudo dpkg -i zabbix-release_7.0-2+ubuntu24.04_all.deb
sudo apt update
```
![[zabbixDpkgAndUpdate.png]]
También, instalamos Zabbix y algunas dependencias desde el nuevo repositorio:
```shel
sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent -y
```
![[zabbixinstallation.png]]

---
## Configuración de Zabbix 

Una vez instalado, importamos la estructura de la base de datos con zcat como root
```shell
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix
```
![[zabbixZcat.png]]

Ahora, quitamos el `log_bin_trust_function_creators`:
![[zabbixLBTFC.png]]

Lo siguiente que toca es tocar el fichero de configuración a `/etc/zabbix/zabbix_server.conf` para darle la contraseña del usuario de la base de datos:
![[zabbixDBUser&Passwd.png]]

Reiniciamos y encendemos los servicios de zabbix para aplicar la configuración:
```shell
sudo systemctl enable --now zabbix-server zabbix-agent apache2
sudo systemctl restart zabbix-server zabbix-agent apache2
```
![[zabbixServiceRestart.png]]

---
# Zabbix Setup
Ahora, podemos entrar al configurador de Zabbix directamente desde el navegador:
![[zabbixBrowsr.png]]

Ponemos el idioma (en mi caso, el español) y comprobamos que cumplimos con los requisitos previos. En mi caso, se cumplen todos.
![[zabbixRequirements.png]]

Luego, toca configurar la base de datos. Lo unico que hay que poner es la contraseña del usuario de la base de datos.
![[zabbixbrwserDBconfig.png]]

La siguiente pantalla es de horario, temas y nombre del servidor Zabbix. En mi caso, pondre `Rui López`, haciendo referencia a la apertura del mismo nombre, tambien conocida como Apertura Española (me gusta el ajedrez).
![[zabbixName.png]]

Resumen de la instalación:
![[zabbixResumen.png]]
Una vez hecho todo esto, nos dejará iniciar sesión.
El usuario que viene por defecto es `Admin`, y la contraseña es `zabbix`

La dasboard se ve así:
![[zabbixDashboard.png]]

---
## Instalación y configuración en las máquinas clientes
### Cubuntu
Instalaremos `zabbix-agent` primeramente en el cliente Ubuntu:
![[zabbixClientCubuntu.png]]

Ahora, hay que editar el fichero `/etc/zabbix/zabbix_agentd.conf` para ingresar los parametros del servidor y el hostname de la maquina actual:
```
Server=192.168.100.125
ServerActive=192.168.100.125
Hostname= Cubuntu-Zabbix
```

![[zabbixCServer.png]]
![[zabbixSActive&Hostname.png]]

Después, activamos el agente con:
```shell
sudo systemctl enable --now zabbix-agent
```
![[zabbixCEnable.png]]

### Windows 11
Para la instalacion de Zabbix en Windows, deberemos de buscarlo en internet y buscamos Zabbix Agent. Una vez que lo encontremos, seleccionamos el instalador MSI con las siguientes caracteristicas:
![[zabbixWin.png]]

Ahora, nos pedirá el nombre del dispositivo y la IP del servidor:
![[zabbixWinHostname.png]]

Abrimos el MSI que descargamos y le damos que si a todo. Para comprobar que está instalado correctamente, vamos al **Panel de control** > **Programas** > **Programas y características** y buscamos Zabbix:
![[zabbixWinPCs.png]]

---
## Parámetros de configuración
Nos devolvemos al servidor web y vamos a **Administración** > **Zabbix** > **Otras configuraciones** y ponemos el **Modo de inventario de host por defecto** en Automático![[zabbixAZOA.png]]

Ahora, para añadir los equipos, vamos a **Recopilación de datos** > **Equipos** y arriba a la derecha, damos al botón que pone **Crear equipo**
![[zabbixCreate.png]]

Nos saldra una ventana en la que podemos añadir nuestros clientes. Ponemos los hostname de cada uno:
![[zabbixCubuntuADD.png]]
![[zabbixAddWin.png]]
Quedará así:
![[ZabbixCreated.png]]