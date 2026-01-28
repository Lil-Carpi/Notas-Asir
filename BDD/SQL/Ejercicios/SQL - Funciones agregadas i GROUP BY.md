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
5. Mostra l'alçada màxima i mínima dels ports per cada categoria.  
```SQL
SELECT categoria, MAX(altura) AS alçada_maxima, MIN(altura) AS alçada_minima FROM puerto GROUP BY categoria;
```
6. Mostra l'alçada màxima i mínima dels ports per cada categoria si hi ha més de 15 ports a la categoria.
```SQL
SELECT categoria, MAX(altura) AS alçada_maxima, MIN(altura) AS alçada_minima FROM puerto GROUP BY categoria HAVING COUNT(*) > 15;
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
SELECT tipo,COUNT(*) AS total FROM pedido GROUP BY tipo;
```
8. Mostra el preu mitjà de cada producte (mitjana per producte).  
```SQL
SELECT AVG(total) AS media FROM pedido;
```
9.  Mostra la data més antiga de comanda per cada tipus.  
```SQL
SELECT min(fecha) AS fecha_antigua, COUNT(*) FROM pedido GROUP BY tipo;
```
10. Mostra la quantitat venuda de cada producte i la mitjana de preu, només dels productes que surtin a menys de 5 comandes.  
```SQL
SELECT P.nombre AS Producte, SUM(D.cantidad) AS Total_Unitats_Venudes, AVG(D.precio) AS Preu_mitja FROM producto P JOIN detalle D ON P.id = D.producto_id GROUP BY P.id, P.nombre HAVING COUNT(D.pedido_id) <5
```
