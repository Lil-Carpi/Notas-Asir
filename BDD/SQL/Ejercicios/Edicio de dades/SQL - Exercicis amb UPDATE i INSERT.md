#SQL - Structured Query Language
Proveniente de [[Índice - SQL]]

---
### 1. Crea un mallot per a cada equip.  
Amb un 'codigo' creat a partir de l'atribut equipo.nombre, amb tipo='Equipo', color='Taronja' i premio=0.  
```SQL
INSERT INTO maillot SELECT LEFT(REPLACE(nombre,'TEAM ',''),3) as codigo, 'Equipo' as tipo, 'Taronja' as color, 0 as premio FROM equipo;
```

2- Crea un nou equip 'Veterans' amb tots els ciclistes d'edat >=34.  
   2a- Versió INSERT duplicant els ciclistes  
```SQL
INSERT INTO ciclista (num, nombre, edad, equipo_id) SELECT num + 500, nombre, edad, 23 FROM ciclista WHERE edad >= 34;
```
   2b- Versió UPDATE  
```SQL
UPDATE ciclista SET equipo_id = 23 WHERE edad >= 34;
```

3- Afegeix a cada pedido un producto 'Cesta para pelotas'.  
Es tracta d'afegir a 'detalle' els registres necessaris, un per cada pedido.  
Per cada 'pedido_id' haurem de calcular l'atribut 'numero' adequat, amb producte '102130', 'precio' 0 i 'cantidad' 1.  
 a) Crea la subconsulta  
 b) INSERT amb la subconsulta.  
```SQL
INSERT INTO detalle SELECT pedido_id, MAX(numero)+1,102140, 0, 1 FROM detalle GROUP BY pedido_id;
```

4- Crea una comanda(‘pedido’) per a cada ‘cliente’ amb el producte 'Pack de 6 pelotas de tenis' de regal.  
Amb 'fecha' d'avui, tipo 'd' i 'fecha_envio' demà.  
S’han de fer dos INSERT, un per ‘pedido’ i un altre per ‘detalle’.  

```SQL
INSERT INTO pedido SELECT (SELEC MAX(id) FROM pedido)+ROW_NUMBRER() OVER() AS pedido,curdate(), 'd', id AS cliente, DATE_ADD(curdate(),interval 1 day)AS fecha_envio, 0 FROM cliente ORDER BY cliente.id;

INSERT INTO detalle SELECT MAX(id), 1, (SELECT id FROM producto WHERE nombre='Pack de 6 pelotas de tenis') AS producto, 0, 1 FROM pedido GROUP BY cliente_id;
```

5- Afegeix totes les marques de 'marca' a 'practica' si són millors que les actuals a 'practica'.  
Segons els casos, podria ser necessari fer DELETE i INSERT o UPDATE. Hi ha diverses possibilitats.
```SQL
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;

DELETE FROM practica WHERE(numllicencia, codiesp) IN (SELECT DISTINCT numllicencia, codiesp FROM marca NATURAL LEFT JOIN practica NATURAL LEFT JOIN especialitat WHERE UNITATMARQUES='segons' AND registre < marca_personal OR unitatmarques!='segons' AND registre > marca_personal OR marca_personal IS NULL);
```


Plantejament:  
Si marca existeix a practica -->  s’ha de modificar  
Exemple:  
   marca numllicencia 1, codiesp 4, registre 17.8  
   practica numllicencia 1, codiesp 4, marca_personal 18.5  
A la taula practica ha de guardar-se:  
  practica numllicencia 1, codiesp 4, marca_personal 17.8  
  
 Si no existeix a practica -->  s’ha d’insertar  
Exemple:  
   marca numllicencia 1, codiesp 4, registre 17.8  
   practica no hi ha cap  
A la taula practica ha de guardar-se:  
  practica numllicencia 1, codiesp 4, marca_personal 17.8  
  

Inserta noves marques per obtenir diverses situacions:

INSERT INTO marca VALUES (6, 1, 1, '2025-02-28', 10), (6, 1, 3, '2025-02-28', 8.1);

Aquesta consulta ens proporciona les marques que hem de modificar:

SELECT numllicencia, codiesp, datamarca as datapractica, registre as marca_nova, marca_personal as marca_antiga FROM marca NATURAL LEFT JOIN practica NATURAL LEFT JOIN especialitat WHERE unitatmarques='segons' AND registre < marca_personal OR unitatmarques!='segons' AND registre > marca_personal OR marca_personal IS NULL;