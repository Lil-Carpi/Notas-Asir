#SQL - Structured Query Language
Proveniente de [[Índice - SQL]]

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
