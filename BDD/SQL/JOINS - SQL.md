```table-of-contents
```
## Sentencia `SELECT`
La sentencia `SELECT` es la base de del **DML** (*Data Manipulation Language*).
#### JOINS
```SQL
SELECT tabla1.columna, tabla2.columna
FROM tabla1
JOIN tabla2 ON tabla1.clave_foranea = tabla2.clave_primaria;
```
Los **JOINS** sirven para conectar dos tablas o más a través de columnas relacionadas (normalmente la clave primaria y la clave foránea)
- **Inner Join (JOIN)** Retorna solo las filas donde hay una coincidencia exacta en las dos tablas. Si un registro de una tabla no tiene correspondencia con la otra, el resultado desaparece.
	- Se usa cuando necesitas datos de dos tablas y ambos deben existir obligatoriamente. Si falta información en una de las dos partes, el registro no te sirve.
		- **Palabras clave en enunciado:** "*Muestra los ciclistas **Y EL NOMBRE DE SU** equipo*", "*Listar facturas **CON LOS** nombres de sus clientes*".
---

**CASO A (DB `ciclismo`)** 
Objetivo: Listar ciclistas junto al nombre del equipo que pertenecen
Explicación: Cruzar la tabla `ciclista` con `equipo` usando él id del equipo (`e.id`)

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

---
- **LEFT JOIN**: Devuelve **todos** los registros de la tabla de la izquierda (`FROM tabla1`) y los registros coincidentes de la tabla de la derecha (`JOIN tabla2`). Si no hay coincidencia, los campos de la tabla de la derecha se muestran como `NULL`.
	- Se usa cuando la tabla principal (la de la izquierda) es sagrada y quieres conservar **TODOS SUS REGISTROS**, tengan o no datos asociados en la segunda tabla. Es la herramienta para detectar "faltas" o elementos vacíos
		- **Palabras clave en enunciados**: "*Muestra **TODOS** los clientes, **HAYAN HECHO O NO** pedidos*", "*Atletas que **NUNCA** han participado en una reunión*" (usando `WHERE tabla2.columna IS NULL`).

**CASO A (DB `atletisme`)**
Objetivo: Listar todos los atletas y ver que marcas han hecho (incluyendo los que no tengan marcas registradas, los que saldrán con datos `NULL`)
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


---
- **RIGHT JOIN**: Es exactamente el contrario a LEFT JOIN. Devuelve todos los registros de la tabla de la derecha y las coincidentes de la izquierda.
	- Es exactamente igual que el `LEFT JOIN`, pero protegiendo la tabla de la derecha (al contrario del LEFT JOIN). En los examenes se usan principalmente cuando se te obliga a mantener un orden concreto de tablas en el `FROM` pero necesitas conservar los datos de la segunda.
		- **Palabras clave en enunciados**: "*Muestra todos los departamentos, **INCLUSO LOS QUE NO TENGAN** enpleados asignados*" (si pones `empleado` en el FROM y `departamento` en el JOIN). 


**CASO A (DB `ciclismo`)**
Objetivo: Listar todos los puertos de montaña de la base de datos y el nombre del ciclcista que los ha ganado, asegurando **todos los puertos** (si nadie lo ha ganado, el nombre del ciclista será `NULL`)
```SQL
USE ciclismo;

SELECT c.nombre AS ciclista_ganador, p.nombre AS nompuerto, p.altura
FROM ciclista c
RIGHT JOIN puerto p ON c.num = p.ganador_num;
```

**CASO B (DB `empresa`)**
Objetivo: Mostrar todos los departamentos y los apellidos de los empleados asignados a ellos, asegurando que aparezcan todos los departamentos que tengan o no trabajadores.
```SQL
USE empresa;
SELECT e.apellido, d.nombre AS departamento
FROM empleado e
RIGHT JOIN departamento d on e.departamento = d.numero;
```


---
- **SELF JOIN (unión con la misma tabla)**: Técnica para relacionar una fila de una tabla con otra fila de la misma tabla. Es obligatorio usar alias diferentes (como `e` y `j`).
	- Se usa cuando una tabla contiene una relación **CONSIGO MISMA** (relaciones jerárquicas o emparejamientos internos).
		- **Palabras clave en enunciados**: "*Mostrar el empleado y el nombre de **SU JEFE/SUPERIOR***", "*Parejas de alumnos que van en la **MISMA** clase*".
	
