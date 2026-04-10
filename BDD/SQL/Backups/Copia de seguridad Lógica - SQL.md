#SQL - Structure Query Language
Proveniente de [[Índice - SQL]]

---
Para las copias de seguridad lógicas se utiliza la herramienta [[mysqldump - SQL|mysqldump]]. 
El cliente **mysqldump** es una utilidad de copia de seguridad, que puede utilizarse para volcar una base de datos o una colección de base de datos con el fin de realizar una copia de seguridad o transferirla a otro servidor de bases de datos. La salida de **mysqldump** suele consistir en sentencias SQL para recrear la estructura de las tablas del servidor, rellenarla con datos, o ambas cosas. Como alternativa, **mysqldump** tambien puede generar archivos en otros formatos, incluyendo el CSV u otros formatos de textos delimitados, y XML.

Para realizar la copia de seguridad con **mysqldump**, puede utilizar una de las siguientes opciones:
- Copia de seguridad de una base de datos seleccionada
- Copia de seguridad de un subconjunto de tablas de una base de datos
- Copia de seguridad de varias bases de datos
- Haga una copia de seguridad de todas las bases de datos.

---
## Procedimiento

- Para hacer una copia de seguridad de una base de datos, ejecute
```shell
mysqldump [options] nombre_db > backup.sql
```

- Para hacer una copia de seguridad de un subconjunto de tablas de una base de datos, añada una lista de las tablas elegidas al final del comando `mysqldump`
```shell
mysqldump [opciones] nombre_db [nombre_tabla ...] > tabla_backup.sql
```

- Para cargar el archivo volcado de nuevo en un servidor, utilice cualquiera de estas opciones:
```shell
mysql nombre_db < backup.sql
```
```shell
mysql -e \ "source /ruta-al-backup/backup.sql" nombre_db
```