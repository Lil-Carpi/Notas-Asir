#SQL 
Directorio padre

---
Cuando tenemos un gestor de bases de datos centralizado, podemos tener problemas de conectividad desde distancias muy largas, lo que podria afectar a la experiencia de usuario y a la propia velocidad de conexion. Ademas de que, si esta base de datos cae, todo el sistema dejaria de funcionar.

Tambien, esta base de datos, debe de ser capaz de aguantar una carga de lecturas y escrituras muy grande al estar conectado a internet.

Para esto, se inventaron los nodos de bases de datos distribuido (**SGBDD**, o del ingles ***DDBMG***).

Resumiendo, la bases de datos distribuida son un conjunto de nodos que permiten el acceso a las distintas bases de datos disponibles. Esto permite que haya redundancia de datos y mayor velocidad de lectura y escritura gracias a la distribucion de la carga