**CASO A (DB `empresa`)**
Objetivo: Mostrar el apellido de cada empleado y de su jefe directo (superior)
```SQL
USE empresa;
SELECT e.apellido AS Empleado, j.apellido AS Su_Jefe
FROM empleado e
INNER JOIN empleado j ON e.superior = j.id;
```

**CASO B (DB `ciclismo`)**
Objetivo: Encontrar parejas de ciclistas distintos que comparten el mismo equipo.
```SQL
USE ciclismo;
SELECT c1.nombre AS Ciclista_1, c2.nombre AS Ciclista2, c1.equipo_id
FROM ciclista c1
INNER JOIN ciclista c2 ON c1.equipo = c2.equipo_id
WHERE c1.num < c2.num;
```

---

- **CROSS JOIN**: Devuelve el producto cartesiano de las dos tablas (todas las combinaciones posibles de filas). No suele llevar la cláusula `ON`.
	- Se usa para generar **combinaciones matemáticas de todo con todo** (matrices, cuadrantes, calendarios vacíos o datos masivos de prueba). No busca relaciones lógicas, busca multiplicar.
		- **Palabras clave en enunciados:** _"Genera un cuadrante con **todas las combinaciones posibles** entre atletas y reuniones"_.

No se usa casi nunca, así que ni ejemplo pongo. Además de que si lo haces en una db grande, la db se va de vacaciones por horas.

---
#### Agrupamiento y consultas de resumen (GROUP BY y HAVING)
- **Group by**: Agrupa las filas que tienen los mismos valores en columnas especificas (por ejemplo, agrupar los atletas por `codigo_club`).
- **Funciones agregadas:** Se aplican a cada grupo para obtener un valor unico resumido:
	- `COUNT()`: Cuenta el numero de filas
	- `SUM()`: Suma los valores de una columna numerica.
	- `AVG()`: Calcula la media.
	- `MAX()` Y `MIN()`: Obtén el valor máximo y mínimo.
##### `GROUP BY` + Funciones agregadas 
- Se usa cuando se necesitan **estadísticas, totales o resúmenes**, en lugar de ver los datos fila por fila. Si el `SELECT` tiene una función como `SUM()` y columnas normales a la vez, esas columnas normales tienen que ir en el `GROUP BY`. 
**CASO `COUNT()` y `AVG()` (`ciclismo`)**
- Objetivo: Contar cuántos ciclistas tiene cada equipo y calcular la edad media de sus corredores.
```SQL
USE ciclismo;
SELECT equipo_id, COUNT(*) AS total_ciclistas, AVG(edad) AS edad_media
FROM ciclista
GROUP BY equipo_id;
```

**CASO `sum()`, `MAX()` y `MIN()`**
- Objetivo: Saber cuánto dinero ha gastado en total cada cliente, cuál ha sido su pedido más caro y el más barato.
```SQL
USE empresa;
SELECT cliente_id, SUM(total) AS total_gastado, MAX(total) AS pedido_maximo, MIN(total) as pedido_minimo
FROM pedido
GROUP BY cliente_id;
```

---
- **HAVING**: Es el "WHERE" de los grupos. Se utiliza para filtrar resultados **DESPUÉS** de haber hecho la agrupación (ej.: `HAVING COUNT(atleta) > 5`). 
>[!note]
>*Recuerda, no puedes utilizar funciones agregadas en un **WHERE***

- Se usa para filtrar los resultados **después** de haber agrupado. Se usa única y exclusivamente cuando la condición del filtro implica una función agregada (`COUNT`, `SUM`, etc.).
	- **Palabras clave en enunciados:** _"Departamentos que tengan **más de 5** empleados"_, _"Clientes que hayan gastado **en total más de** 1000€"_.

- **WHERE**
- Se usa para descartar filas **ANTES** de hacer cálculos o agrupaciones. Actúa fila por fila sobre las tablas originales.
	- **Palabras clave en enunciados**: "*Solo de los empleados del departamento de **VENTAS***", "*Ciclistas con más de **30 AÑOS***".
**CASO COMBINADO (DB `empresa`)**
- Objetivo: Mostrar los departamentios que gasten más de 2000 en salarios, pero **SOLO TENIENDO EN CUENTA A LOS EMPLEADOS QUE SON '*EMPLEADO*'** (excluyendo directores o analistas).
```SQL
USE empresa;
SELECT departamento, SUM(salario) AS total_salarios
FROM empleado
WHERE cargo = 'EMPLEADO' -- Filtra antes de agrupar (fila por fila)
GROUP BY departamento
HAVING SUM(salario) > 2000; -- Filtra el resultado del grupo
```

