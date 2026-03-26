Los Joins en SQL sirven principalmente para juntar datos de varias tablas a un resultado. El resultado variará por el tipo de join, aun utilizando las mismas dos tablas para hacer la consulta.

Tambien, el resultado de las consultas dependeran directamente de la posicion de las tablas en el momento de hacer la consulta, ya que las consultas se hacen de izquierda a derecha o de derecha a izquierda dependiendo de la consulta que hagamos.


![[JoinsC - SQL.png]]

---
## `LEFT JOIN`
Esta consulta, mostrara todas las lineas que existan en la tabla `A`, aún si estas no existen en la tabla `B`.

***Sintaxis:***
```SQL
SELECT nombre_columna (s) FROM tabla1 LEFT JOIN tabla2 ON tabla1.nombre_columna = tabla2.nombre_columna
```

## Ejemplo

Esta es la tabla "*Customers*":

| CustomerID | CustomerName                       | ContactName    | Address                       | City        | PostalCode | Country |
| ---------- | ---------------------------------- | -------------- | ----------------------------- | ----------- | ---------- | ------- |
| 1          | Alfreds Futterkiste                | Maria Anders   | Obere Str. 57                 | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo   | Avda. de la Constitución 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno | Mataderos 2312                | México D.F. | 05023      | Mexico  |

y esta es la tabla "*Orders*":

| OrderID | CustomerID | EmployeeID | OrderDate  | ShipperID |
| ------- | ---------- | ---------- | ---------- | --------- |
| 10308   | 2          | 7          | 1996-09-18 | 3         |
| 10309   | 37         | 3          | 1996-09-19 | 1         |
| 10310   | 77         | 8          | 1996-09-20 | 2         |

