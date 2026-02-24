Kerberos es un protocolo de autenticacion de redes de ordenador creado por el MIT que permite a dos ordenadores en una [[Medio Inseguro|red insegura]] demostrar su identidad mutuamente de manera segura. Sus diseñadores se concentraron primeramente en un modelo de [[Modelo Cliente-Servidor|cliente-servidor]], y brinda autenticacion mutua: tanto cliente como servidor verifican la identidad de uno del otro. Los mensajes de autenticacion estan protegidos para evitar [[Eavesdropping|eavesdropping]] y [[Ataques de Replay]].

Kerberos se basa en criptografia de clave simetrica y requiere un tercero de confianza. Ademas, existen extensiones del protocolo para poder utilizar criptografia de clave asimétrica.

---
## Funcionamiento
A continuacion se describe someramente el protocolo. Se usaran las siguientes abreviaturas:
- AS = Autentication Server
- TGS = Ticket Granting Server
- SS = Service Server.
Resumiendo, el funcionamiento es el siguiente: el cliente se autentica a si mismo contra el AS, asi demuestra al TGS que esta autorizado para recibir un ticket de servicio (y lo recibe) y ya puede demostrar al SS que ha sido aprovado para hacer uso del servicio kerberizado.
En más detalle:

1. Un usuario introduce su nombre de usuario y password en el cliente
2. El cliente genera una clave hash a partir del password y la usará como la clave secreta del cliente.
3. El cliente envía un mensaje en texto plano al AS solicitando servicio en nombre del usuario. Nota: ni la clave secreta ni el password son enviados, solo la petición del servicio.
4. El AS comprueba si el cliente está en su base de datos. Si es así, el AS genera la clave secreta utilizando la función hash) con la password del usuario encontrada en su base de datos. Entonces envía dos mensajes al cliente:
    1. Mensaje A: Client/TGS session key cifrada usando la clave secreta del usuario
    2. Mensaje B: Ticket-Granting Ticket (que incluye el ID de cliente, la dirección de red del cliente, el período de validez y el Client/TGS session key) cifrado en primer lugar con la clave secreta del TGS y después con la clave secreta del usuario.
5. Una vez que el cliente ha recibido los mensajes, descifra el mensaje A para obtener el client/TGS session key. Esta session key se usa para las posteriores comunicaciones con el TGS. (El cliente descifra parcialmente el mensaje B con su clave secreta para obtener el TGT, pero no puede descifrar el TGT en sí puesto que se encuentra cifrado con la clave secreta del TGS). En este momento el cliente ya se puede autenticar contra el TGS.
6. Entonces el cliente envía los siguientes mensajes al TGS:
    1. Mensaje C: Compuesto del Ticket-Granting Ticket del mensaje B y el ID del servicio solicitado.
    2. Mensaje D: Autenticador (compuesto por el ID de cliente y una marca de tiempo), cifrado usando el client/TGS session key.
7. Cuando recibe los mensajes anteriores, el TGS descifra el mensaje D (autenticador) usando el client/TGS session key y envía los siguientes mensajes al cliente:
    1. Mensaje E: Client-to-server ticket (que incluye el ID de cliente, la dirección de red del cliente, el período de validez y una Client/Server session key) cifrado usando la clave secreta del servicio.
    2. Mensaje F: Client/server session key cifrada usando el client/TGS session key.
8. Cuando el cliente recibe los mensajes E y F, ya tiene suficiente información para autenticarse contra el SS. El cliente se conecta al SS y envía los siguientes mensajes:
    1. Mensaje E del paso anterior.
    2. Mensaje G: un nuevo Autenticador que incluye el ID de cliente, una marca de tiempo y que está cifrado usando el client/server session key.
9. El SS descifra el ticket usando su propia clave secreta y envía el siguiente mensaje al cliente para confirmar su identidad:
    1. Mensaje H: la marca de tiempo encontrada en el último Autenticador recibido del cliente más uno, cifrado el client/server session key.
10. El cliente descifra la confirmación usando el client/server session key y chequea si la marca de tiempo está correctamente actualizada. Si esto es así, el cliente confiará en el servidor y podrá comenzar a usar el servicio que este ofrece.
11. El servidor provee del servicio al cliente.

---
## Vulnerabilidades conocidas
### Ataques de red
- [[Eavesdropping]]
- [[Ataques de Replay]]

### Ataques de fuerza bruta (offline)
- [[Kerberoasting]] (Contra cuentas de servicio/SPN)
- [[AS-REP Roasting]] (Contra usuarios sin pre-autenticacion)

### Ataques de persistencia y falsificacion
- [[Golden Ticket]] (Falsificacion de TGT - Dominio total)
- [[Silver Ticket]] (Falsificacion de TGS - Servicio especifico)

### Pivoting
- [[Pass-the-Ticket]] (Robo y reutilizacion de tickets en memoria)
- [[Delegación Insegura]] (Robo de TGTs de administradores)