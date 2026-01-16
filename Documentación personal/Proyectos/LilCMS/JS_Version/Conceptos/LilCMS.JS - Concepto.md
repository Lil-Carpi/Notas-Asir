#LilCMS-JS 

LilCMS.JS es, como su nombre indica, un CMS de creación propia basado en node.js y JavaScript. Es un sistema de renderizado en cliente (*Client-Side Rendering*). El repositorio original es este:
### - [LilCMS - A personal-made CMS](https://github.com/Lil-Carpi/LilCMS)
### TENED EN CUENTA: 
- La versión original estará hecha en `PHP`, un lenguaje deprogramaciónn queaúnn no controlo.

El repositorio de ESTE proyecto será
### - [LilCMS.JS - A personal-made CMS, but on JavaScript](https://github.com/Lil-Carpi/LilCMS.js)



La idea es simple: Crear un Gestor de contenidos simple, útil e intuitivo, en el cual se puedan definir diferentes elementos (web components) para cada cosa, como footer, content, headers, navbar, etc.

El motor de base de datos para la gestión de usuarios será MariaDB.

Estructura de ficheros (Base):
```
.
├── assets
│   ├── css
│   ├── fonts
│   ├── img
│   └── js
│       └── web-component.js
├── favicon.ico
├── index.html
├── main
│   └── components
│       ├── content.html
│       └── footer.html
└── private

```

- **/assets**: Directorio contenedor de CSS, fuentes, imágenes a ser necesario y ficheros JS.
- **/main**: Directorio contenedor de componentes de la página web. Estos sirven para ser insertados mediante web-component.js al index.html principal. 
- **/private**: Directorio contenedor experimental. Probablemente segurizado mediante identificación por servidor SQL.


---
## Contenido importante por el momento:

### `/index.html`
```HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="/assets/js/web-component.js"></script>
</head>
<body>
    <h1>Desde index</h1>
    <mi-content></mi-content>
    <mi-footer></mi-footer>
</body>
</html>
```

### `/main/components/content.html`
```HTML
<h1>Contenido</h1>
   <ul>
	<li>
	    <p>Poco texto</p>
	    <p>Mucho texto</p>
	    <p>Medio texto</p>
	    <p>Completo texto</p>
	    <p>Final de texto</p>
	</li>
   </ul>

```

### `/main/components/footer.html`
```HTML
<h1>Contenido</h1>
   <ul>
	<li>
	    <p>Poco texto</p>
	    <p>Mucho texto</p>
	    <p>Medio texto</p>
	    <p>Completo texto</p>
	    <p>Final de texto</p>
	</li>
   </ul>

```

### `/assets/js/web-components.js`
```JavaScript
class MiFooter extends HTMLElement {
  connectedCallback() {
    fetch('../main/components/footer.html')
      .then(r => r.text())
      .then(html => this.innerHTML = html);
  }
}
customElements.define('mi-footer', MiFooter);

class MiContent extends HTMLElement {
  connectedCallback() {
    fetch('../main/components/content.html')
      .then(r => r.text())
      .then(html => this.innerHTML = html);

  }
}
customElements.define('mi-content', MiContent);

```

---
![[LilCMS.JS - v0.0.1 - Notas de versión]]
![[LilCMS.JS - v0.0.1 - Notas técnicas de versión]]