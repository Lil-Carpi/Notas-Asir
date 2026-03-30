#PHP - Programación PHP
Proveniente de [[Índice - PHP]]

---
 Para las conexiones a base de datos en php, se utilizan las PDO (PHP Data Objects). Estas actuan como un intermediario, que permite la utilizacion de las mismas funciones de PHP para la manipulacion de datos en, realmente, cualquier base de datos SQL, ya sea MySQL, MariaDB, PostgreSQL, SQLite, etc.

Antes de efectuar la conexión, se ha de tener configurado el usuario y la contraseña que va a utilizar PHP para comunicarse con la base de datos, así como la dirección IP de la cual se pueda conectar el usuario dentro de la base de datos. Véase [[Configuración de base de datos para la conexión PHP - PHP|Configuración de base de datos para la conexión PHP]] para más información.

## Preparación de credenciales y DSN
El DSN (Data Source Name) es simplemente una cadena de texto que le dice al PDO en donde está la base de datos y como se llama.
```php
$host      = '127.0.0.1';
$db        = 'phpXsql';
$user      = 'carpi';
$pass      = 'contraseña';
$charset   = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
```


## Configuración de las PDO
Antes de conectar, es buena práctica decirle al PDO como comportarse. Esto ahorra muchos dolores de cabeza:
```php
$options = [
	// Lanzará "Excepciones" si hay un error en SQL.
	PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
	
	// Al hacer un SELECT, los datos lleguen como array asociativo
	// (ej: $fila['nombre'])
	PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
	
	// Desactiva la emulación de consultas preparadas
	PDO::ATTR_EMULATE_PREPARES   => false,
];
```
>[!note]
>Las consultas preparadas son como un formulario de papel con espacios en blanco. En lugar de escribir toda la consulta SQL de golpe mezclando los comandos con los datos del usuario, primero envias a ala base de datos la "plantilla" y luego, en un envio separado, se le pasa los datos para rellenar estos huecos. Véase mas en [[Prepared Statements - PHP |Consultas preparadas]].

## Crear la conexión
Siempre se debe intentar conectarse dentro de un bloque `try...catch`. Si la base de datos esta caída o la contraseña es incorrecta, el script no peta mostrando datos sensibles al usuario, sino que captura el error y no muestra nada que no deba.
```php
try{
	$pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
	throw new \PDOException($e->getMessage(), (int)$e->getCode())
}
```