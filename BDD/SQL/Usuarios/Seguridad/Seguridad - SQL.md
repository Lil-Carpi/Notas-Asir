#SQL - Structure Query Language
Proveniente de [[Índice - SQL]]

Para ver la parte práctica, véase [[Gestión de usuarios y permisos - SQL]]

---
Teniendo en cuenta que las bases de datos sirven para el almacenamiento de la información, es obvio que el mismo se llenará de datos sensibles, y por eso hace falta saber cuáles son las obligaciones legales que tenemos.

![[Triada CID]]

![[Confidencialidad]]

---
![[Integridad]]

---
![[Disponibilidad]]

---
# Tipos de amenazas
## Amenazas no fraudulentas

También, se encuentran las amenazas no fraudulentas o los accidentes, entre los que se distinguen: 
- **Desastres naturales o accidentales**: Normalmente, son accidentes que dañan la maquinaria del sistema, como por ejemplo aquellos producidos por terremotos, inundaciones o incendios.
- **Errores del sistema**: Corresponden a todos aquellos errores accidentales en el hardware o en el software que pueden conducir a accesos no autorizados.
- **Errores humanos**: Tambien conocido como "errores de capa 0", corresponden aquellos errores involuntarios derivados de la accion de los usuarios al introducir datos en sitios fraudulentos o utilizar aplicaciones que trabajan sobre estos. Tambien son subseptibles a la [[Ingenieria Social| ingenieria social]].

## Amenazas fraudulentas
Son aquellas violaciones intencionadas de las normas de ciberseguridad de la empresa y son causadas por dos tipos de usuarios diferentes:
- **Usuarios autorizados**: Aquellos usuarios que abusan de sus privilegios modificando o introduciendo codigo malicioso dentro del sistema
- **Agentes hostiles**: [[Black Hat (Sombrero Negro)|Hackers]] o usuarios impropios que ejecutan acciones de vandalismo sobre el software o hardware del sistema o tambien lecturas o escrituras de datos. De estos ultimos, se conocen como [[Hacktivismo|hacktivistas]]. 
- **Usuarios resentidos**: Estos ultimos, son usuarios que podrian no estar de acuerdo con las politicas de la empresa y sentir cierto resentimiento hacia ella por, probablemente, una sancion o despido. A estos usuarios se los conoce ambiguamente como [[Blue Hat (sombrero azul)|Sombrero azul]].

---
No es posible una proteccion absoluta de la base de datos contra el uso malintencionado, pero se ha de tener en cuenta la relacion costo-eficiencia:
- **SGBD**: Segun los usuarios, tendran acceso a una perte limitada de la base de datos o autorizacion para hacer las consultas, pero no modificaciones. Esto se consigue mediante la gestion de accesos de los usuarios.
- **Sistema operativo**: El sistema operativo puede servir como medio para acesos no autorizados a la informacion.
- **Red**: Control de acceso remoto mediante terminales o redes, tanto a internet como a la intranet de la empresa.
- **Físico**: Los lugares en donde están ubicados los sistemas de información hará falta que estén adecuadamente protegidos contra intrusos y posibles accidentes. Véase [[Ciberseguridad#Objetivos|Ciberseguridad > Objetivos]] para más información.
- **Humano**: Los usuarios tienen que estar debidamente autorizados y entrenados para reducir la posibilidad de que alguno dé acceso no autorizado a intrusos a cambio de sobornos u otros favores.
---
## Integridad y consistencia
Son mecanismos para que la base de datos se encuentre siempre en un estado que cumple todas las reglas del negocio del modelo de datos, aun produciéndose cambios.
Para satisfacer este objetivo, el diseñador de la base de datos ha debido de establecer las reglas de integridad referencial y otras restricciones para que en cualquier caso de cambio indebido tengan el menor efecto. Hace falta tener en cuenta el estado de los atributos derivados que a veces se utilizan en una base de datos para satisfacer mejoras en el rendimiento.

### Auditorias
La auditoria corresponde a un conjunto de mecanismos para saber **quién ha hecho que, como y cuando**, es decir, llevar un registro de quien hace todos los cambios y consultas a la base de datos. Este suele ser un mecanismo utilizado para detectar a un intruso o culpable de un fallo o perdida de datos.

Se utiliza principalmente para los siguientes casos:
- Investigacion de una actividad sospechosa
- Monitorización de actividades especificas de la base de datos.

Más información general de que es una auditoria:
![[Auditoria]]

---
# Niveles de seguridad
MariaDB y MySQL incorporan un sistema de seguridad para especificar que operaciones puede realizar cada usuario con los datos almacenados.
Para esto, se utilizan diferentes niveles de seguridad:
- Primero se controla el acceso al servidor
- Después el acceso a la base de datos
- Y finalmente, el acceso a la tabla o columna indicada.

## Primer nivel
Se determina cuáles usuarios tienen permisos de acceso al servidor.
La tabla ***user*** almacena la lista de usuarios en donde se pueden destacar los siguientes campos:
- host (nombre del host),
- User (nombre del usuario) y
- authentication_string (contraseña cifrada).


## Segundo nivel
Se definen los permisos que tienen los usuarios sobre todas las bases de datos del sistema o sobre una base de datos en particular.
- **Permisos globales**: Son aquellos que aplican para todas las bases de datos y se almacenan en la tabla *mysql.user*. Los usuarios que tengan el valor Y en las columnas select_priv, insert_priv, update_priv y delete_priv pueden realizar operaciones de SELECT, INSERT, UPDATE y DELETE sobre todas las tablas de todas las bases de datos.
- **Permisos locales**: Son los permisos que se aplican sobre una base de datos en particular y están almacenadas en la tabla **mysql.db**. La estructura de la tabla incorpora la columna db para indicar sobre que base de datos se tienen permisos.

## Tercer nivel
En el tercer nivel se definen los permisos de los usuarios sobre una determinada tabla de una base de datos o sobre una determinada columna. Si el permiso es a nivel de tabla, se tendra permisos sobre todas las columnas de la tabla.

Estos permisos se almacenan en **mysql.tables_priv**:
- Table_name (tabla sobre la cual se otorga el permiso),
- Table_priv (permiso que se le otorga: select, insert...),
- Granitor (usuario que ha otorgado el permiso),
- TimeStamp (no se utiliza),
- column_priv (almacena un permiso a nivel de columna).

En la tabla ***mysql.procs_priv*** se almacenan los permisos que se aplican a nivel de procedimientos y funciones.
Basicamente son tres:
- Execute (para ejecutar),
- Alter routine (para modificar o borrar) y
- GRANT (para poder otorgar los permisos anteriores).
