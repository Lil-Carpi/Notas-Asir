Los Joins en SQL sirven principalmente para juntar datos de varias tablas a un resultado. El resultado variará por el tipo de join, aun utilizando las mismas dos tablas para hacer la consulta.

Tambien, el resultado de las consultas dependeran directamente de la posicion de las tablas en el momento de hacer la consulta, ya que las consultas se hacen de izquierda a derecha o de derecha a izquierda dependiendo de la consulta que hagamos.


![[JoinsC - SQL.png]]

---
## Como hacer JOINS
Antes, se ha de tener en cuenta la estructura de la consulta:
```SQL
SELECT ...
FROM tabla1
JOIN tabla2 ON condición_A
JOIN tabla3 on condicion_B
```

### JOIN natural

La sintaxis para hacer joins, tiene tres partes:
- SELECT: Columnas que se quiere visualizar
- FROM `[...]` JOIN `[...]`: Las dos tablas a juntar
- ON: La condición de la unión, es decir, las columnas que se tienen en común, que normalmente se pilla la clave primaria de una y la clave foránea de la otra.

La estructura general es así:
```SQL
SELECT tabla1.columna, tabla2.columna
FROM tabla1
JOIN tabla2 ON tabla1.clave_foranea = tabla2.clave_primaria;
```

Vamos a hacer unos ejercicios de ejemplo para ver como funciona. Usaré la tabla de ciclismo.

---
#### Muestra el nombre de cada ciclista junto con el nombre de su equipo.
Aquí, se necesitará conectar la tabla ciclista con la tabla equipos
```SQL
SELECT ciclista.nombre, equipo.nombre AS equipo 
FROM ciclista 
JOIN equipo ON ciclista.equipo_id = equipo.id;
```
Selecciona de la tabla ciclista, la columna nombre, de la tabla equipo, la columna nombre como "equipo" de la tabla ciclista y júntalo con la tabla ciclista columna equipo_id con la tabla equipo columna id.

#### Muestra el nombre de los ciclistas que hayan ganado la etapa junto con la ciudad de llegada de esa etapa.
Aquí, se conecta la tabla ciclista con la tabla etapa.
```SQL
SELECT ciclista.nombre, etapa.ganador_num, etapa.llegada 
FROM ciclista 
JOIN etapa ON ciclista.num = etapa.ganador_num;
```
Selecciona de la tabla ciclista, el nombre, de la tala etapa, la columna ganador_num y también la columna llegada de la tabla ciclista y únelo con la tabla etapa con la columna número de la tabla ciclista y la columna ganador_num de la tabla etapa.

#### Queremos saber quién ha llevado cada maillot. Muestra el nombre del ciclista, el color del maillot y el número de etapa correspondiente.
Aquí, se unen tres tablas: Ciclista, lleva y maillot
```SQL
SELECT ciclista.nombre, maillot.color, lleva.etapa_num
JOIN lleva on ciclista.num = lleva.ciclista_num
JOIN maillot ON lleva.maillot_codigo = maillot.codigo;
```

---
### LEFT JOIN