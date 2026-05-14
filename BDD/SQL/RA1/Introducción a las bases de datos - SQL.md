 #SQL - Structured Query Language
Proveniente de [[Índice - SQL]]
Santo recopilatorio.

---
```table-of-contents
```
---
En la gran mayoria de aplicaciones, se gestionan datos.
El volumen de datos puede ser muy grande y se ha de gestionar de manera eficiente.
Para resolver este problema, se inventaron las bases de datos. Esto nos permite **centralizar** la informacion y facilitar su tratamiento.

El objetivo es utilizar el Sistema Gestor de Bases de Datos (SGDB, DBMS en ingles) para crear y manipular los datos guardados en la base de datos (DB).

Para esto, se hacen los siguientes pasos:
- Diseñar la base de datos
- Crear la base de datos con el lenguaje SQL-Structured Querying Language (Lenguaje estructurado de consulta) y guardarlos en un SGDB MariaDB (MySQL).
- Manipular la base de datos con el lenguaje SQL.

---
### Tipos de ficheros
Para el almacenamiento de los datos en una base de datos, los SDBD utilizan diversos tipos de ficheros.
Dependerá de cada SGBD de que tipos seran y como utilizarlos. En algunos casos podremos decidir algunas caracteristicas.

**Ficheros secuenciales o planos.**
El acceso al contenido del fichero es secuencial, para obtener un dato se han de leer todos los anteriores a el.
Ejemplo de este tipo de ficheros son los ficheros de texto que podemos crear con un editor simple.
Si tenemos muchos datos, este es muy lento.

```text
Acceso secuencial:
*1** -> *2** -> *3** -> *4** -> *5** -> *6** -> *7** -> *8** -> *9** -> *10*

Orden de acceso: 1 2 3 4 5 6 7 8 9 10
```

**Ficheros de acceso directo**
El acceso al contenido del fichero es por posicion. Se pueden acceder a los datos en el orden que se quiera. La trata de ficheros requiere un programa especial para obtener la informacion.
El acceso es rapido, pero se ha de saber la posicion en la que se encuentra el dato que queremos.

```text
Acceso directo:
1 2 3 4 5 -> *6* 7 8 9 10

Orden de acceso: 6
```

**Indexados**
El acceso se realiza mediante una clave (key). Los datos se dividen en dos apartados, por un lado, un indice con las claves y por otro los datos.
El indice nos permite encontrar los datos que corresponden a una clave concreta.
Normalmente se utilizan solo en los sistemas gestores de bases de datos (SGBD).
Los SGBD acostumbran a permitir definir diversos indices para facilitar el acceso, asi podriamos buscar por nombre, dni, telefono...
El acceso es rapido y solo hace falta saber el valor de la clave para encontrar los datos.

![[indexat.png]]

---
### Estructura de una base de datos

Para trabajar con las BD, los SGBD necesitan conocer su estructura (que entidades tipo habrá, que atributos tendran, etc).

Los SGBD necesitan que les demos una descripcion o definicion de la BD. Esta descripcion recibe el nombre de esquema de la BD, y los SGBD la tendran continuamente a su alcance.

El esquema de la BD es un elemento fundamental de la arquitetura de un SGBD que permite independizar el SGBD de la DB; De este modo, se puede cambiar el diseño de la DB (su esquema) sin tener que hacer ningun cambio en el SGBD.

El nivel logico nos oculta los detalles de como se almacenan los datos, como se mantienen y como se acceden fisicamente a ellos. En este nivel solo se habla de entidades, atributos y reglas de integridad.

Por cuestiones de rendimiento, nos podra interesar describir elementos de nivel fisico como, por ejemplo, que indices tendremos y que caracteristicas presentaran, como y donde (en que espacio fisico) queremos que se agrupen fisicamente los registros, de que tamaño deben ser las paginas, etc.

En el periodo del 1975-1982, ANSI intentaba establecer las bases para crear estandares en el campo de las DB. El comite conocido como ANSI/SPARC recomendo que la arquitectura de los SGBD previse tres niveles de descripcion de la BD, no solo dos.

De acuerdo con la arquitectura ANSI/SPARC, debia haber tres niveles de esquemas (tres niveles de abstraccion). La idea basica de ANSI/SPARC consistia en descomponer el nivel logico en dos: el nivel externo y el nivel conceptual. Denominabamos nivel interno lo que qui hemos denominado nivel fisico.


>[!nota]
>Es preciso ir con cuidado para no confundir los niveles que se describen aqui con los descritos en el caso de los ficheros, aunque reciban el mismo nombre.

De este modo, de acuerdo con ANSI/SPARC, habria los tres niveles de esquemas que mencionamos a continuacion:

- En el nivel externo se situan las diferentes versiones logicas que los procesos usuarios (programas de aplicacion y usuarios directos) tendran de las partes de la BD que utilizarian. Estas visiones se denominaban esquemas externos.
- En el nivel conceptual hay una sola descripcion logica basica, unica y global, que denominamos **esquema conceptual**, y que sirve de referencia para el resto de los esquemas.
- En el nivel fisico, hay una sola descripcion fisica, que denominamos esquema interno.

![[esquemasDeBasesDeDatos.png]]
> En el esquema conceptual se describiran las entidades tipo, sus atributos, las interrelaciones y las restricciones o reglas de integridad.

El esquema conceptual corresponde a las necesidades del conjunrto de la empresa o del SI, por lo que se escribira de forma centralizada durante el denominado *diseño logico* de la BD.

Sin embargo, cada aplicacion podra tener su vision particular, y seguramente parcial, del esquema conceptual. Los usuarios (programas o usuarios directos) veran la BD mediante esquemas externos apropiados a sus necesidades. Estos esquemas se pueden considerar redefiniciones del esquema conceptual, con las partes y los terminos que convengan para las necesidades de las aplicaciones (o grupos de aplicaciones). Algunos sistemas los denominan *subesquemas*.

Al definir un esquema externo, se citaran solo aquellos atributos y aquellas entidades que interesen; los podriemos redenominar, podremos definir datos derivados o definir una entidad para que las palicaciones que utilizan este esquema externo crean que son dos, definir combinaciones de entidades para que parezcan una sola, etc.

**Ejemplo de esquema externo**
Imaginemos una BD que en el esquema conceptual tiene definida, entre muchas otras, una entidad *alumno* con los siguientes atributos: *numatri*, *nombre*, *apellido*, *numDNI*, *direccion*, *fechanac*, *telefono*. Sin embargo, nos puede interesar que unos determinados programas o usuarios vean la BD formada de acuerdo con un esquema externo que tenga definidas dos entidades, denominadas *estudiante* y *persona*
- La entidad *estudiante* podria tener definido el atributo *numero-matricula* (definido como derivable directamente de *numatri*), el atributo *nombrepila* (de *nombre*), el atributo *apellido* y el atributo *dni* (de *numDNI*).
- La entidad persona podria tener el atributo *DNI* (obtenido de *numDNI*), el atributo *nombre* (formado por la concatenacion de *nombre* y *apellido*), el atributo *direccion* y el atributo *edad* (que deriva directamente de *fechanac*).

El esquema interno o fisico contendra la descripcion de la organizacion fisica de la BD: caminos de acceso (indices, hashing, apuntadores, etc.), codificacion de datos, gestion del espacio, tamaño de las paginas, etc.

* En ingles, el ajuste se conoce como tuning.

El esquema de nivel interno responde a las cuestiones de rendimiento (espacio y tiempo) planteadas al hacer el diseño fisico de la BD y al ajustarlo posteriormente a las necesidades cambiantes.

De acuerdo con la arquitectura ANSI/SPARC, para crear una BD hace falta definir previamente su esquema conceptual, definir como minimo un esquema externo y, de forma eventual, definir su esquema interno. Si este ultimo esquema no se define, el mismo SGBD tendra que decidir los detalles de la organizacion fisica. El SGBD se encargara de hacer las correspondencias (*mapping*) entre los tres niveles de esquemas.

