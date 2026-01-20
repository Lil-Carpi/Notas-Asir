Metasploit es una herramienta que proporciona informacion acerca de [[Vulnerabilidad|vulnerabilidades]] y atuda a tests "[[Tipos de pruebas de penetración|pentesting]]" y el desarrollo de firmas para sistemas de deteccion de intrusos.

![[metasploitlogo.png]]
Es un proyecto de codigo abierto para la [[Ciberseguridad|seguridad informatica]]. Su subproyecto mas conocido es el **Metasploit Framework**, una herramienta para desarrollar y ejecutar [[Exploits]] contra una maquina remota. Otros subproyectos importantes son las bases de datos de _opcodes_ (codigos de operacion), un archivo de _shellcodes_, e investigacion sobre la seguridad. 

Inicialmente fue creado utilizando el lenguaje de programacion de _scripting_ **Perl** aunque actualmente el Metasploit Framework ha sido escrito de nuevo completamente en el lenguaje **Ruby**.

## ==Marco/Sistema Metasploit==

Los pasos básicos para la explotacion de un sistema que utiliza el sistema incluyen:

1. La seleccion y configuracion de un codigo el cual se va a _explotar_. El cual ingresa al sistema objetivo mediante el aprovechamiento de bugs; Existen cerca de 900 exploits incluidos para Windows, Unix/Linux y Mac OS X;
2. Opcion para comprobar si el sistema destino es susceptible a los bugs elegidos.
3. La tecnica para codificar el sistema de prevencion de intrusiones (IPS) e ignorar el payload codificado;
4. Visualizacion a la hora de ejecutar el exploit.

Metasploit se ejecuta en Unix (incluyendo Linux y Mac OS X) y en Windows. El sistema Metasploit se puede extender y es capaz de utilizar complementos en varios idiomas.

Para elegir un exploit y un payload, se requiere de cierta informacion sobre el sistema objetivo, como la version del sistema operativo y los servicios de red instalados. Esta informacion puede ser obtenida con el escaneo de puertos y "OS Fingerprint", puedes obtener esta informacion con herramientas como [[NMAP]], NeXpose o [[NESSUS]], estos programas, pueden detectar vulnerabilidades del sistema de destino. Metasploit puede importar datos de la exploracion de vulnerabilidades y comparar vulnerabilidades identificadas.


## ==Interfaces de Metasploit==

Hay varias interfaces para Metasploit disponibles. las mas populares son mantenidas por Rapid7 y Estrategico Ciber LLC.

- **Edicion Metasploit**
La version gratuita. Contriene una interfaz de linea de comandos, la importacion de terceros, la explotacion manual y fuerza bruta.

- **Edicion Community Metasploit**
En octubre de 2011, Rapid7 libero Metasploit Community Edition, una interfaz de usuario gratuita basada en la web para Metasploit. Esta incluye: Deteccion de redes, navegacion por modulo y la explotacion manual.

- **Metasploit Express**
En abril del 2010, Rapid7 libero Metasploit Express, una edicion comercial de codigo abierto, para los equipos de seguridad que necesitaban verificar vulnerabilidades. Ofrece una interfaz grafica de usuario, integra [[NMAP]] para el descubrimiento, y añade [[Ataque a fuerza bruta|fuerza bruta]] inteligente, asi como la recopilacion de pruebas automatizado.

- **Metasploit Pro**
En octubre del 2010, Rapid7 añadio Metasploit Pro, de codigo abierto para [[Tipos de pruebas de penetración|pruebas de penetación]]. Metasploit Pro inluye todas las caracteristicas de Metasploit Express y añade la exploracion y la explotacion de aplicaciones web.

- **Armitage**
Armitage es una interfaz grafica para [[Ciberataque|ciberataques]] del proyecto Metasploit. Visualiza objetivos y recomienda metodos de ataque. Es una herramienta para ingenieros en seguridad web y es de codigo abierto. Destaca por sus contribuciones a la colaboracion del equipo rojo, permitiendo sesiones compartidas, datos y comunicacion a traves de una unica instancia Metasploit. Es de codigo abierto y esta desarrollado por Raphael Mudge.

**Cobalt Strike** es la version de pago que mejora a Armitage, añade sus propias capacidades, y que ademas de aprovechar las capacidades de Metasploit, permite utilizar otras herramientas como Mimikatz.

## ==Payloads==

Metasploit ofrece muchos tipos de payloads, incluyendo:

- '**_Shell de comandos_**' permite a los usuarios ejecutar scripts de cobro o ejecutar comandos arbitrarios.
- '**_Meterpreter_**' permite a los usuarios controlar la pantalla de un dispositivo mediante VNC y navegar, cargar y descargar archivos.
- '_**Cargas dinamicas**_' permite a los usuarios evadir las defensas antivirus mediante la generacion de cargas unicas.

Desarrolladores originales:

- H. D. Moore (Fundador y arquitecto jefe)
- Matt Miller (Software) | Matt Miller (Desarrollador del nucleo 2004-2008)
- Spoonm (Desarrollador del nucleo 2003-2008)
