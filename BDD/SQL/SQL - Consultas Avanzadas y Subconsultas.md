Proveniente de [[Índice - SQL]]
- Autor: [Lil_Carpi](https://github.com/Lil-Carpi)
- Fecha de creación: 27/02/2026
---
```table-of-contents
````

---

## Notas a tener en cuenta

- El orden de ejecución de una consulta SQL **no es el mismo** en el que se escribe. Internamente, la base de datos primero hace los `JOIN`, luego filtra con `WHERE`, luego agrupa con `GROUP BY`, filtra los grupos con `HAVING`, selecciona las columnas con `SELECT` y finalmente ordena con `ORDER BY`.
    
- Nunca puedes usar una función de agregación (como `MAX()` o `SUM()`) directamente en un `WHERE` a menos que esté dentro de una subconsulta.
    
- Un `INNER JOIN` descarta los registros que no coinciden en ambas tablas. Si te piden "todos los clientes, incluso los que no han comprado", **siempre** debes pensar en un `LEFT JOIN`.
    

---

## Funciones de Agregación

Las funciones de agregación realizan un cálculo sobre un conjunto de valores y devuelven un solo valor. Se suelen usar junto con la cláusula `GROUP BY`.

- `COUNT()`: Cuenta el número de filas.
- `SUM()`: Suma los valores numéricos de una columna.
-  `MAX()`: Devuelve el valor máximo. 
- `MIN()`: Devuelve el valor mínimo.
- `AVG()`: Calcula la media (promedio).

### Diferencia entre `COUNT(*)` y `COUNT(columna)`

```sql
-- Cuenta TODAS las filas de la tabla, tengan o no valores nulos.
SELECT COUNT(*) FROM usuarios;

-- Cuenta solo las filas donde la columna 'email' NO es NULL.
SELECT COUNT(email) FROM usuarios;
```

---

## Agrupación de datos: `GROUP BY` y `HAVING`

Cuando usamos funciones de agregación y queremos ver los resultados divididos por categorías, usamos `GROUP BY`.

```SQL
SELECT ciudad, SUM(total_compras) AS dinero_total 
FROM clientes 
GROUP BY ciudad;
```

> Agrupa a los clientes por su ciudad y suma el total de compras de cada grupo (ciudad).

### El problema del `WHERE` con las agrupaciones

Si queremos filtrar los resultados **después** de haberlos agrupado (por ejemplo, mostrar solo las ciudades donde la suma de compras supere los 10.000€), **no podemos usar `WHERE`**. Para filtrar grupos, usamos `HAVING`.

```SQL
SELECT ciudad, SUM(total_compras) AS dinero_total 
FROM clientes 
GROUP BY ciudad 
HAVING SUM(total_compras) > 10000;
```

> [!warning] Cuidado en los exámenes El `WHERE` filtra **filas individuales** ANTES de agrupar. El `HAVING` filtra **grupos** DESPUÉS de agrupar.

---

## Subconsultas (Subqueries)

Una subconsulta es una consulta `SELECT` anidada dentro de otra consulta principal. Son súper útiles cuando el valor por el que quieres filtrar es desconocido y tienes que calcularlo primero.

### Subconsultas escalares (Devuelven un solo valor)

Imagina que quieres saber quién ha ganado la última etapa. No sabes cuál es el número de la última etapa, así que primero debes buscar el `MAX(num)`.

```SQL
-- Esto da ERROR porque no puedes usar MAX en el WHERE directamente:
-- SELECT ganador_num FROM etapa WHERE num = MAX(num);

-- Forma correcta usando subconsulta:
SELECT ganador_num 
FROM etapa 
WHERE num = (SELECT MAX(num) FROM etapa);
```

### Subconsultas de lista (Devuelven una columna de varios valores)

Cuando la subconsulta devuelve más de un resultado, no podemos usar el signo igual (`=`). En su lugar, utilizamos el operador `IN`.

```SQL
-- Mostrar los datos de los puertos que pertenecen a etapas con más de 3 puertos
SELECT nombre, categoria 
FROM puerto 
WHERE etapa_num IN (
    SELECT etapa_num 
    FROM puerto 
    GROUP BY etapa_num 
    HAVING COUNT(id) >= 3
);
```

> La subconsulta entre paréntesis genera una lista de los números de etapa (ej: 15, 16, 20). Luego, la consulta principal busca los puertos que coincidan con esos números.

---

## LEFT JOIN` en las estadísticas

A veces los exámenes piden cosas como: _"Muestra todos los ciclistas y cuántas etapas han ganado"_. Si usas un `INNER JOIN` o simplemente juntas las tablas con el `WHERE`, los ciclistas que han ganado **0 etapas** desaparecerán del resultado. Para evitarlo, se usa el `LEFT JOIN`.

```SQL
SELECT c.nombre, COUNT(e.num) AS victorias
FROM ciclista c
LEFT JOIN etapa e ON c.num = e.ganador_num
GROUP BY c.nombre;
```

> [!note] Truco clave Al usar `LEFT JOIN`, el ciclista se mantendrá en la lista. Al hacer `COUNT(e.num)`, si el ciclista no tiene victorias, la columna `e.num` será nula y el `COUNT` devolverá un precioso `0` en lugar de omitir al ciclista.