**Esquemas y niveles en los SGBD relacionales**
En los SGBD relacionales (es decir, en el mundo de SQL) se utiliza una terminologia ligeramente diferente. No se separan de forma clara tres niveles de descripcion. Se habla de un solo esquema -*schema*-, pero en su interior se incluyen descirpciones de los tres niveles. En el schema se describen los elementos de aquello en la arquitectura ANSI/SPARC se denomina esquema *conceptual* (entidades tipo, atributos y restricciones) y las vistas -*view*-, que corresponden aproximadamente a los esquemas externos.

El modelo relacional en el que esta inspirado SQL se limita a un mundo logico. Por ello, el estandar ANSI-ISP de SQL no habla en absoluto del mundo fisico o interno; lo deja en manos de los SGBD relacionales del mercado. Sin embargo, estos SGBD proporcionan la posibilidad de incluir dentro del *schema* descripciones de estructuras y caracteristicas fisicas (indice, tablespace, cluster, espacios para excesos, etc.).

---
### Arquitectura ANSI-SPARC
![[ANSI-SPARC_DB_model.jpg]]
*Los tres niveles de la **Arquitectura ANSI-SPARC.***

La arquitectura **ANSI-SPARC**, donde ANSI-SPARC significa **American National Standars Institute, Standards Planning And Requirementes Comittee**, es un modelo conceptual ampliamente aceptado para el diseño y gestion de bases de datos. Este estandar fue propuesto por primera vez en el 1975 y ha influido en el desarrollo de muchos SGBD comerciales. Sin embargo, nunca se convirtio en un estandar formal.

**Arquitectura de tres niveles**
La arquitectura ANSI/SPARC establece una division en tres niveles para la estructura de una base de datos. El objetivo de esta arquitectura de tres niveles es proporcionar una separacion clara de la vista de los usuarios, ocultando la complejudad de las bases de datos y los detalles fisicos del almacenamiento.
Ademas:
- Permite vistas de usuario independientes y personalizadas: Cada usuario debe ser capaz de acceder a los datos, pero tiene una vista personalizada diferente de los datos. Estos deben ser independientes: Los cambios en una vista no deben afectar a los demas.
- Oculta los detalles fisicos de almacenamiento a los usuarios: Los usuarios no deben tener que lidiar con los detalles de almacenamiento de las bases de datos.
- El administrador de las bases de datos debe ser capaz de cambiar las estructuras de almacenamineto de esta sin afectar la vista de los usuarios.
- La estructura interna de la BD no deberia verse afectada por cambios en los aspectos fisicos del almacenamiento: por ejemplo, un cambio a un nuevo disco.

Los tres niveles son:
- **Nivel externo (Vistas de usuario)**
	En el nivel externo, se encuentra la vista de la base de datos que tienen los usuarios finales. Una vista de usuario describe una parte de la base de datos que es relevante para un usuario en particular. Permite definir y acceder a subconjuntos especificos de datos segun las necesidades de cada usuario, el cual puede tener una vista personalizada de la base de datos , lo que mejora la seguridad y la simplicidad de uso.
- **Nivel conceptual**
	En el nivel conceptual, se representa la estructura logica global de la base de datos. Es una forma de describir los datos que se almacenan dentro de la base de datos y como los atos estan relacionados entre si. Aqui se definen las entidades, las relaciones y las restricciones de integridad que se aplican a todos los usuarios. Este nivel no especifica como se almacenan fisicamente los datos, la representacion es independiente de cualquier implementacion fisica.
	Alguinos datos importantes acerca de este nivel son:
		1. El DBA (Administrador de la base de datos) trabaja en este nivel.
		2. Describe la estructura de todos los usuarios.
		3. Solo el DBA puede definir este nivel.
		4. Vision global de la base de datos.
		5. Independiente del hardware y software.
- **Nivel interno (Almacenamiento Fisico)**
	El nivel interno implica la forma en la que la base de datos se representa fisicamente en el sistema informatico de almacenamiento. Aqui se define como se almacenan y acceden los datos a nivel mas bajo, se describe como los datos se almacenan en la base de datos y en el hardware del equipo. Se incluyen detalles de como la estructura de almacenamiento, los indices y los mecanismos de acceso a los datos.

**Esquemas de bases de datos**
El esquema externo describe las diferentes vistas externas de los datos; puede haber muchos esquemas externos para una sola base de datos dada.
El esquema conceptual describe todos los datos y las relaciones entre ellos, junto con las restricciones de integridad. Solo hay un esquema conceptual por cada base de datos.
El esquema interno es el nivel mas bajo que contiene los registros almacenados, los metodos de representacion, los campos de datos e indices. Solo hay un esquema interno por cada base de datos.
La descripcion gereneral de una base de datos se llama esquema de base de datos.

---

### Independencia fisica y logica
Hay independencia física cuando los cambios en la organización física de la BD no afectan al mundo exterior (es decir, los programas usuarios   o los usuarios directos).
De acuerdo con la arquitectura ANSI/SPARC, habrá independencia física cuando los cambios en el esquema interno no afecten al esquema conceptual ni a los esquemas externos.
![[independenciaFisicaYLogica.png]]

Es obvio que cuando cambiemos unos datos de un soporte a otro, o los cambiemos de lugar dentro de un soporte, no se veran afectados ni los programas de aplicacion ni los usaurios directos, ya que no se modificara el esquema conceptual ni el externo. Sin embargo tanpoco tendrian que verse afectados si cambiasemos, por ejemplo, el metodo de acceso a unos registros determinados, el formato o la codificacion, etc. Ninguno de estos casos deberia afectar al mundo exterior, sino solo a la BD fisica, el esquema interno, etc.

Si hay independencia fisica de los datos, lo unico que variará al cambiar el esquema interno son las correspondencias entre el esquema conceptual y el interno. Obviamente, la mayoria de los cambios del esquema interno obligarán a rehacer la BD real (la fisica).

Hay independencia logica cuando los usaurios no se ven afectados por todos los cambios a nivel logico.
![[independenciaLogica.png]]
Dados los dos niveles logicos de la arquitectura ANSI/SPARC, diferenciaremos las dos situaciones siguientes:
- Si eliminamos el atributo apellido, por ejemplo, no se veran afectados los esquema externos (ni los usuarios) que no hagan referencia a este atributo. Si se alarga el atributo direccion al esquema conceptual, no sera necesario modificar el esquema externo donde se ha definido la direccion.
- Cambios en el esquema conceptual. Un cambio de este tipo no afectara a los esquemas externos que no hagan referencia a las entidades o a los atributos modificados.
- Cambios en los esquemas externos. Efectuar cambios en un esquema externo afectara a los usuarios que utilicen los elementos modificados. Sin embargo, no deberia afectar a los demas usuarios ni al esquema conceptual, y tampoco, en consecuencia, al esquema interno y a la BD fisica.

Usuarios no afectados por los cambios
Notad que no todos los cambios de elementos de un esquema externo afectaran a sus usuarios. Veamos un ejemplo de ello: antes hemos visto que cuando eliminabamos el atributo *apellido* del esquema conceptual, debiamos modificar el esquema externo donde definiamos *nombre*, porque alli estaba definido como concatenacion de *nombre* y *apellido*. Pues bien, un programa que utilizase el atributo *nombre* no se veria afectado si modificasemos el esquema externo de modo que *nombre* fuese la concatenacion de *nombre* y una cadena constante (por ejemplo, todo en blanco). Como resultado, habria desaparecido el apellido de *nombre*, sin que hubiera sido necesario modificar el programa.

Los SGBD actuales proporcionan bastante independencia logica, pero menos de la que haria falta, ya que las exigencias de cambios constatnes en el SI pierden grados muy elevados de flexibilidad. Los sistemas de ficheros tradicionales, en cambio, no ofrecen ninguna dependencia logica.

---
### Funcionamiento de una base de datos
Para entender el funcionamiento de un SGBD, a continuacion veremos los principales pasos de la ejecucion de una consulta sometida al SGBD por un programa de aplicacion. Explicaremos las lineas generales del flujo de datos y de control entre el SGBD, los programas de usuario y la BD.

Recordad que el SGBD, con ayuda del SO, lee paginas (bloques) de los soportes donde esta almacenada la BD fisica, y las lleva a un area de *buffers* o memorias cache en la memoria principal. El SGBD pasa registros dede los *buffers* hacia el area de trabajo del mismo programa.

