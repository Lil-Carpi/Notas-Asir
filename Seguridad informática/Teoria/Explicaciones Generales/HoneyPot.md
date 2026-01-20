
			A un panal de rica miel
			dos mil moscas acudieron
			por que por golosas murieron
			presas de patas en él.
											Félix María Samaniego, Fábula XI 


Un **_honeypot_**, o sistema **trampa** o **señuelo**, es una herramienta de la seguridad informatica dispuesto en una red o sistema informatico para ser el objetivo de un posible ataque informatico, y asi poder detectarlo y obtener informacion del mismo y del atacante.

El termino _honeypot_ significa en ingles, literalmente, "Tarro de miel". Sin embargo, los angloparlantes han usado el termino para referirse a otras cosas, relacionando siempre de manera eufemistica o sarcastica sobre esas otras cosas con un tarro de miel.
Asi, han usado el termino _honeypot_ para referirse a algo tentador que resulta ser una trampa, como en castellano lo es en la fabula de Félix María Samaniego, las moscas, indicado al principio de este recopilatorio.

La caracteristica principal de este tipo de programas es que estan diseñados no solo para protegerse de un posible ataque, sino para servir de señuelo invisible al atacante, con objeto de detectar el ataque antes de que afecte a otros sistemas criticos. El _honeypot_, sin embargo, puede estar diseñado con multiples objetivos, desde simplemente alertar de la existencia del ataque u obtener informacion sin interferir en el mismo, hasta tratar de ralentizar el ataque -_sticky honeypots_- y proteger asi el resto del sistema.
De esta forma se tienen _honeypots_ de baja interaccion, usados fundamentalmente como medida de seguridad, y _honeypots_ de alta interaccion, capaces de reunir mucha mas informacion con fines como la investigacion.

Si el sistema dispuesto para ser atacado forma toda una red de herramientas y computadoras dedicadas en exclusiva a esta tarea se le denomina _[[HoneyNet]]_.

_Honeypot_ es la terminologia con la que se describe el recurso informatico monitorizado usado para probar, que sea atacado o que se vea comprometido por ataques informaticos.

El uso principal que se le otorga a este señuelo de _network_ es el de distraer a posibles atacantes de informacion y maquinas mas inportantes de la network real, aprender sobre las formas de ataques que pueden sufrir y examinar dichos ataques durante y despues de la explotacion de un _honeypot_.

Dado el incremento de ataques, es relevante tener una forma para poder prevenir y ver [[Vulnerabilidad|vulnerabilidades]] de un sistema concreto de _network_. Es decir, se usa un señuelo para poder proteger una _network_ de presentes o futuros ataques.

----------------------
## ==Tipos de Honeypots==

Encontramos dos tipos principales de _honeypot_, estos son los fisicos y los virtuales:

- **Fisico**: se trata de una maquina real con su propia direccion IP, esta maquina simula comportamientos modelados por el sistema. Muchas veces no se utiliza tanto esta modalidad de _honeypot_ debido al precio elevado de adquirir nuevas maquinas, su mantenimiento y a la complicacion añadida de configurar los hardwares especializados.
- **Virtual**: el uso de este tipo de _honeypot_ permite instalar y simular huespedes en la network procedentes de distintos sistemas operativos, para hacer esto se debe simular el TCP/Ip del sistema operativo objetivo. Esta modalidad es la mas frecuente.

Ademas, tambien se pueden distinguir los _honeypot_ basandote en si su finalidad es la de investigacion o la de produccion:

- La tecnica de investigacion se dirige en juntar toda la informacion posible de los [[Black Hat (Sombrero Negro)]] a partir de darles el acceso a sus sistemas de seguridad para que infiltren.
- La tecnica de produccion, en cambio, va dirigida a proteger las compañias que preparen las _honeypot_, mejorando sus sistemas de seguridad.

Segun los criterios de diseño, los _honeypots_ se pueden clasificar en:

1. **Honeypots puros**: sistemas de produccion completos. las actividades del atacante se controlan mediante el uso de un _bug tap_ que se ha instalado en el enlace del _honeypot_ a la red. No es necesario instalar ningun otro software. Aunque un _honeypot_ puro es util, el sigilo de los mecanismos de defensa puede garantizarse mediante un mecanismo mas controlado.
2. **Honeypots de alta interacion**: imitan las actividades de los sistemas de produccion que alojan una variedad de servicios y, por lo tanto, un atacante puede tener muchos servicios para perder el tiempo. Al emplear maquinas virtuales, se pueden alojar multiples _honeypots_ en una sola maquina fisica. Por lo tanto, si un _honeypot_ se ve comprometido, se puede restaurar mas rapidamente. En general, los _honeypots_ de alta interaccion brindan mas seguridad al ser mas dificiles de detectar, pero su mantenimiento es costoso. Si las maquinas virtuales no estan disponibles, se debe mantener una computadora fisica por cada _honeypot_, lo que puede ser exorbitantemente costoso. Ejemplo: [[HoneyNet]].
3. **Honeypots de baja interaccion**: simulan solo los servicios solicitados con frecuencia por los atacantes. Dado que consumen relativamente pocos recursos, varias maquinas virtuales se pueden alojar facilmente en un sistema fisico, los sistemas virtuales tienen un tiempo de respuesta corto y requiere menos codigo, lo que reduce la complejidad de la seguridad del sistema virtual.

La _**sugarcane**_ (caña de azucar) es un tipo de _honeypot_ que se hace pasar por un [[Proxy]] abierto. A menudo puede adoptar la forma de un servidor diseñado para parecerse a un proxy HTTP mal configurado. Probablemente el _proxy_ abierto mas famoso fue la configuracion predeterminada de sendmail (antes de la version 8.9.0 en 1998) que reenviaba correos electronicos hacia y desde cualquier destino.

-----
## ==Spam Honeypots==

Los spammers abusan de recursos como los servidores de correo abiertos y los proxies abiertos. Algunos administradores de sistemas han creado _honeypots_ que imitan este tipo de recursos para identificar a los presuntos _spammers_.

Algunos honeypots de este estilo incluyen Jackpot, escrito en Java por Jack Cleaver; smtpot.py, escrito en Python por Karl Krueger y spamhole escrito en C.

----

## ==Honeypots de seguridad==

Programas como _Deception Toolkit_ de Fred Cohen se disfrazan de servicios de red [[Vulnerabilidad|vulnerables]]. Cuando un atacante se conecta al servicio y trata de penetrar en el, el programa simula el agujero de seguridad pero realmente no permite ganar el control del sistema. Registrando la actividad del atacante, este sistema recoge informacion sobre el tipo de ataque utilizado, asi como la direccion IP del atacante, entre otras cosas.

- Honeynet Project es un proyecto de investigacion que despliega redes de sistemas _honeypot_ (_[[HoneyNet|HoneyNets]]_) para recoger informacion sobre las herramientas, tacticas y motivos de los criminales informaticos.
- PenTBox Security Suite es un proyecto que desarrolla una Suite de Seguridad Informatica. Dentro de los programs que engloban esta disponible un Honeypot configurable de baja interaccion. El proyecto es multiplataforma, programado en Ruby y esta licenciado bajo GNU/GPL.

---

## ==Malware Honeypots==

Los _honeypots_ de _malware_ se utilizan para detectar el [[Malware]] mediante la explotacion de los vectores de replicacion y ataque conocidos de malware. Los vectores de replicacion, como unidades flash USB, se puededn verificar facilmente en busca de evidencia de modificaciones, ya sea a traves de medios manuales o utilizando _honeypots_ especiales que emulan las unidades.

---

## ==[[HoneyNet]]==

