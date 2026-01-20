El virus CIH, tambien conocido como Virus Chernobyl, es un [[Virus informatico]] que ataca los sistemas Windows 9x, surgido en 1998.

El nombre original del virus (**CIH**) es un acronimo con las iniciales de su creador, Chen Ing Hau (陳盈豪, pinyin: _Chén Yínháo_), a la razon estudiante en la Universidad Tatung de Taipei (Taiwán). El sobrenombre posterior de "_Virus Chernobyl_" e debio a que la fecha de activacion del virus coincidia casualmente con el aniversario del accidente de Chernobil, ocurrido en la URRS el 26 de abril del 1986. En realidad, la fecha elegida se debia al cumpleaños del autor del virus.

En su momento fue considerado uno de los virus mas peligrosos y destructivos, capaz de eliminar informacion critica del usuario e incluso sobreescribir el sistema BIOS, impidiendo el arranque del equipo. Se calcula que el virus logró infectar a unos 60 millones de ordenadores en todo el mundo, ocasionando perdidas por valor de 1 000 millones de dolares, aunque otras fuentes rebajan dicha cuantia a una cuarta parte.

Chen dijo que su objetivo de crear el virus era basicamente dejar en ridiculo a ciertas compañias de software que presumian de la eficacia de sus programas antivirus. El joven programador declaro que en su descargo que, cuando algunos de sus compañeros propagaron el virus fuera de su Universidad, el mismo publico un antivirus disponible gratuitamente, desarrollandolo con la ayuda de otro estudiante, Wen Shi-hao (翁世豪). Por aquel entonces, los fiscales taiwaneses no pudieron imputar a Chen ningun delito, debido a que las victimas no presentaron cargos contra el. Estos hechos propiciarion que mas adelante se aprobase una nueva legislacion sobre delitos informaticos en Taiwan. Por su parte, Chen trabajo para la compañia taiwanesa Gigabyte como programador senior hasta que fundo su propia empresa llamada CIH

## ==Metodo de propagacion==

CIH tenia su caldo de cultio en sistemas Windows 95, 98 y Windows ME, sistemas basados en MS-DOS. Propagandose a traves de ficheros ejecutables de formato PE (Portable Executable). A partir de la siguiente generacion de sistemas Windows, basados en arquitectura NT, el virus dejo de propagarse, y a dia de hoy se considera practicamente erradicado.

CIH no empleaba ninguna tecnica concreta para difundirse, aprovechando los cauces habituales usados por otros virus de la epoca: mensajes de correo electronico, transferencia de ficheros por FTP, CD-ROM, Disquetes, etc. Despues, habia que esperar a que el archivo infectado se ejecutase en el sistema, tras lo cual el virus quedaba residente en la memoria, permaneciendo alli a la espera de infectar mas programas y archivos. Asimismo, CIH ponia em practica tecnicas avanzadas para elevar sus privilegios de ejecucion, saltando desde el nivel destinado a las aplicaciones de usuario (anillo 3) hasta el nivel asignado al nucleo del sistema operativo (anillo 0). Esto le permitia interceptar las llamadasa al sistema y burlar la deteccion del software antivirus.

![[anillos de privilegios.png]]

## ==Metodo de infeccion==

El virus CIH infectaba archivos ejecutables de Windows con formato PE (*.EXE*). Cuando se abria cualquier archivo de extension EXE, el virus instalado en memoria comprobaba si este disponia de huecos suficientes; en caso afirmativo, lo infectaba, e inmediatamente verificaba la fecha del dia para decidir si era tiempo de activarse.

Tras la infeccion, los archivos presentaban el mismo tamañno que al principio, debido al sofisticado metodo de infeccion puesto en practica. El virus lograba "inyectar" codigo malicioso en el ejecutable, sin aumentar su tamaño (lo que dificultaba la deteccion), aprovechando que los huecos internos de la estructura del archivo. CIH troceaba su propio codigo (apenas 1KB) para ajustarse a los huecos disponibles. De esta forma, lograba inocularse en nuevos archivos ejecutables. Por esta peculiaridad, recibio el apelativo de "_Spacefiller_" ("Tapahuecos") en la jerga tecnica.

## ==Efectos==

El 26 de abril, fecha de activacion en casi todas las variantes del virus CIH, este iniciaba el ataque usando dos tacticas diferentes.

La primera consistia en soreescribir la tabla de particiones del disco duro (MBR) con datos aleatorios, comenzando por el sector 0, hasta provocar el colapso del sistema. Esta sobrescritura impedia que el ordenador pudiese arrancar y hacia casi imposible recuperar los datos. Tras esto, cuando el usuario trataba de reiniciar el equipo, nada se mostraba en la pantalla excepto el mensaje de error: "`DISK BOOT FAILURE`", lo que indicaba que el virus habia formateado el disco.

La segunda ocasionaba graves daños en las computadoras con microproceaador Pentium y placa compatible con el chipset Intel 430TX. Este ataque consistia en grabar informacion basura en la memoria flash del sistema BIOS, dejandolo inservible. Lo que causaba que tambien el hardware fuese inservible.

Todas las variantes del virus CIH presentaban un _modus operandi_ similar: Borran los primeros 2048 sectores del disco duro (alrededor de 1MB) y ademas, si el sistema no esta protegido, intentan sobrescribir la memoria del BIOS, dejando inutilizable el computador hasta el recambio del chip del BIOS o de la placa base en su totalidad.

## ==Versiones==

**CIH v1.2/CIH.1103**
	Version mas comun. Se activaba el 26 de abril.
	Contiene la frase: `CIH V1.2 TTIT`
**CIH v1.3/CIH.1010A y CIH.1010.B**
	Esta version tambien se activaba el 26 de abril.
	Contiene la frase: `CIH v1.3 TTIT`
**CIH v1.4/CIH.1019**
	Esta version se activaba el dia 26 de cualquier mes. Aun puede encontrarse en ciertos sistemas antiguos, aunque es poco frecuente.
	Contiene la frase: `CIH v1.4 TATUNG`
**CIH.1049**
	Esta version se activaba el 2 de agosto en lugar del 26 de abril.
**CIH.1106**
	Esta version se activaba el dia 2 de cualquier mes