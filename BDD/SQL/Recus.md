## Sentencia `SELECT`
La sentencia `SELECT` es la base de del **DML** (*Data Manipulation Language*).
#### Joins
```SQL
SELECT tabla1.columna, tabla2.columna
FROM tabla1
JOIN tabla2 ON tabla1.clave_foranea = tabla2.clave_primaria;
```
Los joins sirven para conectar dos tablas o mas a traves de columnas relacionadas (normalmente las clave primaria y la clave foranea)
- **Inner Join (JOIN)** Retorna solo las filas donde hay una coincidencia exacta en las dos tablas. Si un registro de una tabla no tiene correspondencia con la otra, el resultado desaparece.

**CASO A (DB `ciclismo`)** 
Objetivo: Listar ciclistas junto al nombre del equipo que pertenecen
Explicacion: Crizar la tabla `ciclista` con `equipo` usando el id del equipo (`e.id`)


```SQL
USE ciclismo;

SELECT c.nombre AS nombre_ciclista, e.nombre AS nombre_equipo, e.director
FROM ciclista c
INNER JOIN equipo e ON c.equipo_id = e.id;
```

**CASO B (DB `empresa`)** 
Objetivo: Mostrar los empleados junto con el nombre del departamento que trabajan
Explicacion: Relacionamos `empleado` y `departamento` mediante el codigo de departamento

```SQL
USE empresa;

SELECT e.apellido, e.cargo, d.nombre AS departamento
FROM empleado e
INNER JOIN departamento d ON e.departamento = d.numero;
```


- **LEFT JOIN**: Devuelve **todos** los registros de la tabla de la izquierda (`FROM tabla1`) y los registros coincidentes de la tabla de la derecha (`JOIN tabla2`). Si no hay coincidencia, los campos de la tabla de la derecha se muestran como `NULL`.

**CASO A (DB `atletisme`)**
Objetivo: Listar todos los atletas y ver que marcas han hecho (incluyendo los que no tengan marcas registradas, los que saldran con datos `NULL`)
```SQL
USE atletisme;

SELECT a.nomatleta, m.codireunio, m.registre
FROM atleta a
LEFT JOIN marca m ON a.numllicencia = m.numllicencia;
```

**CASO B (DB `empresa`)**
objetivo: Mostrar todos los clientes de la empresa y los identificadores de sus pedidos (para detectar que clientes nunca han comprado nada).
```SQL
USE empresa;

SELECT c.nombre AS cliente, p.id AS numero_pedido, p.total
FROM cliente c
LEFT JOIN pedido p ON c.id = p.cliente_id;
```

- **RIGHT JOIN**: Es exactamente el contrario a LEFT JOIN. Devuelve todos los registros de la tabla de la derecha y las coincidentes de la izquierda.
**CASO A (DB `ciclismo`)**
Objetivo: Listar todos los puertos de montaña de la base de datos y el nombre del ciclcista que los ha ganado, asegurando **todos los puertos** (si nadie lo ha ganado, el nombre del ciclista será `NULL`)
```SQL
USE ciclismo;

SELECT c.nombre AS ciclista_ganador, p.nombre AS nompuerto, p.altura
FROM ciclista c
RIGHT JOIN puerto p ON c.num = p.ganador_num;
```

**CASO B (DB `empresa`)**

- **CROSS JOIN**: Devuelve el producto cartesiano de las dos tablas (todas las combinaciones posibles de filas). No suele llevar la clausula `ON`.

#### Agrupamiento y consultas de resumen (GROUP BY y HAVING)
- **Group by**: Agrupa las filas que tienen los mismos valores en columnas especificas (por ejemplo, agrupar los atletas por `codigo_club`).
- **Funciones agregadas:** Se aplican a cada grupo para obtener un valor unico resumido:
	- `COUNT()`: Cuenta el numero de filas
	- `SUM()`: Suma los valores de una columna numerica.
	- `AVG()`: Calcula la media.
	- `MAX()` y `MIN()`: Obten el valor maximo y minimo.
- **HAVING**: Es el "WHERE" de los grupos. Se utiliza para filtrar resultados **DESPUES** de haber hecho la agrupacion (ej: `HAVING COUNT(atleta) > 5`). 
>[!note]
>*Recuerda, no puedes utilizar funciones agregadas en un **WHERE***

##### Funciones de MySQL (Trata de datos)
A parte de las de agregacion, se exige conocer funciones para manipular los valores de las columnas fila por fila:
-  **Gestion de strings (cadenas)**:
	- `CONCAT()`: Adjunta texto
	- `SUBSTRING() / MID()`:  recorta texto
	- `UPPER() / LOWER()`: Mayusculas / Minusculas
	- `LENGHT()` Longitud
- **Fechas y horas**:
	- `NOW() / CURDATE()` Fecha actual
	- `DATEDIFF()` Diferencia entre dos fechas
	- `YEAR() / MONTH() / DAY()` Año, Mes, Dia
- **Condicionales**
	- `IF(condicion, valor-si-es-cierto, valor-si-es-falso)`
	- `CASE WHEN --- THEN --- ELSE END`
- **Operadores**
	- Operadores de comparacion
		- `=, <>, >, <, BETWEEN, IN, LIKE` Con `%` y `_`
	- Logicos
		- `AND, OR, NOT`

#### Subconsultas (consultas anidadas)
Una consulta dentro de otra consulta (un `SELECT` dentro de un `WHERE`o del `FROM` de otro `SELECT`).
- Se utilizan mucho en operadores como `IN`, `ANY`, `ALL` o `EXISTS`.
- Ejemplo: Encontrar los atletas que corren mas rapido que la media (necesitas una subconsulta para calcular primero la media `AVG()`).

#### Control de volumen de datos `LIMIT`
- **LIMIT num**: Indica el numero maximo de filas que quieres que devuelva la consulta.
- **LIMIT offset, num** Indica desde que fila comenzar a contar (offset) y cuantas pedir.
>[!Nota sobre otros SGBD]
>Se menciona en el indice porque en otros sistemas de bases de datos no existe `LIMIT`. Por ejemplo, en SQL Server se usa `TOP`

#### Vistas (VIEWS)
Una vista es una tabla virtual que no almacena datos fisicamente, sino que deja una sentencia `SELECT` compleja (como un JOIN con muchas tablas).
- Permite guardar la query del JOIN y consultarlo como si fuera una tabla normal ( `SELECT * FROM vista_atletisme`), simplificando la seguridad y acceso a datos complejos.