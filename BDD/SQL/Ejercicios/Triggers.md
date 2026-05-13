use empresa;  
-- 1- Crea un trigger a la taula "cliente" que, en fer insert, elimini espais als extrems del "nombre" i eviti que s'insereixi un nom buit.  
```SQL
CREATE TRIGGER 
```
  
-- 2- Crea un trigger a la taula "empleado" que, en fer update, no permeti increments salarials de més del 10%.  
  
-- 3- Crea un trigger a la taula "detalle" que actualitzi adequadament el "total" de la comanda a la taula "pedido".  
  
use atletisme;  
-- 4- Crea un trigger a la taula "marca" que actualitzi la "marca_personal" de l'atleta a la taula "practica" de l'especialitat corresponent, si fa falta.  
  
use ciclismo;  
-- 5- Crea un trigger a la taula "equipo" que no permeti que el nom del director sigui igual al nom d'algun ciclista de l'equip. Afegeix un altre trigger a la taula "ciclista" per fer el mateix.