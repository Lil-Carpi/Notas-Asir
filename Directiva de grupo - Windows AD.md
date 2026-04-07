## Sebastian Ariel Duarte Oruez
### Curs 2025/26
---
Una directiva de grupo son reglas y configuraciones que se utilizan en los dominios de Active directory. Principalmente, se utiliza cuando se necesitan aplicar reglas a equipos o grupos enteros de usuarios o computadores de forma centralizada, sin tener que ir por cada equipo de manera individual.

Es útil para el cambio de contraseñas cada X días, bloqueos a aplicaciones críticas, como consolas, PowerShell o panel de control, incluso deshabilitar el uso de memorias USB en los equipos para evitar instalaciones de software que puedan contener malware, o para evitar el robo de datos sensibles (aunque puedo sacar el móvil y pegarle una foto a la pantalla, pero bueno), configuración visual, instalación y actualización de software y mapeo de directorios compartidos por la red de manera automática.

---
## Configuración de fondo de pantalla personalizado
Para una de las cosas que sirven las directivas es para poner fondos de pantalla a grupos enteros. Se hace en el `gpmc.msc` (controlador de políticas de grupo)
Con `Ctrl + R`, ponemos `gpmc.msc`
![[Pasted image 20260407165951.png]]

Abrimos el bosque > Dominio > y hacemos clic derecho > Crear una GPO en este dominio y vincularlo aquí:
![[Pasted image 20260407170016.png]]

Le metemos un nombre potente:
![[Pasted image 20260407170035.png]]

Ahora, veremos que ya está instalado. Le damos clic derecho > Editar
![[Pasted image 20260407170055.png]]

Nos va a saltar otra ventana. Vamos a Configuración de usuario > Políticas > Plantillas administrativas > Escritorio
![[Pasted image 20260407170138.png]]

Aquí, veremos una plantilla llamada "Desktop Wallpaper". Damos doble clic
![[Pasted image 20260407170157.png]]

Antes de nada, debemos poner una imagen dentro de una carpeta compartida a la cual tenga acceso todo el dominio, en este caso `\\10.0.2.100\Malware`
![[Pasted image 20260407170231.png]]

La imagen es esta:
![[aniqtoohigh.png]]

Le ponemos la dirección en la que se encuentre el documento, que es `\\10.0.2.100\Malware\aniqtoohigh.png`, y le ponemos fill. Damos a Aplicar
![[Pasted image 20260407170309.png]]

Aquí, era antes de aplicar la directiva
![[Pasted image 20260407170422.png]]


Así queda al reiniciar sesión.
![[Pasted image 20260407170545.png]]