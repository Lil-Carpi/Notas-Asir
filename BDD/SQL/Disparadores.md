#SQL-ASIX - Structure Query Language
Proveniente de [[SQL]]

---
Un **trigger** o **disparador** es un objeto que se asocia con tablas y se almacenan en la base de datos. Su nombre se deriva por el comportamiento que presentan en su funcionamiento, ya que se ejecutan cuando sucede algún evento sobre las tablas a las que se encuentra asociado. Los eventos que hacen que se ejecute un trigger son las operaciones de inserción (`INSERT`), borrado (`DELETE`), o actualización (`UPDATE`), ya que modifican los datos de una tabla.

La utilidad principal de un trigger es mejorar la gestión de la base de datos, ya que no requieren que un usuario los ejecute. Por lo tanto, son empleados para implementar las [[Reglas de negocio|reglas de negocio]] (tipo especial de integridad) de una base de datos. Una regla de negocio es cualquier restricción, requerimiento, necesidad o actividad especial que debe ser verificada al momento de intentar agregar, borrar o actualizar la información de una base de datos. Los triggers pueden prevenir errores en los datos, modificar valores de una lista, sincronizar tablas, entre otros.

---
## Combinaciones
La acción del trigger, siempre que no se viole la restricción del trigger se ejecuta dependiendo de la combinación de tipos de trigger:

- **Before statement**: Antes de ejecutar el disparo.
- **Before row**: Antes de modificar cada fila afectada por la sentencia de disparo y antes de chequear las restricciones de integridad apropiadas.
- **After statement**: Después de ejecutar la sentencia del disparo y después de chequear las restricciones de integridad apropiadas.
- **After row**: Después de modificar cada fila afectada por la sentencia del disparo y posiblemente aplicando las restricciones de integridad apropiadas.


---
## Componentes principales
Estructura básica de un "trigger":
- **Llamada de activación**: Es la sentencia que permite "disparar" el código a ejecutar.
- **Restricción**: Es la condición necesaria para realizar el código. Esta restricción puede ser de tipo condicional o de tipo nulidad.
- **Accón a ejecutar**: Es la secuencia de instrucciones a ejecutar una vez que se han cumplido las condiciones iniciales.

---
## Tipos

Existen dos tipos de disparadores que se clasifican según la cantidad de ejecuciones a realizar:
- ***Row Triggers*** (o Disparadores de fila): Son aquellas que se ejecutaran cada vez que se llama al disparador desde la tabla asociada al trigger.
- ***Statement Triggers*** (o Disparadores de secuencia): Son aquellos que, sin importar la cantidad de veces que se cumpla con la condición, su ejecución es única.
Pueden ser de sesión y almacenados; pero no son recomendables.


---
## Efectos y características
- No aceptan parámetros o argumentos (pero podrían almacenar los datos afectados en tablas temporales).
- No pueden ejecutar las operaciones ***COMMIT*** o ***ROLLBACK*** porque estas son parte de la sentencia SQL del disparador (únicamente a través de transacciones autónomas).
- Pueden causar errores de mutaciones en las tablas, si se han escrito de manera deficiente.

---
## Ejemplos
Ejemplo sencillo para SQL Server sería crear un ***Trigger*** para insertar un pedido de algún producto cuando la cantidad de este, en nuestro almacén, sea inferior a un valor dado.
```SQL
CREATE TRIGGER TR_ARTICULO
	ON ARTICULOS
	AFTER UPDATE
		AS
			BEGIN
				INSERT INTO HCO_ARTICULO
				(IDARTICULO, STOCK, FECHA)
				SELECT ID_ARTICULO, STOCK, GETDATE()
				FROM INSERTED
			END
INSERT INTO ARTICULOS VALUES (1, 'MEMORIA', 12, '12/03/2015')

SELECT * FROM ARTICULOS

UPDATE ARTICULOS
SET STOCK = STOCK -20
WHERE ID_ARTICULO = 1

SELECT * FROM HCO_ARTICULO
```


---
## Disparadores en MySQL
Los disparadores son soportados en MySQL a partir de la versión 5.0.2. Algunos de los soportes existentes son los disparadores para las sentencias *INSERT, UPDATE y DELETE*.

El estándar SQL:2003 requiere que los disparadores den a los programadores acceso a las variables de un registro utilizando una sintaxis como *REFERENCING NEW AS n*. Por ejemplo, si un disparador está monitoreando los cambios en la columna *salario*, podría escribirse un disparador como:
```SQL
CREATE TRIGGER ver_salario
	BEFORE UPDATE ON empleados
	REFERENCING NEW ROW AS n, OLD ROW AS o
	FOR EACH ROW
	IF n.salario <> o.salario THEN
	END IF;
```

Como en MySQL las sentencies se ejecutan luego de escribir el signo punto y coma (;), cabe destacar que para crear un disparador en MySQL, antes se escribe la sentencia *DELIMITER* seguida de un carácter tal como |, la cual asigna la función del punto y coma a otro carácter permitiendo que el disparador sea escrito usando los puntos y comas sin que se ejecute mientras se escribe; después de escrito el disparador se escribe nuevamente a la sentencia ***DELIMITER;***, para asignar al punto y coma su función habitual.

---
##### Enlaces externos

- [Trigger (base de datos) - Wikipedia, la enciclopedia libre](https://es.wikipedia.org/wiki/Trigger_(base_de_datos))