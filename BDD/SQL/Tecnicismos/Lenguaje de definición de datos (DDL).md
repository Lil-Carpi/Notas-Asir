---

---
#SQL - Structure Query Language
Proveniente de [[Índice - SQL]]

---
El Lenguaje de definición de datos, es el que se encarga de la modificacion de la estructurea de objetos de la base de datos. Incluye ordenes para modificar, borrar o definir las tablas en las que se almacenan los datos de la base de datos.
Exsten cuatro operaciones basicas: CREATE, ALTER, DROP y TRUNCATE.

## CREATE (Crear)
Este comando permite crear objetos de datos, como nuevas bases de datos, tablas, vistas y [[Procedimientos almacenados|procedimientos almacenados]].
#### Ejemplo (Crear una tabla)

```SQL
CREATE TABLE clientes;
```

## Alter (Alterar)
Este comando permite modificar la estructura de una tabla u objeto. Se pueden agregar/quitar campos de una tabla, modificar el tipo de un campo, agregar/quitar indices a una tabla, modificar un trigger, etc.

##### Ejemplo (Agregar columna a una tabla)

```SQL
ALTER TABLE alumnos ADD edad INT UNSIGNED;
```

## DROP (Eliminar)
Este comando elimina un objeto de la base de datos. Puede ser una tabla, vista, indice, trigger, funcion, procedimiento o cualquier objeto que el motor de la base de datos soporte. Se puede combinar con la sentencia ALTER.

##### Ejemplo

```SQL
DROP TABLE alumnos;
```

## TRUCATE (Truncar)
Este comando solo aplica a tablas y su funcion es borrar el contenido completo de la tabla especificada. La ventaja sobre el comando DELETE, es que si se quiere borrar todo el contenido de la tabla, es mucho mas rapido, especialmente si la tabla es muy grande. La desventaja es que TRUNCATE solo sirve cuando se quiere eliminar absolutamente todos los registros, ya que no se permite la clausula WHERE. Si bien, en un principio, esta sentencia pareceria ser [[Lenguaje de Manupulación de Datos (DML)]], es en realidad una DDL, ya que internamente, el comando TRUNCATE borra la tabla y la vuelve a crear y no ejecuta ninguna transacción.

##### Ejemplo
```SQL
TRUNCATE TABLE nombre_tabla;
```