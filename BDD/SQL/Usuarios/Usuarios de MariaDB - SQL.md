#SQL - Structure Query Language
Proveniente de [[Índice - SQL]]

---
La creación y manejo de usuarios en una base de datos una parte fundamental para determinar quien puede entrar a que base de datos y desde donde lo puede hacer determinado por la dirección IP a la cual se le da permiso acceder. 

---
## Creación de usuarios
>*Antes de nada, hace falta entrar a la base de datos como usuario root.*

Para crear un usuario, la sintaxis es la siguiente:
```sql
CREATE USER 'usuario'@'ip' IDENTIFIED BY 'contraseña';
```
>[!tip]
>En caso de que queramos conectar una API de, por ejemplo, PHP o Django, podemos indicar en la segunda pestaña del usuario la dirección IP del servidor API. Asi nos aseguramos de que solo ese servidor sea capaz de entrar a la base de datos. Tambien podemos indicar el parametro `'%'` para indicar que se puede acceder desde cualquier IP 

---
## Dar acceso a usuarios a bases de datos

Para dar permisos a un usuario a solo una base de datos, la sintaxis es la siguiente:
```SQL
GRANT ALL PRIVILEGES ON base_de_datos TO 'usuario'@'ip';
```

Si quieremos proporcionar permisos totales a todas las bases de datos a un usuario, la sintaxis es la siguiente:
```SQL
GRANT ALL PRIVILEGES * . * TO 'usuario'@'ip';
```

Cuando terminemos de modificar permisos, hacemos:
```SQL
FLUSH PRIVILEGES;
```