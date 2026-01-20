---

---
#SQL - Structured Query Language
Proveniente de [[Índice - SQL]]
- Autor: [Lil_Carpi](https://github.com/Lil-Carpi)
- Fecha de creación: 13-14/12/2025
---
```table-of-contents
```

---
#### Video de referencia:
![Aprende SQL](https://youtu.be/uUdKAYl-F7g)
[Aprende SQL](https://youtu.be/uUdKAYl-F7g)

---
## Notas a tener en cuenta
- TODOS los comandos terminan en `;`.
- Para hacer un UPDATE y DELETE, se recomienda usar la PK(`id`) para evitar errores, pero no es obligatorio.
- Todo lo que sale aquí va orientado para MariaDB por terminal, aunque sirve igual para MySQL Workbench, ya que los comandos son los mismos.
- Los ejemplos de este documento son simples, por lo que se usan VARCHAR y INT. Por favor, usad datos correspondientes indicados en [[Tipos de datos]].
- `user` Es una palabra reservada. NO LA USÉIS NUNCA POR USAR. En este caso, están porque facilita el entendimiento y la simplificación. En caso de tener que crear una tabla de usuarios, usad algo como `allusers` o similar, pero NUNCA `user`.
- La sensibilidad a las mayúsculas y minúsculas en MariaDB depende del `collation`. Normalmente, es **case-insensitive**, PERO NO SIEMPRE. 
- En producción, el `SELECT *` se ha de listar columnas especificas para evitar problemas de rendimientro y cambios de esquema.
### Tipos de datos
- **INT (INTEGER)**: Números enteros.
- **Float**: Decimales. Cuidado con los errores de precisión. 
- **Varchar**: Strings o letras.
- Es recomendable usar mas tipos de datos. 
Más información en [[Tipos de datos]]

![[Tipos de datos]]

---
# Bases de datos
## Creación de base de datos:

```SQL
CREATE DATABASE nombre;
```

---
Ver bases de datos

```SQL
SHOW DATABASES; 
```

---
### Seleccionar base de datos
```SQL
USE basededatos;
```

---
### Comentarios
```SQL
-- Cualquier cosa que sea escrita despues de "--" será ignorado.
```
---
### Crear tablas:
```SQL
CREATE TABLE animales (
	id INT NOT NULL AUTO_INCREMENT,
	tipo VARCHAR(255) DEFAULT NULL,
	estado VARCHAR(255) DEFAULT NULL,
	PRIMARY KEY (id)
);
```
> Entre paréntesis se colocan los datos que se van a almacenar en la tabla.
> Es recomendable separarlos entre espacios y seleccionar el tipo de dato que se va a usar con esa sección. También, se ha de seleccionar la clave primaria e indicarla entre paréntesis.


---
### Insertar datos en tablas:
```SQL
INSERT INTO animales (tipo, estado) VALUES ('Chanchito', 'Feliz');
```
> De la tabla `animales`, se le insertan a las columnas `tipo` y `estado` los valores `'Chanchito'` y `'Feliz'`, en ese orden.


---
### Modificación de tablas:
```SQL
ALTER TABLE animales MODIFY COLUMN id INT NOT NULL AUTO_INCREMENT;
```
> Caso hipotético en el cual la tabla que hemos creado antes no ha tenido la variable `AUTO_INCREMENT` desde un inicio.
> Nota: Se ha de indicar de nuevo el tipo de valor que se le da a la columna `id`, en este caso, `INT`. 

---
#### Renombrar tablas 
```SQL
RENAME TABLE user TO users;
```
>Renombra la tabla user a users

---
### Listar elementos de una tabla
```SQL
SELECT * FROM animales;
```
> Lista TODAS las columnas de la tabla animales

```SQL
SELECT * FROM ANIMALES WHERE ID = 1;
```
> Lista todas las columnas de la tabla animales donde el ID sea 1

```SQL
SELECT * FROM animales WHERE estado = 'Feliz';
```
> Lista todas las columnas de la tabla animales donde el estado sea 'Feliz'
> Nota: Los strings se pasan entre comillas simples (`''`).

```SQL
SELECT * FROM animales WHERE estado = 'Feliz' AND tipo = 'Chanchito';
```
>Lista todas las columnas de la tabla animales donde el estado sea 'Feliz' Y tipo sea 'Chanchito'.
> Nota: También se puede usar la variable `OR`.

También podemos hacer selecciones con condiciones más, menos, igual, etc:
```SQL
SELECT * FROM users WHERE edad > 20;
```
> Se puede cambiar el `>` por `<`, `>=`, `<=` y `!=`.

Se pueden filtrar también por strings de datos:
```SQL
SELECT * FROM users WHERE email = 'Antonio@fulano.com';
```
> Lista todas las columnas de la tabla users donde el email sea ' Antonio@fulano.com' 
#### `BETWEEN`
También se le pueden buscar ENTRE dos valores:
```SQL
SELECT * FROM users WHERE edad BETWEEN 15 and 30;
```
>Lista todas las columnas de la tabla users donde la edad se encuentre entre 15 y 30.
#### `LIKE`
Podemos buscar por valores que "se parece a", con los `%%`:
```SQL
SELECT * FROM users WHERE email LIKE '%gmail%'; 
```
> Lista todas las columnas de la tabla users donde el email se parezca a ' `%gmail%`'.
> Nota: En este caso, lo único que busca va a ser el valor '`gmail`'. Todo lo que se encuentre alrededor de ese valor será ignorado. También podemos hacer búsquedas como '`fulano%`', que sirve cuando sabemos el nombre del usuario, pero no sabemos que apellido tiene. 
> Las búsquedas con `%` al inicio, no usan índices.


#### `DISTINCT`
Sirve para filtrar los repetidos en caso de que se muestren varios valores iguales.

##### Sin `DISTINCT`:
```SQL
SELECT equipo_id WHERE edad < 35;
```
- `output`
```SQL
+-----------+
| equipo_id |
+-----------+
|        21 |
|        21 |
|        22 |
|        22 |
|        11 |
|        18 |
|        18 |
|        18 |
|        17 |
|        16 |
|         4 |
|        20 |
|         5 |
+-----------+
```

##### Con `DISTINCT`
```SQL
SELECT DISTINCT equipo_id WHERE edad < 35;
```
 - `output:`
```SQL
+-----------+
| equipo_id |
+-----------+
|         4 |
|         5 |
|        11 |
|        16 |
|        17 |
|        18 |
|        20 |
|        21 |
|        22 |
+-----------+

```


#### `ORDER BY`
Se pueden ordenar las consultas por orden ASCENDENTE (`ASC`) y DESCENDENTE (`DESC`):
```SQL
SELECT * FROM users ORDER BY edad ASC;
-- TAMBIEN
SELECT * FROM users ORDER BY edad DESC;
```


#### `max()` y `min()`
Las funciones `max()` y `min()` nos permiten filtrar por la cantidad máxima y mínima entre valores de INT:
```SQL
SELECT max(edad) AS mayor FROM users;
-- Tambien
SELECT min(edad) AS menor FROM users;
```
> 
> Nota: `AS` Se utiliza para dar nombre a la consulta que estamos dando.


#### Listar columnas específicas
Podemos filtrar directamente por columnas que nos interesen ver:
```SQL
SELECT id, name FROM users;
```
> Lista la columna id y name de la tabla users.


#### Listar con aliases (`AS`):
En caso de que tengamos un nombre de una columna que queramos ver con otro nombre sin modificarlo, podemos usar `AS`:
```SQL
SELECT id, name AS nombre FROM users;
```
> Lista la columna id y name como nombre de la tabla users.
> Nota: Las PRIMARY KEYS son inmutables ante esta condición.

---
### Update de registros

```SQL
UPDATE animales SET estado = 'Feliz' WHERE id = 3;
```
> Actualiza la tabla animales y pon el estado `'Feliz'` al registro que tenga un `id` de 3.
> Nota: Para hacer un UPDATE y DELETE, se ha de indicar el `id` de lo que se va a borrar o actualizar, aunque no es obligatorio. Se recomienda usar condiciones especificas (normalmente la PK) para evitar modificar/borrar múltiples filas por error.

---
### Borrar registros

```SQL
DELETE FROM animales WHERE id = 3;
```
> Borra el registro de la tabla animales en donde el `id` sea 3.
> Nota: Para hacer un UPDATE y DELETE, se ha de indicar el `id` de lo que se va a borrar o actualizar, aunque no es obligatorio.Se recomienda usar condiciones especificas (normalmente la PK) para evitar modificar/borrar múltiples filas por error.


---
### `LIMIT`
```SQL
SELECT * FROM users LIMIT 2;
```
> Lista todas las columnas de la tabla users y devuelve las primeras 2 líneas que encuentres.
> Nota: Se pueden cambiar por la cantidad de líneas que queramos ver.

---
## Joins (Relacionar tablas, conocido como Llaves Foraneas)

Tengo una tabla, la cual es:
```SQL
MariaDB [empresa]> SELECT * FROM users;
+----+---------+------+------------------+
| id | name    | edad | email            |
+----+---------+------+------------------+
|  1 | Juan    |   25 | juan@juan.com    |
|  2 | Alberto |   19 | alberto@juan.com |
|  3 | Leyre   |   22 | Leyre@juan.com   |
|  4 | Antonio |   52 | Antonio@juan.com |
|  5 | Ariel   |   31 | Ariel@juan.com   |
+----+---------+------+------------------+
```

Y quiero hacer un join de una tabla, la cual relacione él id de cada usuario con la creación de un producto en otra tabla llamada `products`. Se ha de hacer:
```SQL
CREATE TABLE products(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	created_by INT NOT NULL,
	marca VARCHAR(50) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(created_by) REFERENCES `users`(id)
) ENGINE=InnoDB;
```
> En la parte de la llave foranea, describimos:
> La llave foranea será la columna `created_by` y su referencia se encuentra en la tabla `users` y la columna es `id`.
> Nota: Hay que usar BACKTICKS para seleccionar la tabla con nombres especiales, en este caso, `user` es un nombre especial en MariaDB. En una situación real, NO UTILICEIS `user` COMO NOMBRE DE TABLA. Tambien, el `ENGINE` es IMPORTANTE ponerlo. Sin `ENGINE`, no hay FK.

---
#### Insercion de multiples datos con un solo `INSERT` 
Ahora, podemos añadir productos en la tabla products creadas por los usuarios de la tabla users:
```SQL
INSERT INTO products (name, created_by, marca)
VALUES
	('ipad', 1, 'apple'),
	('iphone', 1, 'apple'),
	('watch', 2, 'apple'),
	('macbook', 1, 'apple'),
	('imac', 3, 'apple'),
	('ipad mini', 2, 'apple');
```
> Inserta a la tabla productos dentro de las columnas name, created_by y marca...

Resultado:
```SQL
MariaDB [empresa]> SELECT * FROM products;
+----+-----------+------------+-------+
| id | name      | created_by | marca |
+----+-----------+------------+-------+
|  1 | ipad      |          1 | apple |
|  2 | iphone    |          1 | apple |
|  3 | watch     |          2 | apple |
|  4 | macbook   |          1 | apple |
|  5 | imac      |          3 | apple |
|  6 | ipad mini |          2 | apple |
+----+-----------+------------+-------+
```

---
## LEFT JOIN
Trae todos los registros dentro de la tabla de usuarios. En el caso de que se encuentren registros que se encuentren dentro de la tabla de productos que hayan sido creados por los usuarios que se encuentren en la tabla usuarios, aparecerán dentro de la consulta. En caso de que salgan usuarios que no hayan creado productos en la tabla de productos, simplemente márcamelos como `null`.


```SQL
SELECT u.id, u.email, p.name FROM users u LEFT JOIN products p ON u.id = p.created_by;
```
> Selecciona de la tabla de usuario, reconócelo con el alias `u`, y tráeme las columnas de id y email. Ahora, haz un LEFT JOIN con la tabla users como principal de producto, reconócelo como `p`, y tráeme la columna name y junta las columnas id de la tabla de usuario y created_by de la tabla de productos.

Resultado:
```SQL
+----+------------------+-----------+
| id | email            | name      |
+----+------------------+-----------+
|  1 | juan@juan.com    | ipad      |
|  1 | juan@juan.com    | iphone    |
|  2 | alberto@juan.com | watch     |
|  1 | juan@juan.com    | macbook   |
|  3 | Leyre@juan.com   | imac      |
|  2 | alberto@juan.com | ipad mini |
|  4 | Antonio@juan.com | NULL      |
|  5 | Ariel@juan.com   | NULL      |
+----+------------------+-----------+
```

---
## RIGHT JOIN
Mismo que `LEFT JOIN`, pero al revés.
Nos trae el producto y en caso de que exista, nos va a traer un usuario asociado.
```SQL
SELECT u.id, u.email, p.name FROM users u RIGHT JOIN products p ON u.id = p.created_by;
```
> Selecciona de la tabla de usuario, reconócelo con el alias `u`, y tráeme las columnas de id y email. Ahora, haz un RIGHT JOIN con la tabla de producto, reconócelo como `p`, y tráeme la columna name y junta las columnas id de la tabla de usuario y created_by de la tabla de productos.

Resultado:
```SQL
+------+------------------+-----------+
| id   | email            | name      |
+------+------------------+-----------+
|    1 | juan@juan.com    | ipad      |
|    1 | juan@juan.com    | iphone    |
|    2 | alberto@juan.com | watch     |
|    1 | juan@juan.com    | macbook   |
|    3 | Leyre@juan.com   | imac      |
|    2 | alberto@juan.com | ipad mini |
+------+------------------+-----------+
```

---
## INNER JOIN
Nos trae tanto usuarios como productos, pero siempre y cuando estos dos puedan ser asociados entre sí.
```SQL
SELECT u.id, u.email, p.name FROM users u INNER JOIN products p ON u.id = p.created_by;
```
> Selecciona de la tabla de usuario, reconócelo con el alias `u`, y tráeme las columnas de id y email. Ahora, haz un INNER JOIN con la tabla de producto, reconócelo como `p`, y tráeme la columna name y junta las columnas id de la tabla de usuario y created_by de la tabla de productos.

Resultado:
```SQL
+----+------------------+-----------+
| id | email            | name      |
+----+------------------+-----------+
|  1 | juan@juan.com    | ipad      |
|  1 | juan@juan.com    | iphone    |
|  2 | alberto@juan.com | watch     |
|  1 | juan@juan.com    | macbook   |
|  3 | Leyre@juan.com   | imac      |
|  2 | alberto@juan.com | ipad mini |
+----+------------------+-----------+
```

---
## CROSS JOIN
Devuelve el producto cartesiano entre dos tablas.
Básicamente:
![[Mezcla-cartesiana_(CROSS_JOIN).png]]

```SQL
SELECT u.id, u.name, p.id, p.name FROM users u CROSS JOIN products p;
```
>Nota: No es recomendado hacerlo, y si se ha de hacerlo, hay que tener cuidado por la cantidad insana de datos que nos puede escupir. Puede bloquear la BD si los datos que escupen son grandes, así que, repito, MUCHO CUIDADO.

Resultado:
```SQL
+----+---------+----+-----------+
| id | name    | id | name      |
+----+---------+----+-----------+
|  1 | Juan    |  1 | ipad      |
|  2 | Alberto |  1 | ipad      |
|  3 | Leyre   |  1 | ipad      |
|  4 | Antonio |  1 | ipad      |
|  5 | Ariel   |  1 | ipad      |
|  1 | Juan    |  2 | iphone    |
|  2 | Alberto |  2 | iphone    |
|  3 | Leyre   |  2 | iphone    |
|  4 | Antonio |  2 | iphone    |
|  5 | Ariel   |  2 | iphone    |
|  1 | Juan    |  3 | watch     |
|  2 | Alberto |  3 | watch     |
|  3 | Leyre   |  3 | watch     |
|  4 | Antonio |  3 | watch     |
|  5 | Ariel   |  3 | watch     |
|  1 | Juan    |  4 | macbook   |
|  2 | Alberto |  4 | macbook   |
|  3 | Leyre   |  4 | macbook   |
|  4 | Antonio |  4 | macbook   |
|  5 | Ariel   |  4 | macbook   |
|  1 | Juan    |  5 | imac      |
|  2 | Alberto |  5 | imac      |
|  3 | Leyre   |  5 | imac      |
|  4 | Antonio |  5 | imac      |
|  5 | Ariel   |  5 | imac      |
|  1 | Juan    |  6 | ipad mini |
|  2 | Alberto |  6 | ipad mini |
|  3 | Leyre   |  6 | ipad mini |
|  4 | Antonio |  6 | ipad mini |
|  5 | Ariel   |  6 | ipad mini |
+----+---------+----+-----------+
```

---
### Esquema de todos los JOIN:
- **LEFT**: Usuarios aunque no tengan producto.
- **INNER**: Solo relaciones validas.
- **RIGHT**: Casi nunca se usa en práctica.

---
## GROUP BY
Se utilizan con instrucciones que, por lo general, tienden a agrupar elementos.

```SQL
SELECT count(id), marca FROM products GROUP BY marca;
```
> Lista de la tabla products la cantidad de productos de las marcas que existan

Resultado:
```SQL
+-----------+-------+
| count(id) | marca |
+-----------+-------+
|         6 | apple |
+-----------+-------+
```

También podemos hacer lo mismo mezclándolo con un LEFT JOIN con la tabla de usuarios, donde la tabla primaria será la tabla de products:
```SQL
SELECT count(p.id), u.name FROM products p LEFT JOIN users u on u.id = p.created_by GROUP BY p.created_by;
```

Resultado:
```SQL
+-------------+---------+
| count(p.id) | name    |
+-------------+---------+
|           3 | Juan    |
|           2 | Alberto |
|           1 | Leyre   |
+-------------+---------+
```


### `HAVING`
Podemos añadir condiciones. Por ejemplo, que el conteo sea mayor a 2:
```SQL
SELECT count(p.id), u.name FROM products p LEFT JOIN users u on u.id = p.created_by GROUP BY p.created_by HAVING count(p.id) >= 2;
```

Resultado:
```SQL
+-------------+---------+
| count(p.id) | name    |
+-------------+---------+
|           3 | Juan    |
|           2 | Alberto |
+-------------+---------+
```

---
## `DROP`
Sirve para eliminar tablas enteras.
```SQL
DROP TABLE products;
```
> Elimina la tabla de products.
> Nota: ¡CUIDADO CON ESTO! ¡LOS CAMBIOS SON IRREVERSIBLES!

---
## `ON DELETE` / `ON UPDATE`
Se utilizan en **llaves foráneas** para definir que ocurre cuando el registro referenciado cambia o se elimina.
```SQL
FOREIGN KEY (created_by) REFERENCES users(id)
ON DELETE <acción>
ON UPDATE <acción>
```
> Nota: Si NO se especifica nada, el comportamiento por defecto suele ser `RESTRICT`.

---
### `ON DELETE`
Define qué pasa cuando se elimina un registro de la tabla padre.
```SQL
ON DELETE RESTRICT --Restrict por defecto.
```
> No permite borrar el registro padre si hay hijos asociados. Es la opción más segura.

Ejemplo:
- No se puede borrar un usuario si tiene productos creados.
Uso recomendado:
- Datos críticos.
- Integridad estricta.
- Producción.

---
### `CASCADE`
Al borrar el padre, se borran automáticamente los hijos. Es peligroso si no sabes lo que estás haciendo. CUIDADO CON ESTO.
```SQL
ON DELETE CASCADE
```

Ejemplo:
- Borras un usuario -> Se borran todos sus productos.
Usos:
- Datos temporales
- Relaciones dependientes al 100%

>[!Warning]
>Un `DELETE` mal hecho PUEDE BORRAR MEDIA BASE DE DATOS.

---
### `SET NULL`
Al borrar el padre, la FK del hijo pasa a `null`. La columna **DEBE PERMITIR `NULL`**.
```SQL
ON DELETE SET NULL
```

Ejemplo:
- El producto sigue existiendo, pero ya no tiene creador.
Usos:
- Históricos
- Logs
- Datos que deben conservarse.

---
### `NO ACTION`
En MariaDB/MySQL se comporta igual que `RESTRICT` (aunque internamente SQL define `NO ACTION`). Existe por la compatibilidad con SQL.
```SQL
ON DELETE NO ACTION
```

Usos:
- En MariaDB, ninguno xd.

---
## `ON UPDATE`
Define qué pasa si cambia el valor de la **clave primaria referenciada**. Cambiar un PK en producción **NO es buena practica**, aunque exista el `ON UPDATE CASCADE`.

### `CASCADE`
Si cambia el `id` del padre, se actualiza el de los hijos. Es poco común, pero es correcto.
```SQL
ON UPDATE CASCADE
```

Ejemplo:
- Cambia el id de un usuario -> se actualiza en la tabla products.

---
### `RESTRICT`/`NO ACTION`
Impide cambiar la PK si hay relaciones.
```SQL
ON UPDATE RESTRICT
```

Uso:
- Lo normal en producción.

---
### `SET NULL`
Si cambia la PK, la FK pasa a NULL. Esto es muy raro de ver en la práctica.
```SQL
ON UPDATE SET NULL
```

---
## Ejemplo realista
```SQL
CREATE TABLE products (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	created_by INT NULL,
	marca VARCHAR(50) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (created_by) REFERENCES users(id)
	ON DELETE SET NULL
	ON UPDATE CASCADE
) ENGINE=InnoDB;
```

Explicación:
- Si se borra el usuario -> el producto se conserva
- Si cambia el id -> se actualiza automáticamente.

---
### Ejemplo ESTRICTO
```SQL
FOREIGN KEY (created_by) REFERENCES users(id)
ON DELETE RESTRICT
ON UPDATE RESTRICT
```

Explicación:
- En este caso, no se borra ni se cambia nada sin limpiar antes dependencias.
- Es lo ideal para los sistemas serios, como en producción.

---
## Resumen rápido
- `RESTRICT`: Seguridad
- `CASCADE`: Automatismo (peligroso)
- `SET NULL`: Conservar datos
- `NO ACTION`: Igual que `RESTRICT` en MariaDB

>[!note]
>Si no sabes qué usar, `RESTRICT`.
>Si usas `CASCADE`, es porque sabes lo que haces y lo has pensado dos veces. 

