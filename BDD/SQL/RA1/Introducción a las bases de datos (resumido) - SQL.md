#SQL - Structured Query Language
Proveniente de [[Índice - SQL]]

---
### Almacenamiento: Tipos de ficheros
Es la base fisica de como el software guarda la informacion en el disco.
- **Ficheros secuenciales:** Funcionan como una cinta de video antigua; para llegar al dato 10, debes pasar por los datos anteriores obligatoriamente, del 1 hasta el 9. Es extremadamente lento para grandes volumenes de datos.
- **Ficheros de acceso directo:** Permiten saltar directamente a una posicion especifica. Es mucho mas rapido, pero has de saber la posicion exacta del dato para hacer la busqueda.
- **Ficheros indexados:** El metodo estandar de los SGBD. Separa los datos en dos partes: un índice (con las claves) y los datos reales. Buscas en el indice y este te dice donde esta el dato, permitiendo busquedas rapidas por DNI, nombre o telefono.

---
### Estructura: Esquemas y Arquitectura ANSI/SPARC
Para que el sistema sea modular y escalable, se divide en tres niveles de abstraccion:
- **Nivel externo (vistas):** Es lo que ve cada usuario o aplicacion. Permite que un programa vea solo una parte de la base de datos (un esquema) adaptada a sus necesidades ocultando el resto por seguridad o simplicidad.
- **Nivel conceptual:** Es la vision global y logica de toda la base de datos. Aqui se definen las tablas (entidades), que datos contienen (atributos) y como se relacionan entre si. Es independiente del hardware y del software.
- **Nivel interno (fisico):** Es la representacion real en los discos. Detalla como se almacenan los bits, que indices se crean y como se optimiza el espacio y el rendimiento.

---
### Independencia de datos
Este es el objetivo de la arquitectura anterior: que puedas cambiar algo en una capa sin romper las demas.
- **Independencia fisica:** Puedes cambiar el servidor, el tipo de disco duro o la forma en la que se organizan los archivos (esquema interno) sin que el diseño logico de las tablas (esquema conceptual) o las aplicaciones de usuario se vean afectados.
- **Independencia logica:** Puedes modificar el esquema conceptual (como añadior una columna de "fecha de alta") sin que los programas que no usan ese dato tengan que ser reprogramados.

---
### Flujo de datos
Cuando un programa pide un dato (ej: "dame el alumno con DNI X"), ocurre el siguiente proceso:
1. **Validacion:** El SGBD comprueba la sintaxis y si tienes permiso usando los esquemas externo y conceptual.
2. **Optimizacion:** El SGBD decide el mejor camino fisico (usando el esquema interno) para encontrar el dato.
3. **Buffer y cache:** Comprueba si la "pagina" (bloque de datos) donde esta el registro ya esta en la memoria ram (buffers). Si no esta, pide al sistema operativo que se lo traiga desde el disco.
4. **Entrega:** El SGBD extrae el registro de la pagina, lo traduce segun el esquema externo y se lo entrega al programa.

---
### Modelo relacional: Tablas y relaciones
Es la forma de organizar datos estructurados mediante tablas.
- **Atributos y tuplas:** Las columnas definen el tipo de dato (atributos) y cada fila es un registro unico (tupla).
- **Clave primaria (PK):** Un identificador unico que garantiza que no hayan filas duplicadas (como el ID del cliente).
- **Clave foranea (FK):** Es un campo que apunta a la clave primaria de otra tabla. Es el puente que permite unir la informacion de diferentes tablas mediante un JOIN.

---
### Integridad referencial
Es la propiedad que garantiza que los datos siempre esten sincronizados y sean correctos.
- **Consistencia:** Si una factura dice que pertenece al cliente "123", ese cliente debe existir en la tabla de Personas.
- **Proteccion al borrar**: Si intentas borrar una persona que tiene facturas asociadas, el sistema te lo impedira para que no queden facturas "huerfanas" apuntando a nadie.