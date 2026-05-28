#### Las 3 reglas de los hijos en DTD
1. **Si tiene etiquetas dentro (hijos)**: Se ponen los nombres de los hijos separados por comas y en orden estricto: `<!ELEMENT servidor (procesador, ram, tarjeta_red)>`
2. **Si solo tiene texto plano dentro**: Se usa la palabra `#PCDATA`: `<!ELEMENT ram (#PCDATA)>`
3. **Si es una etiqueta vacia**: Se utiliza la palabra `EMPTY`: `<!ELEMENT tarjeta:red EMPTY>`

#### Como declarar los atributos (`<!ATTLIST ...>`)
Para decirle a la DTD que una etiqueta lleva atributos, se usa esta estructura:
`<!ATTLIST nombre_etiqueta nombre_atributo TIPO_DATO OBLIGATORIEDAD>`
- El tipo de dato para el texto comun simple es `CDATA`.
- Si el atributo es obligatorio, se pone `#REQUIRED`.

Un ejemplo seria:
```DTD
<!ATTLIST servidor nombre CDATA #REQUIRED>
```
