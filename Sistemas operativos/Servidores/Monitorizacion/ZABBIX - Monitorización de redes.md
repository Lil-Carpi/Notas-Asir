#MonitorizacionDeRedes #Manuales 
Proveniente de [[Sistema de monitorizacion de redes]]

---
![[Zabbix.png]]

Enunciado:
- [Pràctica 8.1. Inventari i monitorització](https://aulavirtual.iesthosicodina.cat/moodle/pluginfile.php/275267/mod_assign/intro/Pt8.1.%20Inventari%20i%20monitoritzaci%C3%B3.pdf?time=1743484617695)

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
- Identificador de red: 192.168.100.0/24
![[zabbixNatNetworkConfig.png]]

---
## Máquinas virtuales
Direcciones IP y Hostnames de las maquinas virtuales