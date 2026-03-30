#PHP - Programación PHP
Proveniente de [[Índice - PHP]]

---
Antes de hacer CRUD a la base de datos, debemos asegurarnos que tenemos las credenciales para poder hacer las consultas.

Para PHP, necesitamos un driver específico para la conexión:
```shell
sudo apt install php-mysql
```
>[!Attention]
>En Arch Linux o derivados, se ha de editar el fichero `/etc/php/php.ini` y descomentar la línea que pone `extension=pdo_mysql`.

Ahora, deberemos de crear el usuario con la contraseña y asignarle una base de datos con la cual trabajar:
```sql
CREATE DATABASE IF NOT EXIST aplicacion DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'carpi'@'%' IDENTIFIED BY 'contraseña';
GRANT ALL PRIVILEGES ON aplicacion.* TO 'carpi'@'%';
FLUSH PRIVILEGES;
```
>[!note]
>Cuando creamos el usuario, podemos asignar una dirección IP desde donde se va a hacer la consulta. Es preferible indicar la dirección IP específica de la misma, pero sí se va a acceder desde múltiples servidores, mejor dejar `'%'`.

Tambien, en caso de conexiones remotas a la base de datos, se ha de indicar la misma editando normalmente el fichero `/etc/mysql/mysql.conf.d/mysql.conf` o `/etc/mysql/mariadb.conf.d/50-server.cnf` y editando la linea `bind-address` para dejarla asi:
```TOML
bind-address = 0.0.0.0
```