Supongamos que la consulta pide los datos del alumno que tiene un determinado DNI. Por lo tanto, la respuesta que el programa obtendra sera un solo registro y lo recibira dentro de un area de trabajo propia.

![[comoFuncionaUnaDB.png]]

En la imagen vemos representada la BD, los tres niveles de esquemas, el area de los buffers, el SGBD y el programa de aplicacion que le hace la consulta.

El proceso que sigue es el siguiente:
Empieza con una llamada -> el programa al SGBD, en el que se le envia la operacion de la consulta. El SGBD debe verificar que la sintaxis de la operacion recibida sea correcta, que el usuario del programa este autorizado a hacerla, etc. Para poder llevar a cabo todo esto, el SGBD se basa en el esquema externo con el que trabaja el programa y en el esquema conceptual. -> Si la consulta es valida, el SGBD determina, consultando que mecanismo interno debe seguir para responderla. Ya sabemos que el progrma ausuario no dice nada respecto a como se debe hacer fisicamente la consulta. Es el SGBD el que lo debe determinar. Casi siempre hay varias formas y diferentes caminos para responder a una consulta. Supongamos que ha elegido aplicar un hashing al valor DNI, que es el parametro de la consulta, y el resultado es la direccion de la pagina en donde se encuentra (entre muchos casos) el registro del alumno buscado.

Cuando ya se sabe cual es la pagina, el SGBD comprobara si por suerte esta pagina ya se encuentra en aquel momento en el area de los buffers (tal vez como resultado de una consulta anterior de este usuario o de otro). Si no esta, el SGBD, con ayuda del SO, busca en disco y la carga en los buffers. Si ya esta, se ahorra el acceso al disco.

Ahora, la pagina deseada ya esta en la memoria principal. El SGBD extrae, de entre los distintos registros que la pagina puede contener, el registro buscado, e interpreta la codificacion y el resultado segun lo que diga el esquema interno.

**Diferencias entre SGBD**
Aunque entre diferentes SGBD puede haber enormes diferencias de funcionamiento, suele seguir el esuqema general que acabamos de explicar.

El SGBD aplica a los datos las eventuales transformaciones logicas que implica el esquema externo (tal vez cortando con la direccion por la derecha) y las lleva al area de trabajo del programa.
A continuacion, el SGBD retorna el control al programa y da por terminada la ejecucion de la consulta.

---
### Tipos de bases de datos
Los tipos de bases de datos, a veces relacionados modelos de bases de datos o familias de bases de datos, son los patrones y estructuras utilizados para organizar los datos dentro de un sistema de gestion de bases de datos. A lo largo de los años se han desarrollado muchos tiipos de bases de datos diferentes. Algunos son principalmente predecesores historicos de las bases de datos actuales, mientras que otros han resistido la prueba del tiempo. En las ultimas decadas, se han desarrollado nuevos tipos para abordar los requisitos cambiantes y los diferentes patrones de uso.

Su eleccion del tipo de base de datos puede tener un profundo impacto en que tipo de operaciones puede realizar facilmente su aplicacion, como conceptualiza sus datos y las caractewristicas que su sistema de gestion de base de datos le ofrece durante el desarrollo y tiempo de ejecucion. En esta guia, veremos como han evolucionado los tipos de bases de datos con el tiempo y que ventajas y compensaciones estan presentes en cada diseño.

Esta seccion esta dedicada a los tipos de bases de datos historicas que no se utilizan mucho en el desarrollo moderno. Puede saltar a la seccion de bases de datos relacionales si no esta interesado en este fondo. [cual cosa voy a hacer.]

**Bases de datos relacionales: Trabajar con tablas como solucion estandar para organizar datos bien estructurados.**
**Introduccion inicial: 1969**
Las bases de datos relacionales son el tipo de bases de datos de proposito general mas antiguo que todavia se utiliza ampliamente en la actualidad. De hecho, las bases de datos relacionales comprenden la mayoria de las bases de datos actualmente utilizadas en produccion.

Las bases de datos relacionales organizan los datos utilizando *tablas*. Las tablas son estructuras que impoinen un esquema en los registros que tienen. Cada columna dentro de una tabla tiene un *nombre* y un *tipo de datos*. Cada fila representa un registro individual o elemento de datos dentro de la tabla, que contiene valores para cada una de las columnas. Las bases de datos relacionales obtienen su nombre de relaciones matematicas que utilizan las turplas (como las filas de una tabla) para representar conjuntos ordenados de datos.
![[relational.png]]

Los campos especiales en las tablas, llamados claves foraneas, pueden contener referencias a columnas en otras tablas. Esto permite que la base de datos puentee las dos tablas a pedido para reunir diferentes tipos de datos.

La estructura altamente organizada impartida por la estructura rigida de la tabla, combinada con la flexibilidad que ofrecen las relaciones entre tablas hace que las bases de datos relacionales sean muy potentes y adaptables a muchos tipos de datos. La conformidad se puede aplicar a nivel de tabla, pero las operaciones de la base d edatos pueden combinar y manipular esos datos de maneras novedosas.

Aunque no es inherente al diseño de las bases de datos relacionales, se creo un lenguaje de consulta llamado SQL, o Lenguaje de Consulta Estructurado, para acceder y manipular los datos almacenados con este formato. Puede consultar y unir datos de varias tablas dentro de una sola instruccion. SQL tambien puede filtrar, agregar, resumir y limitar los datos que devuelve. Por lo tanto, aunque SQL no es parte del sistema relacional, a menudo es un a parte fundamental de trabajar con estas bases de datos.

> [!Definicion: *SQL*]
> SQL, o Lenguaje de Consulta Estructurado, es una familia de lenguajes utilizada para consultar y manupular datos dentro de bases de datos relacionales. Se destaca en la utilizacion de datos de multiples tables y el filtrado basado en restricciones que permiten que se utilicen para expresar consultas complejas. Las variantes del lenguaje han sido adoptadas por casi todas las bases de datos relacionales debido a su flexibilidad, poder y ubicuidad.

En general, las bases de datos relacionales a menudo son una buena opcion para cualquier dato que sea regular, debido a que las bases de datos relacionales funcionan fuera de un esquema, puede ser mas dificil alterar la estructura los datos despues de que estan en el sistema. Sin embargo, el esquema tambien ayuda a reforzar la integridad de los datos, asegurandose que los valores coincidan con los formatos esperados, y que se incluya la informacion requerida. En general, las bases de datos relacionales son una buena opcion solida para muchas aplicaciones porque las aplicaciones a menudo generan datos estructurados o bien ordenados.

---
### Modelo relacional
El modelo relacional (RM) es un enfoque para la gestion de datos utilizando una estructura y un lenguaje consistente con la logica del predicado de primer orden (\\que?\\), descrito por primera vez en el 1969 por el cientifico informatico ingles Edgar F. Codd, donde todos los datos enstan reprensentados en terminos de tuplas, agrupados en relaciones. Una base de datos organizada en terminos del modelo relacional es una base de datos relacional.

El proposito del modelo relacional es proporcionar un metodo declarativo para especificar datos y consultas: Los usuarios indican directamente que informacion contiene la base d edatos y que informacion desean de ella, y permiten que el software del sistema de gestion de bases de datos se encargue de escribir las estructuras para almacenar los datos y los procedimientos de recuperacion para responder consultas.

La mayoria de las bases de datos relacionales utilizan el lenguaje de definicion y consulta de datos SQL; estos sistemas implementan lo que se puede considerarse como una aproximacion de ingenieria al modelo relacional. Una tabla en un esquema de bases de datos SQL corresponde a una variable del predicado; el contenido de una tabla a una relacion; las restricciones de clave, otras restricciones y consultas SQL corresponden a predicados. Sin embargo, las bases de datos SQL se desvian del modelo relacional en muchos detalles, y Codd argumento ferozmente contra las desviaciones que comprometen los principios originales.

