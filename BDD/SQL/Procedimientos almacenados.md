#SQL-ASIX - Structure Query Language
Proveniente de [[SQL]]

---
En SQL, un **procedimiento almacenado (*stored procedure*** en inglés) es un programa o procedimiento almacenado físicamente en una base de datos. Su implementación varía de un gestor de base de datos a otro. **La ventaja de un procedimiento almacenado** es que al ser ejecutado, en respuesta a una petición del usuario, es ejecutado directamente en el motor de base de datos, el cual usualmente corre en un servidor separado. Como tal, posee acceso directo a los datos que necesita manipular y solo necesita enviar grandes cantidades de datos salientes y entrantes.

Los procedimientos pueden ser ventajosos: cuando una base de datos es manipulada desde muchos programas externos. Al incluir una lógica de aplicación en la base de datos utilizando procedimientos almacenados, la necesidad de embeber la misma lógica en todos los programas que acceden a los datos es reducida. Esto puede simplificar la creación y, particularmente, el mantenimiento de los programas involucrados.

Podemos ver un claro ejemplo de estos procedimientos cuando requerimos realizar una misma operación en un servidor dentro de algunas o todas las bases de datos y a la vez dentro de todas o algunas de las tablas de las bases de datos al mismo tiempo. Para ello podemos utilizar a los procedimientos almacenados auto creables que es una forma de generar ciclos redundantes a través de los procedimientos almacenados.

## Implementación
---
Estos procedimientos se usan a menudo, pero no siempre, para realizar consultas [[SQL]] sobre los objetos de la base de datos de una manera abstracta, desde el punto de vista del cliente de la aplicación. Un **procedimiento almacenado** permite agrupar en forma exclusiva parte de algo específico que se desee realizar o, mejor dicho, el SQL apropiado para dicha acción.

## Usos
---
Los usos típicos de los **procedimientos almacenados** se aplican en la validación de datos, integrados dentro de la estructura del banco de datos. Los **procedimientos almacenados** usados con tal propósito se llaman comúnmente [[Disparadores|disparadores, o triggers]]. Otro uso común es la 'encapsulación' de una API para un proceso complejo o grande que podría requerir la 'ejecución' de varias consultas SQL, tales como la manipulación de un conjunto de datos enorme para producir un resultado resumido.

También pueden ser usados para el control de gestión de operaciones, y ejecutar procedimientos almacenados dentro de una transición, de tal manera que las transiciones sean efectivamente transparentes para ellos.

## Ventajas
---
La ventaja de un **procedimiento almacenado**, en respuesta a una petición de usuario, está directamente bajo el control del motor del gestor de bases de datos, que corre generalmente en un servidor distinto del servidor web, aumentando con ello la rapidez de procesamiento de las peticiones del usuario. El servidor de la base de datos tiene acceso directo a los datos necesarios para manipular y solo necesita enviar el resultado final al usuario. Los datos, que pueden simplificar la gestión de datos y reducir la necesidad de codificar la lógica en el resto de los programas cliente. Esto puede reducir la probabilidad de que los datos se corrompan por el uso de programas clientes defectuosos o erróneos. De este modo, el motor de base de datos puede asegurar la integridad de los datos y su consistencia con la ayuda de procedimientos almacenados. Algunos afirman que las bases de datos deben ser utilizadas para el almacenamiento de datos solamente, y que la lógica de negocio solo debería aplicarse en la capa de negocio del código, a través de aplicaciones cliente que deban acceder a los datos. Sin embargo, el uso de procedimientos almacenados no se opone a la utilización de una capa de negocio.

El siguiente es un ejemplo de procedimiento almacenado en MySQL:
```SQL
CREATE PROCEDURE nombreProcedimiento([parametro1, parametro2,...])
[Atributos]
BEGIN Instrucciones
END
```

