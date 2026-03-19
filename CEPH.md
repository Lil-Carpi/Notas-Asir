Ceph File System es un sistema de archivos distribuido libre, está diseñado para el uso con gran cantidad de datos, está muy enfocado para el uso con Big Data. Ceph tiene como objetivo ser POSIX-compatible y completamente distribuido sin ningún punto único de fallo. Los datos tienen replicación libre de errores, haciéndolo tolerante a fallos.

Ceph incluye un orquestador (ceph-deploy) para la instalación y la configuración de los monitores y OSD. Los clientes tienen la capacidad de montar el sistema de archivos utilizando el módulo cliente del [[Kernel Linux|Kernel Linux]]. El 19 de marzo del 2010, [[Linus Torvalds|Linus Torvalds]] incluyó el cliente Ceph para el [[Kernel Linux|Kernel Linux]] 2.6.34. También está disponible un viejo cliente basado en FUSE. Los servidores lo corren como un Unix Daemon regular. Ceph soporta las API de Swift (OpenStack) y Amazon (S3).

---
## Historia
Ceph fue creado inicialmente por Sage Weil (desarrollador del concepto Webring y cofundador de DreamHost) para su doctorado, supervisado por el profesor Scott A. Brandt en la Facultad de Ingenieria Jack Baskin (JBSE) de la universidad de California en Santa Cruz (UCSC). Luego de la graduación en otoño del 2007, Sage Weil continuo trabajando sobre Ceph a tiempo completo, al equipo central de desarrollo se incorporaron Yehuda Sadeh Weinraub y Gregory Farnum. En 2012, Weil funda Inktank, para brindar servicios de soporte profesionalizado a los usuarios de Ceph. El equipo central de desarrollo obtuvo un crecimiento importante tras el anuncio de la creación de Inktank.

### Versión Argonaut
El 3 de julio del 2012, el equipo de desarrollo de Ceph liberó la versión Argonaut, la primera versión de Ceph con soporte de larga duración. Esta versión contará solamente con correcciones de estabilidad y actualizaciones de rendimiento, y las nuevas características se implementaran nativamente en las futuras versiones.

---
## Diseño
Ceph emplea tres tipos diferentes de daemons:
- **Monitores de clúster** (ceph-mon), mantienen un control de actividad y fallos en los nodos del clúster.
Una copia de datos