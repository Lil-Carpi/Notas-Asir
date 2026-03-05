![[DMZ.png]]

En seguridad informatica, una DMZ (Zona desmilitarizada) o red perimetral es una red local que se ubica entre la red interna de una organizacion y una red externa, generalmente internet. El objetivo de una DMZ es que se permitan las conecciones desde la red externa a la DMZ, pero que _en general_ no se permitan las conecciones desde la _DMZ_ a la red interna (los equipos de la DMZ no deben conectarse directamente con la red interna). Esto permite que los equipos de la DMZ puedan dar servicios a la red externa, a la vez que protejen la red interna en el caso que unos intrusos comprometan la seguridad de los equipos situados en la zona desmilitarizada. Para cualquiera de la red externa que quiera conectarse ilegalmente a la red interna, la zona desmilitarizada se convierte en un callejon sin salida.

La _DMZ_ se usa habitualmente para ubicar servidores que es necesario que sean acredidos desde fuera, como servidores de correo electronico, web y DNS. Y son precisamente estos servicios alojados en estos servidores los unicos que pueden establecer trafico de datos entre la DMZ y la red interna, con una coneccion de datos entre un servidor web y una base de datos protegida situada en la red interna.

Las conecciones que se realizan desde la red externa hacia la DMZ se controlan generalmente utilizando _Port Address Translation_ (PAT).

Una DMZ se crea a menudo a traves de las opciones de configuracion del Firewall, donde cada red se conecta a un puerto distinto de este. Esta configuracion se llama _Tree-Legged Firewall_.

Observese que los enrutadores domesticos son llamados _DMZ host_, aunque esa no es una definicion correcta de una DMZ.