---
##### Funciones de MySQL (Trata de datos)
A parte de las de agregacion, se exige conocer funciones para manipular los valores de las columnas fila por fila:
-  **Gestion de strings (cadenas)**:
	- `CONCAT()`: Adjunta texto
	- `SUBSTRING() / MID()`:  recorta texto
	- `UPPER() / LOWER()`: Mayusculas / Minusculas
	- `LENGTH()` Longitud
- **Fechas y horas**:
	- `NOW() / CURDATE()` Fecha actual / Fecha actual sin hora
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

- **Gestión de Strings (`CONCAT`, `SUBSTRING`, etc.)**
    - **Cuándo se usa:** Para embellecer o transformar la salida de textos.
	    - _Casos:_ Fusionar nombres y apellidos (`CONCAT`), sacar iniciales (`SUBSTRING`), o forzar búsquedas sin importar mayúsculas (`UPPER`/`LOWER`).
**CASO `CONCAT()` y `LOWER()` (DB `atletisme`)**
- Objetivo: Formatear el nombre del atleta y generar un correo electrónico ficticio en minúsculas.
```SQL
USE atletisme;
SELECT nomatleta, CONCAT(LOWER(nomatleta), '@atletisme.cat') AS email_ficticio
FROM atleta;
```

**CASO `SUBSTRING()` y `LENGTH()` (DB `ciclismo`):**
- Objetivo: Mostrar el nombre del ciclista, sus 3 primeras letras (iniciales) y cuántos caracteres mide su nombre.
```SQL
USE ciclismo;
SELECT nombre, SUBSTRING(nombre, 1, 3) AS iniciales, LENGTH(nombre) AS longitud_nombre
FROM ciclista;
```

- **Fechas y Horas (`DATEDIFF`, `YEAR`, etc.)**
    - **Cuándo se usa:** Para calcular antigüedades, plazos o filtrar por momentos del tiempo.
	    - _Casos:_ Saber cuántos días dura un torneo (`DATEDIFF`), o listar pedidos hechos solo en el año actual (`YEAR(fecha) = YEAR(CURDATE())`).
**CASO `YEAR()`, `MONTH()`, `DAY()` y `CURDATE()` (DB `atletisme`):**
- Objetivo: Descomponer la fecha de inicio de las reuniones y filtrar solo las que se hicieron en el mes de julio.
```SQL
USE atletisme;
SELECT nomreunio, YEAR(dataini) AS anyo, MONTH(dataini) AS mes, DAY(dataini) AS dia
FROM reunio
WHERE MONTH(dataini) = 7;
```

**CASO `DATEDIFF()` y `CURDATE()` (DB `empresa`):**
- Objetivo: Calcular cuantos días hace que se realizó cada pedido respecto a la fecha actual.
```SQL
USE empresa;
SELECT id AS pedido_id, fecha, DATEDIFF(CURDATE(), fecha) AS dias_transcurridos
FROM pedido;
```

- **Condicionales (`IF`, `CASE`)**
    - **Cuándo se usa:** Cuando quieres que el valor de una columna **cambie según una regla de negocio** (crear etiquetas o clasificaciones dinámicas).
        - _Casos:_ Si un atleta tarda menos de 10s pon 'Élite', si no 'Normal' (`IF`); o estructurar tramos de sueldo (`CASE WHEN salario > 3000 THEN 'Alto' ... END`).

**CASO `IF()` (DB `ciclismo`)**
- Objetivo: Clasificar los puertos de montaña según su altura de forma binaria.
```SQL
USE ciclismo;
SELECT nombre, altura, IF(altura >= 1000, 'Alta Montaña', 'Media Montaña') AS categoria
FROM puerto;
```

**CASO `CASE WHEN` (DB `empresa`)**
- Objetivo: Crear tramos de comisión dinámicos según el salario del empleado.
```SQL
USE empresa;
SELECT apellido, salario,
	CASE
		WHEN salario < 1000 THEN 'Sin retención'
		WHEN SALARIO BETWEEN 1000 AND 2000 THEN 'Retención Estándar'
		ELSE 'Retencion Alta'
	END AS tipo impuesto
FROM empleado; 
```