**Historia**
El modelo relacional fue desarrollado por Edgar F. Codd como modelo general de datos, y postariormente promovido por Chris Date y Hugh Darwen entre otros. En su 1995 *El Tercer Manifiesto*, Date y Darwen tratan de demostrar como el modelo relacional puede acomodar ciertas caracteristicas orientadas a objetos "deseadas".

**Extensiones**
Algunos años despues de la publicacion de su modelo de 1970, Codd propuso una version de tres valores de logica (True, False, Missing / Null) para tratar con la falta de informacion, y en su version de *The Relational Model for Database Management Version 2* (1990) fue un paso mas alla con una logica de cuatro valores (True, False, Missing but Applicable, Missing but Innaplicable) version.

**Conceptualizacion**
**Conceptos basicos**
Una relacion consiste en un encabezado y un cuerpo. El encabezado define un concjunto de atributos, cada uno con un nombre y un tipo de datos (a veces llamado dominio). El nimero de atributos de ese conjunto es el grado o la aridad de la relacion. El cuerpo es un conjunto de tuplas. Una tupla es una coleccino de N valores, donde N es el grado de la relacion, y cada valor en la tupla corresponde a un atributo unico. El numero de tuplas en este conjunto es la cardinalidad de la relacion.

Las relaciones estan representadas por variables relacionales o relvarios, que pueden ser reasingados. Una base es una coleccion de relvarios.

En este modelo, las bases de datos siguen el principo de informacion: En cualquier momento, toda la informacion en la base de datos esta representada unicamente por valores dentro de tuplas, correspondientes a atributos, en relaciones identificadas por relvars.

**Limitaciones**
Una base de datos puede definir expresiones booleanas arbitrarias como restricciones. Si todas las restricciones se evaluan como verdaderas, la base de datos es consistente; de lo contrario, es inconsistente. Si un cambio a los relvares de una base de datos abandonaria la base de datos en un estado inconsiente, el cambio es ilegal y no debe tener exito.

En general, las restricciones se expresan utilizando operadoes de comparacion relacional, de los cuales solo uno, "es subconjunto de" (⊆), es teoricamente suficiente.

Dos casos especiales de restricciones se expresan como claves y claves foraneas:

**Claves**
Una clave candidata, o simplemente una clave, es un subconjunto mas pequeño de atributos que garantiza diferenciar de manera uinica cada turpla en una relacion. Dado que cada tupla en una relacion debe ser unica, cada relacion necesariamente tiene una clave, que puede ser su conjunto completo de atributos. Una relacion puede tener multiples claves, ya que puede haber multiples formas de diferenciar de manera unica cada tupla.

Un atributo puedee ser unico en las tuplas sin ser una clave. Por ejemplo, una relacion que describe a los empleados de una empresa puede tener dos atributos: ID y Nombre. Incluso si ningun empleado comparte un nombre actualmente, si es posible eventualmente contratar a un nuevo empleado con el mismo nombre que un empleado actual, el subconjuntro de atributos {Nombre} no es una clave. Por el contrario, si el subconjunto {ID} es una clave, esto significa no solo que ningun empleado comparte una identificacion comun, sino que ningun empleado compartira una identificacion.

**Llaves foraneas**
Una llave externa o llave foranea es un subconjunto de atributos A en una relacion R1 que corresponde con una clave de otra relacion R2, con la propiedad de que la proyeccion de R1 en A es un subconjunto de la proyeccion de R2 en AA. En otras palabras, si una tupla en R1 contiene valores para una clave externa, debe haber una tupla correspondiente en R2 que contenga los mismos valores para la clave correspondiente.

**Operaciones relacionales**

