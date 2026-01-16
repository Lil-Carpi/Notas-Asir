#SQL-ASIX - Structured Query Language
Proveniente de [[SQL]]

Ariel Duarte Oruez, Sebastian

---
Source:
- [Exercicis de consultes | Aulavirtual Ies Thos i Codina](https://aulavirtual.iesthosicodina.cat/moodle/mod/page/view.php?id=179323)
# use ciclismo;
1. Mostra els ciclistes que tenen menys de 25 anys.
```SQL
SELECT * FROM ciclista WHERE edad < 25;
```
1. Mostra els equips amb ciclistes de més de 35 anys.
```SQL
SELECT DISTINCT equipo_id WHERE edad > 35;
```
1. Mostra les etapes que tinguin la sortida igual a l’arribada.
```SQL
SELECT * FROM etapa WHERE salida=llegada;
```
1. Mostra ports de muntanya de l’etapa amb sortida a Lugo.
```SQL
-- SELECT * FROM etapa WHERE salida="Lugo";
SELECT p.* FROM puerto p JOIN etapa e ON p.etapa_num = e.num WHERE e.salida = "Lugo";
```
1. Mostra ports de muntanya de les etapes de més de 150 Kms.
```SQL
SELECT p.* FROM puerto p JOIN etapa e ON p.etapa_num = e.num WHERE e.kms > 150;
```
1. Selecciona ciclistes amb edat entre 25 i 35, amb BETWEEN.
```sql
SELECT * FROM ciclista WHERE edad BETWEEN 25 AND 35;
```
1. Selecciona puertos que incloguin al nom la paraula “Puerto” o “Coll”.
```SQL
SELECT * FROM puerto WHERE nombre LIKE "%Puerto%" OR nombre LIKE "%Coll%";
```
1. Selecciona equips amb un nom de dues paraules.
```SQL
SELECT * FROM equipo WHERE nombre LIKE '% %' AND nombre NOT LIKE '% % %';
```
>[!question]
> Los guiones cuentan como separadores?
> En ese caso, seria:
```SQL
SELECT * FROM equipo
WHERE
  (LENGTH(TRIM(REPLACE(REPLACE(nombre, '-', ' '), '|', ' ')))
   - LENGTH(REPLACE(TRIM(REPLACE(REPLACE(nombre, '-', ' '), '|', ' ')), ' ', '')))
  = 1;
```

1. Mostra la llista de directors d’equip si existeix alguna etapa de més de 200 Kms.
```SQL
SELECT director FROM equipo WHERE EXISTS (SELECT 1 FROM etapa WHERE kms > 200);
```


# use empresa;
10. Mostra codis de productes venuts per un preu superior a 5;
```Sql
SELECT DISTINCT producto_id FROM detalle WHERE precio > 5;
```
10. Mostra els noms dels productes anteriors.
```SQL
SELECT nombre FROM producto WHERE id IN ( SELECT DISTINCT producto_id FROM detalle WHERE precio > 5);
```
10. Mostra els noms de clients que tenen “pedidos” de tipo ‘a’.
```SQL
SELECT DISTINCT c.nombre FROM cliente c JOIN pedido p ON c.id = p.cliente_id WHERE p.tipo = 'a';
```
13. Mostra totes les ciutats a on hi ha clients
```SQL
SELECT DISTINCT ciudad FROM cliente;
```
14. Mostra els clients que tinguin informació a “observaciones”
```SQL
SELECT * FROM cliente WHERE observaciones IS NOT NULL AND observaciones <> '';
```
15. Mostrar tots els treballadors que tenen com a superior a Jiménez
```SQL
SELECT * FROM empleado WHERE superior = (SELECT id FROM empleado WHERE apellido = 'Jiménez' );
```
16. Obtenir el nom del director del departament on treballa Gil
```SQL
SELECT e2.apellido AS director FROM empleado e1 JOIN empleado e2 ON e1.departamento = e2.departamento WHERE e1.apellido = 'Gil' AND e2.cargo = 'director';
```
17. Mostra els clients (id i nom) que no hagin fet cap comanda mai. Ordena per l'id del client
```SQL
SELECT c.id, c.nombre FROM cliente c LEFT JOIN pedido p ON c.id = p.cliente_id WHERE p.id IS NULL ORDER BY c.id;
```
18. Obtenir el número, cognom i càrrec dels empleats que siguin superior d'un altre empleat
```SQL
SELECT DISTINCT e1.id, e1.apellido, e1.cargo FROM empleado e1 JOIN empleado e2 ON e1.id = e2.superior;
```
