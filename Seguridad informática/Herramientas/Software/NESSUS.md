NESSUS es un programa de escaneo de [[Vulnerabilidad|vulnerabilidades]] en diversos sistemas operativos. Consiste en un Demonio o Diablo (daemon), _nessusd_, que realiza el escaneo en el sistema objetivo, y _NESSUS_, el cliente (basado en consola o grafico) que muestra el avance e informa sobre el estado de los escaneos. Desde consola _NESSUS_ puede ser programado para hacer escaneos. Desde consola _NESSUS_ puede ser programado para hacer escaneos programados con cron.
![[nessuslogo.png|400]]

## ==Método==

En operación normal, NESSUS comienza escaneando puertos con [[NMAP]] o con su propio escáner de puertos para buscar puertos abiertos e intentar varios [[Exploits]] para atacarlo. Las pruebas de vulnerabilidad, disponibles como una larga lista de plugins, son escritos en **NASL** (_NESSUS Attack Scripting Language_), un lenguaje scripting optimizado para interacciones personalizadas en redes.

Opcionalmente, los resultados del escaneo pueden ser exportados como informes en varios formatos, como texto plano, XML, HTML y LaTeX. Los resultados también pueden ser guardados en una base de conocimiento para referencia en futuros escaneos de vulnerabilidades.

Algunas pruebas de vulnerabilidades de NESSUS pueden causar que los servicios o sistemas operativos se corrompan y caigan. El usuario puede evitar esto desactivando "unsafe test" (Pruebas no Seguras) antes de escanear.

Actualmente existen dos versiones: "Home" y "Work". Esta ultima es de pago y sin restricciones.