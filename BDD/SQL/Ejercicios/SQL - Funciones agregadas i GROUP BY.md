#SQL - Structured Query Language
Proveniente de [[Índice - SQL]]

Ariel Duarte Oruez, Sebastian

---
# USE ciclismo;
1. Mostra la quantitat de ciclistes i la mitjana d’edat.  
```SQL
SELECT AVG(edad) AS media_edad, COUNT(*) AS quantitat FROM ciclista;
```
2. Mostra la quantitat de colors diferents de maillot.  
```SQL
SELECT COUNT(DISTINCT color) AS colors FROM maillot;
```
3. La màxima i mínima longitud d’etapa.  
```SQL
SELECT max(kms) AS maxim, min(kms) AS minim FROM etapa;
```
4. La suma dels kms de totes les etapes.  
```SQL
SELECT SUM(kms) AS suma_kms FROM etapa;
```

---
## USE empresa;

5. Mostra el preu mitjà del productes venuts (mitjana global).  
```SQL
SELECT AVG(cantidad) AS media_vendida FROM detalle;
```
6. Mostra la data més antiga de comanda.  
```SQL
SELECT min(fecha) AS mas_antiguo FROM pedido;
```
7.  Mostra la quantitat de comandes de cada tipus.  
```SQL

```
8. Mostra el preu mitjà de cada producte (mitjana per producte).  
```SQL

```
9.  Mostra la data més antiga de comanda per cada tipus.  
```SQL

```
10. Mostra la quantitat venuda de cada producte i la mitjana de preu, només dels productes que surtin a menys de 5 comandes.  
```SQL

```
11. Mostra l'alçada màxima i mínima dels ports per cada categoria.  
```SQL

```
12. Mostra l'alçada màxima i mínima dels ports per cada categoria si hi ha més de 15 ports a la categoria.
```SQL

```