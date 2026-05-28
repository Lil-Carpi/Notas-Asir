#XML - XML
Proveniente de [[Índice - XML]]

---
### Buen formato
Un archivo XML esta **bien Formado** (es decir, es sintácticamente correcto y no rompe el programa que lo lee) si cumple estrictamente las siguientes 5 reglas:

#### - 1. Elemento raíz único
Todo dentro del documento debe estar contenido dentro de una unica etiqueta principal. No puede haber nada fuera de ella (excepto el prologo XML de la primera linea):
```XML
// Bien:
<universidad><alumno>...</alumno></universidad>

// Mal:
<alumno>...</alumno><profesor>...</profesor>
```

#### - 2. Todo lo que se abre, se cierra
Cada etiqueta de apertura (`<modulo>`) debe tener su correspondiente etiqueta de cierre (`</modulo>`).
>[!Nota]
>Si una etiqueta no contiene texto dentro, se puede cerrar en si misma (etiqueta vacia), poniendo la barra al final: `<connector_esd />`

#### - 3. Las etiquetas "inbrican", no se solapan
Las etiquetas deben cerrarse en el orden de la mas interna a la mas externa. Como las muñecas rusas o los parentesis en matematicas.
```XML
//bien
<p>This is <bold>bold</bold> text</p>
//mal:
<p> This is <bold>bold text </p></bold>
```

#### - 4. Case sensitivity
En XML, `<Módulo>`, `<modulo>` y `<MODULO>` son tres etiquetas completamente diferentes. Tienen que coincidir de forma exacta al abrir y cerrar.
``` XML
// Mal
<Asir>...</asir>
``` 

#### - 5. Los atribuitos van entre comillas
Si una etiqueta lleva un atributo dentro (informacion exacta), su valor tiene que ir obligatoriamente ente comillas dobles (`""`) o simples (`''`).
```XML
// Bien
<servidor id="cpd-01">

// Mal
<servidor id=cpd-01>
```

---
## Etiqueta vs atributos
### Elements (etiquetas) vs Atributos
- **Elementos** (`<etiqueta>Texto</etiqueta>`): Se usan para los **datos principales** de la estructura.
- **Atributos** (`<etiqueta propiedad="valor">`): Se uusan para guardar **Metadatos** (informacion secundaria, identificadores, IDs o configuraciones que definen el elemento).

### Etiquetas vacías (*Empty Elements*)
Si una etiqueta no contiene texto ni subetiquetas dentro, no hace falta abrir y cerrar de forma tradicional. Se compacta en una sola linea cerrandola con una barra al final (`/>`). Se usan
muchisimo para registrar eventos o hardware que solo necesita atributos.
- **Sintaxis tradicional**: `<interficie tipo="ethernet"></interficie>`
- **Sintaxis compacta**: `<interficie tipo="ethernet" />`