---
#### Subconsultas (consultas anidadas)
Una consulta dentro de otra consulta (un `SELECT` dentro de un `WHERE`o del `FROM` de otro `SELECT`).
- Se utilizan mucho en operadores como `IN`, `ANY`, `ALL` o `EXISTS`.
- Ejemplo: Encontrar los atletas que corren mas rapido que la media (necesitas una subconsulta para calcular primero la media `AVG()`).
- **Cuándo se usa:** Cuando para responder a una pregunta, necesitas **un dato que todavía no conoces** y que requiere un cálculo previo.
	- **Palabras clave en enunciados:** * _"Muestra los empleados que ganan **más que la media**"_ (Subconsulta: calcula la media).
    - _"Atletas que corren en las **mismas especialidades que** el atleta X"_ (Subconsulta: busca las especialidades de X).
    - Asociado a operadores: `IN` (si la subconsulta devuelve una lista de valores), `ANY`/`ALL` (para comparaciones múltiples), `EXISTS` (para comprobar si hay resultados).

**CASO CON OPERADOR DE COMPARACIÓN `=` (Escalar - Devuelve 1 dato) (DB `empresa`)**
- Objetivo: Encontrar los empleados que ganan más dinero que la media salarial de la empresa.
```SQL
USE empresa;
SELECT apellido, salario
FROM empleado
WHERE salario > (SELECT AVG(salario) FROM empleado);
```

**CASO CON OPERADOR `IN` (Devuelve una lista) (DB `atletisme`)**
- Objetivo: Seleccionar los atletas que hayan hecho marcas inferiores a 10 segundos utilizando una subconsulta.
```SQL
USE atletisme;
SELECT nomatleta
FROM atleta
WHERE numllicencia IN (SELECT numllicencia FROM marca WHERE registre < 10);
```

**CASO CON OPERADOR `EXISTS` (Comprobación de existencia) (DB `ciclismo`)**
- Objetivo: Mostrar los equipos que tienen la suerte de tener al menos un ciclista que haya ganado algún puerto de montaña
```SQL
USE ciclismo;
SELECT e.nombre
FROM equipo e
WHERE EXISTS (
	SELECT 1 FROM ciclista c
	INNER JOIN puerto p ON c.num = p.ganador_num
	WHERE c.equipo_id = e.id
);
```

---
#### Control de volumen de datos `LIMIT`
- **LIMIT num**: Indica el numero maximo de filas que quieres que devuelva la consulta.
- **LIMIT offset, num** Indica desde que fila comenzar a contar (offset) y cuantas pedir.
>[!Nota sobre otros SGBD]
>Se menciona en el indice porque en otros sistemas de bases de datos no existe `LIMIT`. Por ejemplo, en SQL Server se usa `TOP`

**CASO `LIMIT num` (DB `empresa`)**
- Objetivo: Conseguir los 3 pedidos más caros de toda la base de datos.
```SQL
USE empresa;
SELECT id, total
FROM pedido
ORDER BY total DESC
LIMIT 3;
```

**CASO `LIMIT offset, num` (Paginación) (DB `ciclismo`)**
- Objetivo: Listar los ciclistas ordenados alfabéticamente, saltándose los 5 primeros (offset) y mostrando los 5 siguientes.
```SQL
USE ciclismo;
SELECT nombre
FROM ciclista
ORDER BY nombre ASC
LIMIT 5, 5;
```

---
#### Vistas (VIEWS)
Una vista es una tabla virtual que no almacena datos fisicamente, sino que deja una sentencia `SELECT` compleja (como un JOIN con muchas tablas).
- Permite guardar la query del JOIN y consultarlo como si fuera una tabla normal ( `SELECT * FROM vista_atletisme`), simplificando la seguridad y acceso a datos complejos.
- **Cuándo se usa:** Cuando escribes una consulta gigantesca (un JOIN de 4 tablas lleno de filtros) y no quieres tener que volver a escribir todo ese código mañana. Creas la vista y se queda "guardada" en la base de datos como un acceso directo seguro.
	- **Palabras clave en enunciados:** _"Crea un acceso simplificado..."_, _"Guarda la consulta anterior para que los usuarios puedan consultarla como si fuera una tabla"_.

**CASO CREACIÓN DE CONSULTA DE UNA VISTA (DB `atletisme`)**
- Objetivo: Crear una vista permanente que unifique los nombres de los atletas con sus marcas y la especialidad, para no tener que escribir el `JOIN` triple nunca más.
```SQL
USE atletisme;

CREATE OR REPLACE VIEW vista_resumen_marcas AS
SELECT a.nomatleta, m.registre, e.descespecialitat
FROM atleta a
INNER JOIN marca m ON a.numllicencia = m.numllicencia
INNER JOIN especialitat e ON m.codiespecialitat = e.codiespecialitat;

-- Ahora se puede usar como si fuera una tabla normal de la base de datos
SELECT * FROM vista_resumen_marcas WHERE registre < 12;
```

