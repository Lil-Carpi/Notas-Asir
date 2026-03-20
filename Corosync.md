El Corosync Cluster Engine es una implementacion open source del [[Totem Single Ring Ordering and Membership Protocol  - Protocolos de red|Totem Single Ring Ordering and Membership Protocol]]. Fue un derivado del proyecto OpenAIS y licenciado bajo la nueva licencia BSD. La mision del esfuerzo de Corosync es el de desarrollar, lanzar y dar soporte a una comunidad definida como el cluster open source.

## Caracteristicas
El motor de cluster Corosync es un sistema de comunicacion en grupo con caracteristicas extra para la implementacion de la [[Alta disponibilidad|Alta disponibilidad]] en aplicaciones

El proyecto cuenta con cuatro APIs en C, que tienen las siguientes caracteristicas:

- Un modelo de comunicacion de grupo de procesos cerrado con garantias de sincronizacion virtual para crear maquinas de estado replicadas.
- Un simple gestor de disponibilidad que reinicia el proceso de la aplicacion cuando este falla.
- Una base de datos de configuracion y estadisticas en memoria que proporciona la cacpacidad de configurar, recuperar y recibir notificaciones de cambio de informacion.
- Un sistema de "qurum" que notifica las aplicaciones cuando se logra o se pierde un quorum.

El software está diseñado para funcionar en redes [[UDP_IP - Protocolos de red|UDP/IP]] e InfiniBand.

---
## Arquitectura
El software esta compuesto por un binario ejecutivo que utiliza un modelo de comunicacion [[Modelo Cliente-Servidor|Cliente-Servidor]] entre bibliotecas y motores de servicio. Los modulos cargables, llamados motores de servicio, se cargan en el motor de cluster de Corosync y utiliza los servicios proporcionados por la API interna de Corosync Service Engine.

Los servicios prestados por la API interna de Corosync Service Engine son:

- Una implementacion del protocolo [[Totem Single Ring Ordering and Membership Protocol  - Protocolos de red|Totem Single Ring Ordering and Membership]], que proporciona el modelo Extended Virtual Synchrony para mensajeria y membresia.
- El sistema IPC de memoria compartida de alto rendimiento para empresas.
- Una base de datos de objetos que implementa el modelo de base de datos en memoria.
- Sistemas para enrutar mensajes IPC y Totems a los motores de servicio correctos.

Ademas, Corosync proporciona varios motores de servicio predeterminados que se utilizan a traves de las API de C:

- cpg - Grupo de Procesos Cerrados
- sam - Administrador de disponibilidad Simple
- confdb - Base de datos de configuracion y estadistca
- quórum - Proporciona notificaciones de ganancia o perdida de quórum

---
## Historia
El proyecto fue anunciado formalmente en julio del 2008 a traves de un documento de conferencia en el Sinopsio de Linux. El codigo fuente de OpenAIS se refactorizo de tal manera que los componentes de la infraestructura central se colocaron en Corosync y las API del foro SA se mantuvieron en OpenAIS.

En la segunda version de Corosync, publicada en el 2012, el susbsistema de quórum se cambio e integro en el demonio. Esta version esta disponible desde el [[fedora|fedora]] 17 y [[RHEL|RHEL]] 7.

El desarrollo de la rama Flatiron (1.4.x) termino con la version 1.4.10. La sucursal de Needle se anuncio estable con un lanzamiento de 2.0.0 el 10 de abril del 2012. El desarrollo de esta sucursal se detuvo con el lanzamiento de 2.4.6 el 9 de noviembre del 2022, porque la sucursal 3.x (Camelback) se considero estable despues de casi 4 años de trabajo.