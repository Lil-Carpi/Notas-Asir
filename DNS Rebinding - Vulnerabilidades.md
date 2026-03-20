#Vulnerabilidades
La revinculación de DNS o DNS REBINDING es un ataque informático basado en [[DNS - Protocolos de red|DNS]] donde el atacante aprovecha una vulnerabilidad para trasformar el equipio en un *proxy* de red. Para esto, utiliza codigo embebido en paginas web aprovechandose de la politica del mismo origen de los navegadores.

---
## Uso
Normalmente las peticiones de codigo incorporado a las paginas web ([[Índice -JavaScript|Javascript]], Java, Flash) estan limitadas al sisito web desde el que se han originado, lo que se conoce como politica del mismo origen. La *DNS REBINDING* puede mejorar la habilidad de un [[Malware|malware]] basado en [[Índice -JavaScript|JavaScript]] para penetrar en redes privadas transtornando la politica del mismo origen. Usando DNS rebinding un atacante puede saltarse cortafuegos. navegar en intranets corporativas, mostrar documentos sensibles y comprometer maquinas internas que no esten parcheadas.

---
## Funcionamiento del DNS Rebinding
El atacante registra un dominio el cual delega a un servidor DNS que él controla. El servidor esta configurado para responder con un parametro de [[TTL - Protocolos|TTL]] muy corto, que previene que la respuesta sea cacheada.

La primera respuesta contiene la [[TCP_IP - Protocolos de red|Direccion IP]] del servidor con el codigo malicioso. Las consiguientes respuestas contienen direcciones IP de redes privadas falsas presumiblemente detras de un cortafuegos que es la meta del atacante.

Dado que son dos respuestas DNS completamente validas, autorizan al script el acceso a hosts dentro de la red privada. Devolviendo multiples direcciones IP, el servidor DNS habilita el script para escanear la red local o realizar actividades maliciosas.

---
## Proteccion
Las siguientes tecnicas pueden ser utilizadas para prevenir ataques de DNS Rebinding:

- *DNS pinning*: Fijando una direccion IP al valor recibido en la primera respuesta DNS. Esta tecnica puede bloquear algunos usos legitimos de [[DNS Dinamico - Protocolos de red|DNS Dinamico]].
- Bloqueando la resolucion de nombres externos en direcciones internas en los sevidores de nombres locales de la organizacion.
- Los servidores pueden rechazar peticiones [[HTTP - Protocolos de red|HTTP]] con una cabecera de Host irreconocible.

Con el tiempo, los fabricantes han tomado medidas para proteger del problema.

- *Flash Player* desde la version 9.0.115.0.
- Firefox. Proteccion adicional con el complemento NoScript, desde la version 2.0rc5.