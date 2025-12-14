---

---

---
#### Video de referencia:
![Aprende SQL](https://youtu.be/uUdKAYl-F7g)
[Aprende SQL](https://youtu.be/uUdKAYl-F7g)

---
## Notas a tener en cuenta
TODOS los comandos terminan en `;`.
### Tipos de datos
- **INT (INTEGER)**: Números enteros.
- **Float**: Decimales
- **Varchar**: Strings o letras.
Más información en [[Tipos de datos]]

![[Tipos de datos]]

---
# Bases de datos
## Creación de base de datos:

```SQL
CREATE DATABASE nombre;
```

---
Ver bases de datos

```SQL
SHOW DATABASES; 
```

---
### Seleccionar base de datos
```SQL
USE basededatos;
```

---
### Comentarios
```SQL
-- Cualquier cosa que sea escrita despues de "--" será ignorado.
```
---
### Crear tablas:
```SQL
CREATE TABLE animales (
	id INT NOT NULL AUTO_INCREMENT,
	tipo VARCHAR(255) DEFAULT NULL,
	estado VARCHAR(255) DEFAULT NULL,
	PRIMARY KEY (id)
);
```
> Entre paréntesis se colocan los datos que se van a almacenar en la tabla.
> Es recomendable separarlos entre espacios y seleccionar el tipo de dato que se va a usar con esa sección. También, se ha de seleccionar la clave primaria e indicarla entre paréntesis.


---
### Insertar datos en tablas:
```SQL
INSERT INTO animales (tipo, estado) VALUES ('Chanchito', 'FELIZ');
```
> De la tabla `animales`, se le insertan a las columnas `tipo` y `estado` los valores `'Chanchito'` y `'Feliz'`, en ese orden.


---
### Modificación de tablas:
```SQL
ALTER TABLE animales MODIFY COLUMN id INT AUTO_INCREMENT;
```
> Caso hipotético en el cual la tabla que hemos creado antes no ha tenido la variable `AUTO_INCREMENT` desde un inicio.
> Nota: Se ha de indicar de nuevo el tipo de valor que se le da a la columna `id`, en este caso, `INT`. 

---
### Listar elementos de una tabla
```SQL
SELECT * FROM animales;
```
> Lista TODAS las columnas de la tabla animales

```SQL
SELECT * FROM ANIMALES WHERE ID = 1;
```
> Lista todas las columnas de la tabla animales donde el ID sea 1

```SQL
SELECT * FROM animales WHERE estado = 'Feliz';
```
> Lista todas las columnas de la tabla animales donde el estado sea 'feliz'
> Nota: Los strings se pasan entre comillas simples (`''`).

```SQL
SELECT * FROM animales WHERE estado = 'Feliz' AND tipo = 'Chanchito';
```
>Lista todas las columnas de la tabla animales donde el estado sea 'Feliz' Y tipo sea 'Chanchito'.
> Nota: También se puede usar la variable `OR`.

---
### Update de registros

```SQL
UPDATE animales SET estado = 'Feliz' WHERE id = 3;
```
> Actualiza la tabla animales y pon el estado `'Feliz'` al registro que tenga un `id` de 3.

---
### Borrar registros

```SQL
DELETE FROM animales WHERE estado = 'Feliz';
```

