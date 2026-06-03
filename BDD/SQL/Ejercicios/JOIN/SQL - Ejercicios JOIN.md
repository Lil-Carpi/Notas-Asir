#SQL - Structured Query Language
Proveniente de [[Índice - SQL]]

---
**use ciclismo;**  
  
1- Mostra els ciclistes que tenen menys de 25 anys.  
```SQL
SELECT nombre, edad
	FROM ciclista
	WHERE edad < 25;
```
2- Mostra els equips amb ciclistes de més de 35 anys.  
```SQL
SELECT e.nombre, c.nombre
	FROM equipo e 
	JOIN ciclista c ON e.id = c.equipo_id
	WHERE c.edad > 35;
```
3- Mostra les etapes que tinguin la sortida igual a l’arribada.  
```SQL
SELECT num, salida, llegada
	FROM etapa 
	WHERE salida = llegada;
```
4- Mostra ports de muntanya de l’etapa amb sortida a Lugo.  
```SQL
SELECT p.nombre AS puerto, p.altura, e.salida
	FROM puerto p
	INNER JOIN etapa e ON p.etapa_num = e.num
	WHERE e.salida = "Lugo";
```
5- Mostra ports de muntanya de les etapes de més de 150 Kms.  
```SQL
SELECT p.nombre AS puerto, e.salida, e.kms
	FROM puerto p
	INNER JOIN etapa e ON p.etapa_num = e.num
	WHERE e.kms > 150;
```

6- Selecciona ciclistes amb edat entre 25 i 35, amb BETWEEN.  
```SQL
SELECT nombre, edad
	FROM ciclista
	WHERE edad BETWEEN 25 AND 35;
```
7- Selecciona puertos que incloguin al nom la paraula “Puerto” o “Coll”.  
```SQL
SELECT nombre
FROM puerto
WHERE nombre LIKE '%Puerto%' OR nombre LIKE '%Coll%';
```
8- Selecciona equips amb un nom de dues paraules.  
```SQL
SELECT nombre
FROM equipo
WHERE nombre LIKE '% %' AND nombre NOT LIKE '% % %';
```
9- Mostra la llista de directors d’equip si existeix alguna etapa de més de 200 Kms.  
```SQL
SELECT director 
FROM equipo
WHERE EXISTS(
	SELECT 1
	FROM etapa
	WHERE kms > 200
); 
```
  
**use empresa;**  
  
10- Mostra codis de productes venuts per un preu superior a 5;  
```SQL
SELECT DISTINCT producto_id
	FROM detalle
	WHERE precio > 5;
```
11- Mostra els noms dels productes anteriors.  
```SQL
SELECT DISTINCT p.nombre 
	FROM detalle d
	INNER JOIN producto p ON d.producto_id = p.id 
	WHERE d.precio > 5; 
```
12- Mostra els noms de clients que tenen “pedidos” de tipo ‘a’.  
```SQL
SELECT c.nombre, p.tipo
	FROM cliente c
	INNER JOIN pedido p ON c.id = p.cliente_id
	WHERE p.tipo = "a";
```

13- Mostra totes les ciutats a on hi ha clients.  
```SQL
SELECT DISTINCT ciudad
	FROM cliente;
```
14- Mostra els clients que tinguin informació a “observaciones”.  
```SQL
SELECT DISTINCT nombre, observaciones
	FROM cliente
	WHERE observaciones IS NOT NULL
	AND observaciones != '';
```
15- Mostrar tots els treballadors que tenen com a superior a Jiménez. (S'ha de fer servir 'Jiménez' per a la recerca, no s'ha de fer servir l'id).  
```SQL
SELECT j.apellido AS empleado, e.apellido AS jefe 
FROM empleado j 
INNER JOIN empleado e ON j.superior = j.id 
WHERE j.apellido = "Jiménez";
```
16- Obtenir el nom del director del departament on treballa Gil.  
```SQL
SELECT apellido
	FROM empleado
	WHERE id = (SELECT superior 
					FROM empleado 
					WHERE apellido = "Gil"
);
```
17- Mostra els clients ( id i nom ) que no hagin fet cap comanda mai. Ordena per l'id del client.  
```SQL
SELECT c.id, c.nombre
	FROM cliente c
	LEFT JOIN pedido p ON c.ido = p.cliente_id
	WHERE p.cliente_id IS NULL;
```

18- Obtenir el número, cognom i càrrec dels empleats que siguin superior d'un altre empleat.

```SQL

```

---


1. Obtenir totes les parelles que es poden formar adjuntant un producte amb un departament.
```SQL

```
  
2. Obtenir el nom dels clients i el cognom i el càrrec dels seus representants.  
```

```

3. Obtenir el nom dels clients que tenen a 'Tovar' com a representant.  
```

```

4. Obtenir un llistat de comandes on surti el número de la comanda, el nom del client, el cognom del representant del client i el total de la comanda.  
```

```

5. Obtenir un llistat de les comandes fetes en 1987 pels clients que tinguin a 'Tovar' com a representant.  
```

```

6. A cada empleat del departament 10 li regalarem una unitat de cada producte de l'empresa. Mostrar TOTES LES PARELLES POSSIBLES d'un producte amb un empleat del departament 10.  
```

```

7. Mostrar totes les parelles possibles que es poden formar amb un empleat del departament 10 i un altre del departament 20.  
```

```

8. Mostrar les comandes fetes pel client  Sprinter.  
```

```

9. Mostrar els clients que han comprat el producte 102130 (sense repeticions).  
```

```

10. Mostrar els clients que han comprat productes que contenen la paraula 'tenis'.
```

```