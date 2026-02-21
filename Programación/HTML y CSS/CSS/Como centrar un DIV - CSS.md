#CSS - CSS
Proveniente de [[Índice - CSS]]

---
Centrar un `div` puede parecer una de las cosas más complicadas de CSS al principio, sobre todo cuando quieres centrar muchos de ellos y no tienes ni pajotera idea de como hacerlo y muchas veces los estilos que aplicas no hacen lo que quieres.

---
## Flexbox
Es la forma más común y versátil hoy en día. Es lo ideal cuando se quiere centrar contenido tanto vertical como horizontalmente dentro de un contenedor
```css
.parent 
{
	display: flex;
	justify-content: center; /* Centrado horizontal */
	align-items: center; /* Centrado vertical */
	height: 100vh; /* Necesita una cierta altura para notar el centrado vertical */
}
```
Esto lo puedes usar para elementos individuales, galerías, barras de navegación o cuando no sabes el tamaño exacto del hijo.

---
## CSS GRID (la vía rápida)
Grid es extremadamente potente. Si solo tienes un elemento hijo y quieres centrarlo con el mínimo código posible, usa esto.
```css
.parent
{
	display: grid;
	place-items: center; /* Hace todo el trabajo en una sola línea */
	height: 100vh;
}
```
Usa esto cuando quieras un código limpio o cuando estés diseñando layouts complejos de rejilla donde el centro es solo una parte del diseño.

---
## Margen automático
Este es uno de los clásicos. Si solo te interesa centrar un bloque de forma horizontal y este tiene un ancho definido, esta es la técnica OG que sigue funcionando.
```css
.child
{
	width: 50%;
	margin: 0 auto;
}
```
Se usa para centrar bloques de texto, imágenes o contenedores de lectura dentro de una página, siempre que no necesites un centrado vertical.

---
## Posicionamiento absoluto
Este es solo para casos específicos. A veces, necesitamos que un elemento flote sobre otros y se ubique exactamente en el centro.
Se combina `position: absolute` con `transform`.
```css
.parent { position: relative; height: 300px; }

.child
{
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%); 
}
```
Esto te sirve para ventanas modales (pop-ups), tooltips o elementos decorativos que deben ignorar el flujo normal del documento.