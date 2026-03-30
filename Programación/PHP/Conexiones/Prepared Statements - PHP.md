#PHP - Programación PHP
Proveniente de [[Índice - PHP]]

---
Las consultas preparadas son consultas que se hacen normalmente a una base de datos SQL mediante PHP. En este caso, en vez de pasarle la consulta directamente desde el lenguaje, se le prepara una especie de formulario o plantilla de información, y por encima, la información que se quiere consultar. Esto es sumamente importante para evitar las [[Inyección SQL|Inyecciones SQL]].

Lo que se hacía antes y lo que NO se ha de hacer ahora:
```php
$nombre = $_POST['usuario'];
$sql    = "SELECT * FROM jugadores WHERE nombre = '" .$nombre "'";
$pdo->query($sql)
```
Si el usuario es normal y escribe `carpi` (mi nickname en este caso), la consulta queda bien: `SELECT ... WHERE nombre = 'carpi'`.
Pero, en el momento que un usuario malicioso ingrese esto en el formulario: `' OR '1'='1'`...
La consulta se transforma en: `SELECT * FROM jugadores WHERE nombre = '' OR '1'='1'`.
Como 1 es siempre igual a 1, la base de datos le devolvería toda la lista de jugadores, y eso no es plan.

## Consultas preparadas con PDO
Al usar consultas preparadas, separas la estructura (código SQL) de los datos. La base de datos recibe los datos y los trata **estrictamente como texto**, nunca como código ejecutable. Si el usuario malicioso intenta el mismo truco, la base de datos buscará un usuario que tenga de nombre literalmente `" ' OR '1'='1'`.

Puedes usar esto como plantilla si quieres:
```php
// Usamos ":nombre" como "hueco" que rellenaremos después
$stmt = $pdo->prepare('SELECT * FROM jugadores WHERE nombre = :nombre');

// ahora hacemos el execute, aqui le pasaremos los datos reales
$stmt->execute([
   'nombre' => 'carpi'
]);

$jugador = $stmt->fetch() //pilla lo primero que encuentre a partir de la consulta.
```