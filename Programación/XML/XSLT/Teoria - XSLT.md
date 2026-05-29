### Estructura de plantillas XSLT
Un archivo XSLT es, en si mismo, un documento XML. Su raiz es siempre `<xsl:stylesheet>`o `<xsl:transform>`.
- **`<xsl:template match="...">`**: Es el bloque constructor. El atributo `match` utiliza una expresión XPath para indicar qué nodo del XML original debe activar esta plantilla. El valor `"/"` representa la raíz del documento.
    
- **`<xsl:apply-templates>`**: Le dice al procesador XSLT: _"Busca e introduce aquí las plantillas correspondientes para los nodos hijos de este elemento"_.
### B. Extracción de Datos y Bucles
- **`<xsl:value-of select="..." />`**: Extrae el valor de texto del nodo especificado por el atributo `select`.
- **`<xsl:for-each select="..." />`**: Itera sobre un conjunto de nodos que coinciden con la expresión. Dentro del bucle, el contexto cambia a cada nodo individual.
### C. Condicionales
- **`<xsl:if test="..." />`**: Ejecuta el bloque interno solo si la condición del `test` se cumple. No tiene un equivalente "else".
- **`<xsl:choose>`**: Funciona como un `switch-case`. Contiene uno o varios `<xsl:when test="...">` y un `<xsl:otherwise>` opcional para el caso por defecto.
### D. XPath: El Motor de Búsqueda
XSLT no se mueve a ciegas; utiliza **XPath** para navegar por el XML.
- `/` : Raíz del documento.
- `//` : Busca el nodo en cualquier profundidad del documento.    
- `.` : El nodo actual.
- `..` : El nodo padre.
- `@` : Selecciona un atributo (ej. `@id`).
- `[]` : Predicados para filtrar (ej. `libro[precio > 20]`).

