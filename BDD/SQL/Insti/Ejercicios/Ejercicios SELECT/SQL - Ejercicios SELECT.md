#SQL-ASIX - Structured Query Language
Proveniente de [[SQL]]

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
2. Selecciona puertos que incloguin al nom la paraula “Puerto” o “Coll”.
3. Selecciona equips amb un nom de dues paraules.
4. Mostra la llista de directors d’equip si existeix alguna etapa de més de 200 Kms.

# use empresa;
10. Mostra codis de productes venuts per un preu superior a 5;
11. Mostra els noms dels productes anteriors.
12. Mostra els noms de clients que tenen “pedidos” de tipo ‘a’.
13. Mostra totes les ciutats a on hi ha clients.
14. Mostra els clients que tinguin informació a “observaciones”.
15. Mostrar tots els treballadors que tenen com a superior a Jiménez. (S'ha de fer servir 'Jiménez' per a la recerca, no s'ha de fer servir l'id).
16. Obtenir el nom del director del departament on treballa Gil.
17. Mostra els clients ( id i nom ) que no hagin fet cap comanda mai. Ordena per l'id del client.
18. Obtenir el número, cognom i càrrec dels empleats que siguin superior d'un altre empleat.