---
#### 1. Relacionar Tablas (Los JOINs)
- **"Y", "CON", "QUE TENGAN"** → **`INNER JOIN`**
    - _Ejemplo:_ "Ciclistas **y** sus equipos", "Facturas **con** sus clientes".
    - _Qué significa:_ Ambos datos tienen que existir sí o sí. Si un ciclista no tiene equipo, desaparece.
        
- **"TODOS", "INCLUIDOS LOS QUE NO", "AUNQUE NO TENGAN"** → **`LEFT JOIN`**
    - _Ejemplo:_ "**Todos** los clientes, **inclosos els que no** hagin fet comandes".
    - _Qué significa:_ La primera tabla es sagrada. No se puede borrar a ningún cliente, si no tiene pedido, se rellena con `NULL`.
        
- **"NUNCA", "QUE NO HAYAN..."** → **`LEFT JOIN` + `WHERE tabla2.columna IS NULL`**
    - _Ejemplo:_ "Atletas que **nunca** han participado en una reunión".
    - _Qué significa:_ Buscas los huecos vacíos que deja el `LEFT JOIN`.
        
- **"SU PROPIO...", "CONSIGO MISMO"** → **`SELF JOIN`**
    - _Ejemplo:_ "Empleados y el nombre de **su jefe**", "Parejas de ciclistas del **mismo** equipo".
    - _Qué significa:_ Usas la misma tabla dos veces en el `FROM` con alias distintos (`FROM empleado e INNER JOIN empleado j`).

#### 2. Totales y Estadísticas (Agrupaciones)

- **"POR CADA...", "SABER EL TOTAL DE...", "CUÁNTOS..."** → **`GROUP BY`**
    - _Ejemplo:_ "**Per cada** reunió mostra la **quantitat** d'atletes".
    - _Qué significa:_ Olvídate de ver filas individuales. El resultado se encogerá en grupos. **Regla de oro:** Cualquier columna que pongas en el `SELECT` que no tenga una función (`SUM`, `COUNT`) va directa al `GROUP BY`.
        
- **"FILTRAR UN TOTAL / CONTADOR" (Más de X, menos de X)** → **`HAVING`**
    - _Ejemplo:_ "Equipos con **más de 5** corredores", "Clientes que hayan gastado **más de 1000€**".
    - _Qué significa:_ Si vas a filtrar usando un `COUNT()` o un `SUM()`, está prohibidísimo usar `WHERE`. Tienes que usar `HAVING` al final de la query.
        
- **"SÓLO DE LOS QUE..." (Filtro individual)** → **`WHERE`**
    - _Ejemplo:_ "Solo de los empleados del departamento de **Ventas**".
    - _Qué significa:_ Filtras filas normales antes de hacer sumas o grupos.
        

#### 3. El dato oculto (Subconsultas)
- **"MÁS QUE...", "IGUAL QUE..." (Sin darte el número exacto)** → **`SUBCONSULTA`**
    - _Ejemplo:_ "Empleados que ganan **más que la media**", "Atletas que corren en las **mismas especialidades que el atleta X**".
    - _Qué significa:_ No sabes cuál es la media ni cuáles son las especialidades de X. Tienes que abrir paréntesis `()` en el `WHERE` y hacer un `SELECT` secundario para averiguarlo primero.
        

#### 4. Estética y Control
- **"LOS 3 PRIMEROS...", "EL MEJOR...", "EL MÁS RÁPIDO"** → **`ORDER BY` + `LIMIT`**
    - _Ejemplo:_ "Los 3 pedidos más caros".
    - _Qué significa:_ Ordenas de mayor a menor (`ORDER BY total DESC`) y cortas el grifo con `LIMIT 3`.
        
- **"SI PASA ESTO MUESTRA 'X', SI NO MUESTRA 'Y'"** → **`IF()`** o **`CASE WHEN`**
    - _Ejemplo:_ "Si el puerto mide más de 1000m pon 'Duro', si no 'Fácil'".
    - _Qué significa:_ Creas una columna condicional en el `SELECT`.
        
- **"QUE NO SE REPITAN LOS NOMBRES", "LISTA DE CATEGORÍAS ÚNICAS"** → **`SELECT DISTINCT`**
    - _Qué significa:_ Evitas que el mismo ciclista o producto salga duplicado en pantalla.