Los usuarios (o programas) solicitan datos de una base de datos relacional enviándole una [consulta](https://en.wikipedia.org/wiki/Database_query "Consulta de base de datos"). En respuesta a una consulta, la base de datos devuelve un conjunto de resultados.

A menudo, los datos de múltiples tablas se combinan en una, haciendo una [unión](https://en.wikipedia.org/wiki/Join_\(SQL\) "Únete (SQL)"). Conceptualmente, esto se hace tomando todas las combinaciones posibles de filas (el [producto cartesiano](https://en.wikipedia.org/wiki/Cartesian_product "Producto cartesiano")), y luego filtrando todo excepto la respuesta.

Hay una serie de operaciones relacionales además de unirse. Estos incluyen el proyecto (el proceso de eliminar algunas de las columnas), restringir (el proceso de eliminación de algunas de las filas), la unión (una forma de combinar dos tablas con estructuras similares), la diferencia (que enumera las filas en una tabla que no se encuentran en la otra), la intersección (que enumera las filas que se encuentran en ambas tablas) y el producto (mencionado anteriormente, que combina cada fila de una tabla con cada fila de la otra). Dependiendo de las otras fuentes que consulte, hay una serie de otros operadores, muchos de los cuales se pueden definir en términos de los enumerados anteriormente. Estos incluyen la semi-unión, los operadores externos como la unión exterior y la unión exterior, y diversas formas de división. Luego hay operadores para cambiar el nombre de las columnas, y resumir o agregar operadores, y si permite valores [de relación](https://en.wikipedia.org/wiki/Relation_\(database\) "Relación (base de datos)") como atributos (atributo de valor de relación), entonces operadores como grupo y desgrupo.

La flexibilidad de las bases de datos relacionales permite a los programadores escribir consultas que no fueron anticipadas por los diseñadores de bases de datos. Como resultado, las bases de datos relacionales pueden ser utilizadas por múltiples aplicaciones de maneras que los diseñadores originales no previeron, lo que es especialmente importante para las bases de datos que podrían usarse durante mucho tiempo (tal vez varias décadas). Esto ha hecho que la idea y la implementación de bases de datos relacionales sean muy populares entre las empresas.

**Normalización de la base de datos**

Artículo principal: [Normalización de la base de datos](https://en.wikipedia.org/wiki/Database_normalization "Normalización de la base de datos")

Las [relaciones](https://en.wikipedia.org/wiki/Relation_\(database\) "Relación (base de datos)") se clasifican en función de los tipos de anomalías a las que son vulnerables. Una base de datos que está en la [primera forma normal](https://en.wikipedia.org/wiki/First_normal_form "Primera forma normal") es vulnerable a todos los tipos de anomalías, mientras que una base de datos que está en la [forma](https://en.wikipedia.org/wiki/First_normal_form "First normal form") normal de dominio/clave no tiene anomalías de modificación. Las formas normales son de naturaleza jerárquica. Es decir, el nivel más bajo es la primera forma normal, y la base de datos no puede cumplir con los requisitos para las formas normales de nivel superior sin haber cumplido primero con todos los requisitos de las formas normales menores[. 9]](https://en.wikipedia.org/wiki/Relational_model#cite_note-Normalization-9)

**Interpretación** **lógica**

El modelo relacional es un [sistema formal](https://en.wikipedia.org/wiki/Formal_system "Sistema formal"). Los atributos de una relación definen un conjunto de [proposiciones](https://en.wikipedia.org/wiki/Propositions "Proposiciones") [lógicas](https://en.wikipedia.org/wiki/Logic "Lógica"). Cada proposición puede expresarse como una tupla. El cuerpo de una relación es un subconjunto de estas tuplas, que representan las proposiciones que son verdaderas. Las restricciones representan proposiciones adicionales que también deben ser verdaderas. El [álgebra relacional](https://en.wikipedia.org/wiki/Relational_algebra "Álgebra relacional") es un conjunto de reglas lógicas que pueden [inferir](https://en.wikipedia.org/wiki/Inference "Inferencia") [válidamente](https://en.wikipedia.org/wiki/Validity_\(logic\) "Validez (lógica)") conclusiones de estas proposiciones[. 7]](https://en.wikipedia.org/wiki/Relational_model#cite_note-professionals-7): 95–101 

La definición de una _tupla_ permite una tupla vacía única sin valores, correspondiente al [conjunto](https://en.wikipedia.org/wiki/Empty_set "Set vacío") vacío de atributos. Si una relación tiene un grado de 0 (es decir, su título no contiene atributos), puede tener una cardinalidad de 0 (un cuerpo que no contiene tuplas) o una cardinalidad de 1 (un cuerpo que contiene la única tupla vacía). Estas relaciones representan [los valores de la verdad](https://en.wikipedia.org/wiki/Truth_values "Valores de la verdad") [booleana](https://en.wikipedia.org/wiki/Boolean_domain "Dominio booleano"). La relación con el grado 0 y la cardinalidad 0 es _falsa_, mientras que la relación con el grado 0 y la cardinalidad 1 es _verdadera_[. 7]](https://en.wikipedia.org/wiki/Relational_model#cite_note-professionals-7): 221–223 

 **Ejemplo**

Si una relación de empleados contiene los atributos ⁠ { N a m e , I D } ![{\displaystyle \{Nombre, ID\}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/abb43668170f626c25af84ba1971da95612801fd) ⁠, luego la tupla ⁠ { A l i c e , 1 } ![{\displaystyle \{Alice,1\}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/583a7b773a3e3b47a9b1bcd0da81a3dd3a2f961f) ⁠ Representa la proposición: "Existe un empleado llamado _¿Alice_ Con ID _1_". Esta proposición puede ser verdadera o falsa. Si esta tupla existe en el cuerpo de la relación, la proposición es verdadera (hay un empleado). Si esta tupla no está en el cuerpo de la relación, la proposición es falsa (no hay tal empleado).[[[7]](https://en.wikipedia.org/wiki/Relational_model#cite_note-professionals-7): 96–97 

Además, si ⁠ { I D } ![{\displaystyle \{ID\}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/f7f730c333f858c060a883ab55d1f4468798ba86) ⁠ Es una clave, luego una relación que contiene las tuplas ⁠ { A l i c e , 1 } ![{\displaystyle \{Alice,1\}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/583a7b773a3e3b47a9b1bcd0da81a3dd3a2f961f) ⁠ y ⁠ { B o b , 1 } ![{\displaystyle \{Bob,1\}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/11cc73229affa5fddbc78540b57e7ed020ebebe5) ⁠ Representaría lo siguiente [Contradicciones](https://en.wikipedia.org/wiki/Contradiction "Contradicción"):

1. Existe un empleado con el nombre _Alice_ y el ID _1_1.
2. Existe un empleado con el nombre _Bob_ y el ID _1_1.
3. No existen varios empleados con la misma identificación.

Bajo el [principio de la explosión](https://en.wikipedia.org/wiki/Principle_of_explosion "Principio de explosión"), esta contradicción permitiría al sistema probar que cualquier proposición arbitraria es verdadera. La base de datos debe hacer cumplir la restricción de claves para evitar esto[. 7]](https://en.wikipedia.org/wiki/Relational_model#cite_note-professionals-7): 104 

**Ejemplos**

**Base de datos**

Un ejemplo idealizado, muy sencillo de una descripción de algunos [relvars](https://en.wikipedia.org/wiki/Relvar "Relvar")relvars (variables [de](https://en.wikipedia.org/wiki/Relation_\(database\) "Relación (base de datos)") relación) y sus atributos:

- Cliente (**ID** del , nombre)
- Pedido (**ID** De , Identificación De Cliente, De Factura, Fecha)
- Factura (**ID** De , ID De Cliente, ID De Pedido, Estado)

En este [diseño](https://en.wikipedia.org/wiki/Design "Diseño") tenemos tres relvars: Cliente, Pedido, y Factura. Los atributos en negrita y subrayados son _[claves candidatas](https://en.wikipedia.org/wiki/Candidate_key "Clave candidata")_. Los atributos no en negrita y subrayados son _[claves extranjeras](https://en.wikipedia.org/wiki/Foreign_key "Clave extranjera")_.

Por lo general, se elige una [clave candidata](https://en.wikipedia.org/wiki/Candidate_key "Clave candidata") para que se llame a la [clave principal](https://en.wikipedia.org/wiki/Primary_key "Llave principal") y se usa con [preferencia](https://en.wikipedia.org/wiki/Preference "Preferencia") sobre las otras claves candidatas, que luego se denominan claves [alternativas](https://en.wikipedia.org/wiki/Alternate_key "Llave alternativa").

Una _clave candidata_ es un [identificador](https://en.wikipedia.org/wiki/Identifier "Identificador") único que impone que no [tuple](https://en.wikipedia.org/wiki/Tuple "Tupla")se duplicará ninguna tupla; esto haría que la [relación](https://en.wikipedia.org/wiki/Relation_\(database\) "Relación (base de datos)") se convirtiera en otra cosa, a saber, una [bolsa](https://en.wikipedia.org/wiki/Bag_\(mathematics\) "Bolsa (matemáticas)"), al violar la definición básica de un [conjunto](https://en.wikipedia.org/wiki/Set_\(mathematics\) "Set (matemáticas)"). Tanto las claves extranjeras como las superkeys (que incluyen las claves candidatas) pueden ser compuestas, es decir, pueden estar compuestas por varios atributos. A continuación se muestra una representación tabular de una relación de nuestro ejemplo de relvar de cliente; una relación puede considerarse como un valor que se puede atribuir a un relvar.

**Relación con el cliente**

|ID del cliente|Nombre|
|---|---|
|123|¿Alice|
|456|¿Bob|
|789|¿Carol|

Si intentamos _insertar_ un nuevo cliente con el ID _123_, esto violaría el diseño del relvar ya que **el ID** de es una _clave principal_ y ya tenemos un _123_. El [DBMS](https://en.wikipedia.org/wiki/DBMS "DBMS") debe rechazar una [transacción](https://en.wikipedia.org/wiki/Database_transaction "Transacciones de base de") como esta que haría que la [base](https://en.wikipedia.org/wiki/Database "Base de datos") de [datos](https://en.wikipedia.org/wiki/Database "Base de datos") sea inconsistente por una violación de una [restricción](https://en.wikipedia.org/wiki/Database_integrity "Integridad de") de [integridad](https://en.wikipedia.org/wiki/Database_integrity "Database integrity"). Sin embargo, es posible insertar otro cliente llamado _Alice_, siempre y cuando este nuevo cliente tenga un ID único, ya que el campo Nombre no forma parte de la clave principal.

Las _[claves externas](https://en.wikipedia.org/wiki/Foreign_key "Clave extranjera")_ son [restricciones](https://en.wikipedia.org/wiki/Integrity_constraint "Limitación de integridad") de [integridad](https://en.wikipedia.org/wiki/Integrity_constraint "Integrity constraint") que hacen cumplir que el [valor](https://en.wikipedia.org/wiki/Value_\(computer_science\) "Valor (ciencia de la computadora)") del [conjunto](https://en.wikipedia.org/w/index.php?title=Attribute_set&action=edit&redlink=1 "Conjunto de atributos (la página no existe)") de [atributos](https://en.wikipedia.org/w/index.php?title=Attribute_set&action=edit&redlink=1 "Attribute set (page does not exist)") se extrae de una _[clave candidata](https://en.wikipedia.org/wiki/Candidate_key "Clave candidata")_ en otra [relación](https://en.wikipedia.org/wiki/Relation_\(database\) "Relación (base de datos)"). Por ejemplo, en la relación de pedido el atributo **Customer ID** es una clave externa. Una _[unión](https://en.wikipedia.org/wiki/Join_\(SQL\) "Únete (SQL)")_ es la [operación](https://en.wikipedia.org/wiki/Operation_\(mathematics\) "Operación (matemáticas)") que se basa en [la información](https://en.wikipedia.org/wiki/Information "Información") de varias relaciones a la vez. Al unir a los relvars del ejemplo anterior, _podríamos_ consultar la base de datos de todos los clientes, pedidos y facturas. Si solo quisiéramos las tuplas para un cliente específico, especificaríamos esto utilizando una [condición de restricción](https://en.wikipedia.org/w/index.php?title=Restriction_condition&action=edit&redlink=1 "Condición de restricción (la página no existe)"). Si quisiéramos recuperar todos los pedidos para el cliente _123_, podríamos [consultar](https://en.wikipedia.org/wiki/Information_retrieval "Recuperación de información") la base de datos para devolver cada fila de la tabla de pedidos con **el ID** _de_ cliente _123_.

Hay una falla en el [diseño](https://en.wikipedia.org/wiki/Database_design "Diseño de base de datos") de nuestra [base](https://en.wikipedia.org/wiki/Database_design "Diseño de base de datos") de [datos](https://en.wikipedia.org/wiki/Database_design "Database design") arriba. El relvar de factura contiene un atributo de ID de pedido. Por lo tanto, cada tupla en el relvar de la Factura tendrá un ID de Orden, lo que implica que hay precisamente una Orden para cada Factura. Pero en realidad se puede crear una factura contra muchos pedidos, o de hecho para ningún orden en particular. Además, el relvar de orden contiene un atributo de ID de factura, lo que implica que cada orden tiene una factura correspondiente. Pero de nuevo esto no siempre es cierto en el mundo real. Un pedido a veces se paga a través de varias facturas, y a veces se paga sin factura. En otras palabras, puede haber muchas facturas por orden y muchas órdenes por factura. Esta es una relación **[de muchos a muchos](https://en.wikipedia.org/wiki/Many-to-many_\(data_model\) "Muchos a muchos (modelo de datos)")** entre Orden y Factura (también llamada una _relación no específica_). Para representar esta relación en la base de datos se debe introducir un nuevo relvar cuyo [papel](https://en.wikipedia.org/wiki/Role "Papel") es especificar la correspondencia entre Órdenes y Facturas:

OrderInvoice (**ID** De ,  **Factura**)

Ahora, el relvar de Orden tiene una _[relación de uno a muchos](https://en.wikipedia.org/wiki/One-to-many_\(data_model\) "Uno a muchos (modelo de datos)")_ con la tabla de Factura de Orden, al igual que el relvar de Factura. Si queremos recuperar cada Factura para una Orden **Order ID**en particular, podemos consultar todos los pedidos donde el **ID** de Pedido en la relación de Pedido es igual al de Pedido en OrderInvoice, y donde el **ID** de Factura en OrderInvoice es igual al de **Invoice ID**en Factura.

**Aplicación a bases de datos relacionales**

Un **[tipo](https://en.wikipedia.org/wiki/Data_domain "Dominio de datos")** de en una base de datos relacional puede ser el conjunto de enteros, el conjunto de cadenas de caracteres, el conjunto de fechas, etc. El modelo relacional no dicta qué tipos deben ser soportados.

Los **atributos** se representan comúnmente como **[columnas](https://en.wikipedia.org/wiki/Column_\(database\) "Columna (base de datos)")**, **tuplas** como **[filas](https://en.wikipedia.org/wiki/Row_\(database\) "Fila (base de datos)")** y **relaciones** como **tablas**. Una tabla se especifica como una lista de definiciones de columna, cada una de las cuales especifica un nombre de columna único y el tipo de los valores que se permiten para esa columna. Un **_valor_ de atributo** es la entrada en una columna y fila específicas.

Una **[referencia](https://en.wikipedia.org/wiki/Relvar "Relvar")** de base de datos (variable de relación) se conoce comúnmente como tabla **base**. El encabezamiento de su valor asignado en cualquier momento es el especificado en la declaración de la tabla y su cuerpo es el más recientemente asignado por un **operador de actualización** (normalmente, INSERTAR, ACTUALIZAR o ELIMINAR). El encabezamiento y el cuerpo de la tabla resultantes de la evaluación de una consulta están determinados por las definiciones de los operadores utilizados en dicha consulta.

 **SQL y el modelo relacional**

SQL, inicialmente impulsado como el lenguaje [estándar](https://en.wikipedia.org/wiki/Standardization "Estandarización") para [bases](https://en.wikipedia.org/wiki/Relational_database "Base de datos relacional") de [datos relacionales](https://en.wikipedia.org/wiki/Relational_database "Relational database"), se desvía del modelo [relacional](https://en.wikipedia.org/wiki/Relational_database "Relational database") en varios lugares. El estándar [ISO](https://en.wikipedia.org/wiki/International_Organization_for_Standardization "Organización Internacional para la Normalización") SQL actual no menciona el modelo relacional ni utiliza términos o conceptos relacionales._[citation needed](https://en.wikipedia.org/wiki/Wikipedia:Citation_needed "Wikipedia:Se necesita cita")_

De acuerdo con el modelo relacional, los atributos y tuplas de una relación son [conjuntos matemáticos](https://en.wikipedia.org/wiki/Set_\(mathematics\) "Set (matemáticas)"), lo que significa que no están ordenados y son únicos. En una tabla SQL, ni las filas ni las columnas son conjuntos adecuados. Una tabla puede contener tanto filas duplicadas como columnas duplicadas, y las columnas de una tabla están explícitamente ordenadas. SQL utiliza un valor [nulo](https://en.wikipedia.org/wiki/Null_\(SQL\) "Null (SQL)") para indicar los datos que faltan, que no tiene análogo en el modelo relacional. Debido a que una fila puede representar información desconocida, SQL no se adhiere al _Principio de información_ del modelo relacional

Los usuarios (o programas) solicitan datos de una base de datos relacional enviándole una [consulta](https://en.wikipedia.org/wiki/Database_query "Consulta de base de datos"). En respuesta a una consulta, la base de datos devuelve un conjunto de resultados.

A menudo, los datos de múltiples tablas se combinan en una, haciendo una [unión](https://en.wikipedia.org/wiki/Join_\(SQL\) "Únete (SQL)"). Conceptualmente, esto se hace tomando todas las combinaciones posibles de filas (el [producto cartesiano](https://en.wikipedia.org/wiki/Cartesian_product "Producto cartesiano")), y luego filtrando todo excepto la respuesta.

Hay una serie de operaciones relacionales además de unirse. Estos incluyen el proyecto (el proceso de eliminar algunas de las columnas), restringir (el proceso de eliminación de algunas de las filas), la unión (una forma de combinar dos tablas con estructuras similares), la diferencia (que enumera las filas en una tabla que no se encuentran en la otra), la intersección (que enumera las filas que se encuentran en ambas tablas) y el producto (mencionado anteriormente, que combina cada fila de una tabla con cada fila de la otra). Dependiendo de las otras fuentes que consulte, hay una serie de otros operadores, muchos de los cuales se pueden definir en términos de los enumerados anteriormente. Estos incluyen la semi-unión, los operadores externos como la unión exterior y la unión exterior, y diversas formas de división. Luego hay operadores para cambiar el nombre de las columnas, y resumir o agregar operadores, y si permite valores [de relación](https://en.wikipedia.org/wiki/Relation_\(database\) "Relación (base de datos)") como atributos (atributo de valor de relación), entonces operadores como grupo y desgrupo.

La flexibilidad de las bases de datos relacionales permite a los programadores escribir consultas que no fueron anticipadas por los diseñadores de bases de datos. Como resultado, las bases de datos relacionales pueden ser utilizadas por múltiples aplicaciones de maneras que los diseñadores originales no previeron, lo que es especialmente importante para las bases de datos que podrían usarse durante mucho tiempo (tal vez varias décadas). Esto ha hecho que la idea y la implementación de bases de datos relacionales sean muy populares entre las empresas.

**Normalización de la base de datos**

Artículo principal: [Normalización de la base de datos](https://en.wikipedia.org/wiki/Database_normalization "Normalización de la base de datos")

Las [relaciones](https://en.wikipedia.org/wiki/Relation_\(database\) "Relación (base de datos)") se clasifican en función de los tipos de anomalías a las que son vulnerables. Una base de datos que está en la [primera forma normal](https://en.wikipedia.org/wiki/First_normal_form "Primera forma normal") es vulnerable a todos los tipos de anomalías, mientras que una base de datos que está en la [forma](https://en.wikipedia.org/wiki/First_normal_form "First normal form") normal de dominio/clave no tiene anomalías de modificación. Las formas normales son de naturaleza jerárquica. Es decir, el nivel más bajo es la primera forma normal, y la base de datos no puede cumplir con los requisitos para las formas normales de nivel superior sin haber cumplido primero con todos los requisitos de las formas normales menores[. 9]](https://en.wikipedia.org/wiki/Relational_model#cite_note-Normalization-9)

**Interpretación lógica**

El modelo relacional es un [sistema formal](https://en.wikipedia.org/wiki/Formal_system "Sistema formal"). Los atributos de una relación definen un conjunto de [proposiciones](https://en.wikipedia.org/wiki/Propositions "Proposiciones") [lógicas](https://en.wikipedia.org/wiki/Logic "Lógica"). Cada proposición puede expresarse como una tupla. El cuerpo de una relación es un subconjunto de estas tuplas, que representan las proposiciones que son verdaderas. Las restricciones representan proposiciones adicionales que también deben ser verdaderas. El [álgebra relacional](https://en.wikipedia.org/wiki/Relational_algebra "Álgebra relacional") es un conjunto de reglas lógicas que pueden [inferir](https://en.wikipedia.org/wiki/Inference "Inferencia") [válidamente](https://en.wikipedia.org/wiki/Validity_\(logic\) "Validez (lógica)") conclusiones de estas proposiciones[. 7]](https://en.wikipedia.org/wiki/Relational_model#cite_note-professionals-7): 95–101 

La definición de una _tupla_ permite una tupla vacía única sin valores, correspondiente al [conjunto](https://en.wikipedia.org/wiki/Empty_set "Set vacío") vacío de atributos. Si una relación tiene un grado de 0 (es decir, su título no contiene atributos), puede tener una cardinalidad de 0 (un cuerpo que no contiene tuplas) o una cardinalidad de 1 (un cuerpo que contiene la única tupla vacía). Estas relaciones representan [los valores de la verdad](https://en.wikipedia.org/wiki/Truth_values "Valores de la verdad") [booleana](https://en.wikipedia.org/wiki/Boolean_domain "Dominio booleano"). La relación con el grado 0 y la cardinalidad 0 es _falsa_, mientras que la relación con el grado 0 y la cardinalidad 1 es _verdadera_[. 7]](https://en.wikipedia.org/wiki/Relational_model#cite_note-professionals-7): 221–223 

**Ejemplo**

Si una relación de empleados contiene los atributos ⁠ { N a m e , I D }⁠, luego la tupla ⁠ { A l i c e , 1 } Representa la proposición: "Existe un empleado llamado _¿Alice_ Con ID _1_". Esta proposición puede ser verdadera o falsa. Si esta tupla existe en el cuerpo de la relación, la proposición es verdadera (hay un empleado). Si esta tupla no está en el cuerpo de la relación, la proposición es falsa (no hay tal empleado).

Además, si ⁠ { I D } ⁠ Es una clave, luego una relación que contiene las tuplas ⁠ { A l i c e , 1 } ![{\displaystyle \{Alice,1\}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/583a7b773a3e3b47a9b1bcd0da81a3dd3a2f961f) ⁠ y ⁠ { B o b , 1 } ⁠ Representaría las siguientes [Contradicciones](https://en.wikipedia.org/wiki/Contradiction "Contradicción"):

1. Existe un empleado con el nombre _Alice_ y el ID _1_1.
2. Existe un empleado con el nombre _Bob_ y el ID _1_1.
3. No existen varios empleados con la misma identificación.

Bajo el [principio de la explosión](https://en.wikipedia.org/wiki/Principle_of_explosion "Principio de explosión"), esta contradicción permitiría al sistema probar que cualquier proposición arbitraria es verdadera. La base de datos debe hacer cumplir la restricción de claves para evitar esto.

**Ejemplos**

**Base de datos**

Un ejemplo idealizado, muy sencillo de una descripción de algunos [relvars](https://en.wikipedia.org/wiki/Relvar "Relvar")relvars (variables [de](https://en.wikipedia.org/wiki/Relation_\(database\) "Relación (base de datos)") relación) y sus atributos:

- Cliente (**ID** del , nombre)
- Pedido (**ID** De , Identificación De Cliente, De Factura, Fecha)
- Factura (**ID** De , ID De Cliente, ID De Pedido, Estado)

En este [diseño](https://en.wikipedia.org/wiki/Design "Diseño") tenemos tres relvars: Cliente, Pedido, y Factura. Los atributos en negrita y subrayados son _[claves candidatas](https://en.wikipedia.org/wiki/Candidate_key "Clave candidata")_. Los atributos no en negrita y subrayados son _[claves extranjeras](https://en.wikipedia.org/wiki/Foreign_key "Clave extranjera")_.

Por lo general, se elige una [clave candidata](https://en.wikipedia.org/wiki/Candidate_key "Clave candidata") para que se llame a la [clave principal](https://en.wikipedia.org/wiki/Primary_key "Llave principal") y se usa con [preferencia](https://en.wikipedia.org/wiki/Preference "Preferencia") sobre las otras claves candidatas, que luego se denominan claves [alternativas](https://en.wikipedia.org/wiki/Alternate_key "Llave alternativa").

Una _clave candidata_ es un [identificador](https://en.wikipedia.org/wiki/Identifier "Identificador") único que impone que no [tuple](https://en.wikipedia.org/wiki/Tuple "Tupla")se duplicará ninguna tupla; esto haría que la [relación](https://en.wikipedia.org/wiki/Relation_\(database\) "Relación (base de datos)") se convirtiera en otra cosa, a saber, una [bolsa](https://en.wikipedia.org/wiki/Bag_\(mathematics\) "Bolsa (matemáticas)"), al violar la definición básica de un [conjunto](https://en.wikipedia.org/wiki/Set_\(mathematics\) "Set (matemáticas)"). Tanto las claves extranjeras como las superkeys (que incluyen las claves candidatas) pueden ser compuestas, es decir, pueden estar compuestas por varios atributos. A continuación se muestra una representación tabular de una relación de nuestro ejemplo de relvar de cliente; una relación puede considerarse como un valor que se puede atribuir a un relvar.

**Relación con el cliente**

|ID del cliente|Nombre|
|---|---|
|123|¿Alice|
|456|¿Bob|
|789|¿Carol|

Si intentamos _insertar_ un nuevo cliente con el ID _123_, esto violaría el diseño del relvar ya que **el ID** de es una _clave principal_ y ya tenemos un _123_. El [DBMS](https://en.wikipedia.org/wiki/DBMS "DBMS") debe rechazar una [transacción](https://en.wikipedia.org/wiki/Database_transaction "Transacciones de base de") como esta que haría que la [base](https://en.wikipedia.org/wiki/Database "Base de datos") de [datos](https://en.wikipedia.org/wiki/Database "Base de datos") sea inconsistente por una violación de una [restricción](https://en.wikipedia.org/wiki/Database_integrity "Integridad de") de [integridad](https://en.wikipedia.org/wiki/Database_integrity "Database integrity"). Sin embargo, es posible insertar otro cliente llamado _Alice_, siempre y cuando este nuevo cliente tenga un ID único, ya que el campo Nombre no forma parte de la clave principal.

Las _[claves externas](https://en.wikipedia.org/wiki/Foreign_key "Clave extranjera")_ son [restricciones](https://en.wikipedia.org/wiki/Integrity_constraint "Limitación de integridad") de [integridad](https://en.wikipedia.org/wiki/Integrity_constraint "Integrity constraint") que hacen cumplir que el [valor](https://en.wikipedia.org/wiki/Value_\(computer_science\) "Valor (ciencia de la computadora)") del [conjunto](https://en.wikipedia.org/w/index.php?title=Attribute_set&action=edit&redlink=1 "Conjunto de atributos (la página no existe)") de [atributos](https://en.wikipedia.org/w/index.php?title=Attribute_set&action=edit&redlink=1 "Attribute set (page does not exist)") se extrae de una _[clave candidata](https://en.wikipedia.org/wiki/Candidate_key "Clave candidata")_ en otra [relación](https://en.wikipedia.org/wiki/Relation_\(database\) "Relación (base de datos)"). Por ejemplo, en la relación de pedido el atributo **Customer ID** es una clave externa. Una _[unión](https://en.wikipedia.org/wiki/Join_\(SQL\) "Únete (SQL)")_ es la [operación](https://en.wikipedia.org/wiki/Operation_\(mathematics\) "Operación (matemáticas)") que se basa en [la información](https://en.wikipedia.org/wiki/Information "Información") de varias relaciones a la vez. Al unir a los relvars del ejemplo anterior, _podríamos_ consultar la base de datos de todos los clientes, pedidos y facturas. Si solo quisiéramos las tuplas para un cliente específico, especificaríamos esto utilizando una [condición de restricción](https://en.wikipedia.org/w/index.php?title=Restriction_condition&action=edit&redlink=1 "Condición de restricción (la página no existe)"). Si quisiéramos recuperar todos los pedidos para el cliente _123_, podríamos [consultar](https://en.wikipedia.org/wiki/Information_retrieval "Recuperación de información") la base de datos para devolver cada fila de la tabla de pedidos con **el ID** _de_ cliente _123_.

Hay una falla en el [diseño](https://en.wikipedia.org/wiki/Database_design "Diseño de base de datos") de nuestra [base](https://en.wikipedia.org/wiki/Database_design "Diseño de base de datos") de [datos](https://en.wikipedia.org/wiki/Database_design "Database design") arriba. El relvar de factura contiene un atributo de ID de pedido. Por lo tanto, cada tupla en el relvar de la Factura tendrá un ID de Orden, lo que implica que hay precisamente una Orden para cada Factura. Pero en realidad se puede crear una factura contra muchos pedidos, o de hecho para ningún orden en particular. Además, el relvar de orden contiene un atributo de ID de factura, lo que implica que cada orden tiene una factura correspondiente. Pero de nuevo esto no siempre es cierto en el mundo real. Un pedido a veces se paga a través de varias facturas, y a veces se paga sin factura. En otras palabras, puede haber muchas facturas por orden y muchas órdenes por factura. Esta es una relación **[de muchos a muchos](https://en.wikipedia.org/wiki/Many-to-many_\(data_model\) "Muchos a muchos (modelo de datos)")** entre Orden y Factura (también llamada una _relación no específica_). Para representar esta relación en la base de datos se debe introducir un nuevo relvar cuyo [papel](https://en.wikipedia.org/wiki/Role "Papel") es especificar la correspondencia entre Órdenes y Facturas:

```
OrderInvoice (ID De ,  Factura)
```

Ahora, el relvar de Orden tiene una _[relación de uno a muchos](https://en.wikipedia.org/wiki/One-to-many_\(data_model\) "Uno a muchos (modelo de datos)")_ con la tabla de Factura de Orden, al igual que el relvar de Factura. Si queremos recuperar cada Factura para una Orden **Order ID**en particular, podemos consultar todos los pedidos donde el **ID** de Pedido en la relación de Pedido es igual al de Pedido en OrderInvoice, y donde el **ID** de Factura en OrderInvoice es igual al de **Invoice ID**en Factura.

**Aplicación a bases de datos relacionales**

Un **[tipo](https://en.wikipedia.org/wiki/Data_domain "Dominio de datos")** de en una base de datos relacional puede ser el conjunto de enteros, el conjunto de cadenas de caracteres, el conjunto de fechas, etc. El modelo relacional no dicta qué tipos deben ser soportados.

Los **atributos** se representan comúnmente como **[columnas](https://en.wikipedia.org/wiki/Column_\(database\) "Columna (base de datos)")**, **tuplas** como **[filas](https://en.wikipedia.org/wiki/Row_\(database\) "Fila (base de datos)")** y **relaciones** como **tablas**. Una tabla se especifica como una lista de definiciones de columna, cada una de las cuales especifica un nombre de columna único y el tipo de los valores que se permiten para esa columna. Un **_valor_ de atributo** es la entrada en una columna y fila específicas.

Una **[referencia](https://en.wikipedia.org/wiki/Relvar "Relvar")** de base de datos (variable de relación) se conoce comúnmente como tabla **base**. El encabezamiento de su valor asignado en cualquier momento es el especificado en la declaración de la tabla y su cuerpo es el más recientemente asignado por un **operador de actualización** (normalmente, INSERTAR, ACTUALIZAR o ELIMINAR). El encabezamiento y el cuerpo de la tabla resultantes de la evaluación de una consulta están determinados por las definiciones de los operadores utilizados en dicha consulta.

**SQL y el modelo relacional**

SQL, inicialmente impulsado como el lenguaje [estándar](https://en.wikipedia.org/wiki/Standardization "Estandarización") para [bases](https://en.wikipedia.org/wiki/Relational_database "Base de datos relacional") de [datos relacionales](https://en.wikipedia.org/wiki/Relational_database "Relational database"), se desvía del modelo [relacional](https://en.wikipedia.org/wiki/Relational_database "Relational database") en varios lugares. El estándar [ISO](https://en.wikipedia.org/wiki/International_Organization_for_Standardization "Organización Internacional para la Normalización") SQL actual no menciona el modelo relacional ni utiliza términos o conceptos relacionales._[citation needed](https://en.wikipedia.org/wiki/Wikipedia:Citation_needed "Wikipedia:Se necesita cita")_

De acuerdo con el modelo relacional, los atributos y tuplas de una relación son [conjuntos matemáticos](https://en.wikipedia.org/wiki/Set_\(mathematics\) "Set (matemáticas)"), lo que significa que no están ordenados y son únicos. En una tabla SQL, ni las filas ni las columnas son conjuntos adecuados. Una tabla puede contener tanto filas duplicadas como columnas duplicadas, y las columnas de una tabla están explícitamente ordenadas. SQL utiliza un valor [nulo](https://en.wikipedia.org/wiki/Null_\(SQL\) "Null (SQL)") para indicar los datos que faltan, que no tiene análogo en el modelo relacional. Debido a que una fila puede representar información desconocida, SQL no se adhiere al _Principio de información_ del modelo relacional

---
### Integridad referencial
La integridad referencial es propiedad de la base de datos. La misma significa que la clave extrerna de una tabla de referencia siempre debe aludir a una  fila valida de la tabla a la que se haga referencia. La integridad referencial garantiza que la relacion entre dos tablas permanezca sincronizada durante las operaciones de actualizacion y eliminacion.

Todas las bases de datos relacionales gozan de esta propiedad gracias a que el software gestor de bases de datos vela por su cumplimiento. En cambio, las bases de datos jerarquicas requieren que los programadores se aseguren de mantener tal propiedad en sus programas.

**Ejemplo: Como funciona**
Supongamos una base de datos con las entidades Persona y Factura. Toda factura correspondiente a una persona y solamente una. implica que en todo momento dichos datos sean correctos, sin repeticiones innecesariasm datos perdidos y relaciones mal resueltas.

Supongamos que una persona se identifica por su atributo DNI. Tambien tendra otros atributos como el Nombre y Direccion. La entidad Factura debe tener un atributo DNI_cliente que identifique a quien pertenece la factura.

Por sentido comun es evidente que todo valor de DNI_cliente debe corresponder con algun valor existente del atributo DNI de la entidad Persona. Es la idea intuitiva de la integridad referencial.

Existen tres tipos de integridad referencial:
1. Integridad referencial debil: Si una tupla de R todos los valores de los atributos de K tienen un mismo valor que no es nulo, entonces debe existir una tupla en S que tome esos mismos valores en los atributos de J;
2. Integridad referencial parcial: Si en una tupla de R algun atributo de K toma el valor nulo, entonces debe existir una tupla en S que tome en los atributos de J los mismos valores que los atributos de K con valor no nulo; y
3. Integridad referencial completa: En una tupla de R todos los atributos de K deben tener el valor nulo o bien todos tienen un valor que no es el nulo y entonces debe existir una tupla en S que tome los atributos de J los mismos valores que toman los de K.

**La integridad referencial en juego**
Cuando se crea una nueva instancia de Factura, la integridad referencial exige que el atributo DNI_cliente coincida con el atributo DNI de alguna instancia de la entidad Persona. En caso contrario, no se permite la operacion.

Cuando se intenta eliminar una instancia de Persona, la integridad referencial exige que no exista ninguna factua asociada, es decir, se comprueba que no existe ninguna instancia de facutra cuyo atributo DNI_Cliente coincida con el atributo de la instancia a borrar. En caso contrario, no se permite la operacion.