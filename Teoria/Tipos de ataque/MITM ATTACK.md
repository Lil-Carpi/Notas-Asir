Campo:
	[[Ciberseguridad]]
El [[Ciberataque]] MITM (Man In The Middle attack, o Ataque del Hombre En Escucha) es un ataque en el cual el atacante intercepta, escucha o modifica un mensaje que se está mandando por un [[Medio Inseguro]].

Un ejemplo de este ataque es el [[Sniffing]]. Consiste en interceptar una comunicación entre dos ordenadores diferentes y escuchar todo lo que se están mandando.

## Ejemplo de un ataque MITM:

Imagínate que Alice y Bob se quieren comunicar entre si, pero Malory desea interceptar la conversación mediante [[Sniffing]] y tiene la opcion de mandar falsos mensajes a Bob bajo el nombre de Alice ([[Suplantación de identidad]]).

1. Alice manda un mensaje a Bob, el cual es interceptado por Malory:
		Alice: "Hola Bob, soy Alice. Mandame tu clave de encriptación" -> Malory -> Bob
2. Malory manda el mensaje a Bob haciendose pasar por Alice
		Alice | Malory: "Hola Bob, soy Alice. Mandame tu clave de encriptación" -> Bob
3. Bob manda la clave de encriptación
		Alice | Malory <- clave de encriptación <- Bob
4. Malory reemplaza la clave de encriptación de Bob por el suyo
		Alice <- Clave de encriptación de Malory <- Malory | Bob
5. Alice se piensa que la clave de encriptacion es de Bob, y manda el mesaje encriptado
		Alice -> Nos vemos en el parque (encriptado con la clave de Malory) -> Malory | Bob
6. Malory lee el mensaje de Alice y lo encripta con la clave de encriptacion de Bob.
		Alice | Malory (Encriptado con la clave de Bob) Mensaje -> Bob
7. Bob piensa que el mensaje que ha recibido es de Alice y que este es seguro.