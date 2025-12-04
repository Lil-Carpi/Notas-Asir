
---
# Importar bases de datos

Requisitos:
 - Conexión a la base de datos
 - Base de datos creada y vacía

Con los requisitos cumplidos, se hace:

```Bash
mysql -u nombre_usuario -p nueva_bbdd < nombre_archivo_dump.sql
```
---
## Exportar base de datos

Requisitos:
- Conexión a la base de datos

Con los requisitos cumplidos, se hace:

```Shell
mysqldump -u nombre_usuario -p nombre_bbdd > nombre_archivo_dump.sql
```