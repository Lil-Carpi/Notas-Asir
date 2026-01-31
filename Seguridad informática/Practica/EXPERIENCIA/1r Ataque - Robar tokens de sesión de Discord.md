
---
## DISCLAIMER:
***DECLARO QUE NO ME HAGO RESPONSABLE SI ALGUIEN UTILIZA LA INFORMACION DISPONIBLE EN ESTE DOCUMENTO PARA ACTIVIDADES MALINTENCIONADAS. CUALQUIER USO MALINTENCIONADO DE CODIGO PARA VULNERAR LA SEGURIDAD INFORMATICA DE UN DISPOSITIVO, GRUPO O ENTIDAD SIN NINGUN CONSENTIMIENTO ES UN ACTO ILEGAL Y ESTÁ PENADO POR LEY***.

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
Un token de sesion es una cookie que te permite ingresar a tu cuenta sin tener que pasar por el proceso de verificacion tipico de inicio de sesion (correo, contraseña, 2FA, etc.). La aplicacion de mensajeria de Discord (y es muy, muuuuy probable que muchas (por no decir todas) las aplicaciones de mensajeria o aplicaciones web lo tengan), tiene este token. Sirve basicamente para que no necesites iniciar sesion una y otra vez desde el mismo dispositivo, porque ya tienes ese token. Tambien se utiliza para la configuracion y creacion de bots.

Si quieres ver donde está tu token, deberas iniciar sesion desde  un navegador web. Cuando ya estés en tu cuenta, ya tendrás el token generado. 

Inspeccionas la pagina, vas al apartado de Network, le haces un F5, filtras "/api" y buscas uno que se llama "library". Ese archivo json es tu token. Por nada en el mundo vayas a compartir tu token a NADIE a no ser que quieres que entren a tu cuenta de discord.

Para verlo, selecciona encabezado y _Headers_. Te vas un poco hacia abajo y ahi lo tendras. Es un tochon de texto encriptado.

Teniendo esto en cuenta, podriamos generar un [[Script]] en javascript que intercepte la comunicacion cuando reinicies la pagina y que te pille el token. 

