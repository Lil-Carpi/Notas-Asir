#SQL - Structure Query Language
Proveniente de [[Índice - SQL]]

- Fuentes:
	- [Copia de seguridad de los datos de MariaDB](https://docs.redhat.com/es/documentation/red_hat_enterprise_linux/8/html/deploying_different_types_of_servers/backing-up-mariadb-data_using-mariadb)
---
Existen 2 tipos de copias de seguridad:
- *Copia de seguridad **Lógica*** ([[Copia de seguridad Lógica - SQL|Ver aquí]])
- *Copia de seguridad **Física*** ([[Copia de seguridad Física - SQL|Ver aquí]])
---
## Copia de seguridad lógica

La copia ***Lógica*** consiste en las sentencias SQL necesarias para restaurar los datos. Este tipo de copia exporta la información y los registros en archivos de texto plano.

La principal ventaja de la copia de seguridad lógica sobre la física es la portabilidad y la flexibilidad. Los datos se pueden restaurar den otras configuraciones de hardware, versiones de MariaDB o sistema de gestión de bases de datos (DBMS), lo que no es posible con las copias de seguridad físicas.

Tenga en cuenta que la copia de seguridad lógica solo se puede realizar si el `mariadb.service` está en funcionamiento. La copia de seguridad lógica no incluye archivos de registro y configuración.

---
## Copia de seguridad física

La copia ***Física*** consisten en copias de archivos y directorios que almacenan el contenido.
La copia de seguridad física tiene las siguientes ventajas frente a la copia de seguridad lógica:
- La copia es más compacta.
- La copia de seguridad es de menor tamaño.
- La copia de seguridad y la restauración son más rápidas.
- La copia de seguridad incluye archivos de registro y de configuración.

Tenga en cuenta que la copia de seguridad física debe realizarse cuando el `mariadb.service` no está en funcionamiento o todas las tablas de la base de datos están bloqueadas para evitar cambios durante la copia de seguridad.