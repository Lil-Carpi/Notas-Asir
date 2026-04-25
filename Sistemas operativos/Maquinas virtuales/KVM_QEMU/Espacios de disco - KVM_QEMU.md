Normalmente, cuando creamos una máquina virtual, le debemos de asignar un espacio tope que ha de tener la memoria del disco duro del mismo. En KVM/QEMU, por defecto, va creciendo conforme la VM necesite. 

KVM/QEMU es bastante flexible y te permite decidir el comportamiento de la memoria, dependiendo del formato del disco y de la configuración al crearlo.

---
## Thin provisioning
El *Thin provisioning* (o Aprovisionamiento fino), es el concepto en la virtualización de que el disco duro asignado a una máquina virtual, vaya creciendo conforme la VM lo necesite.

El formato estándar en el que se crea los discos duros en KVM/virt-manager, él por defecto es  `qcow2` (QEMU Copy On Write).
Si configuras el disco virtual con  un límite máximo de, por ejemplo, 50 GB, pero al instalar el sistema solo ocupa 5 GB, el archivo `.qcow2` en el host solo pesará esos 5 GB. Solo comenzará a crecer a medida que instales programas o descargues archivos dentro de la VM, hasta que el archivo se engorde hasta llegar al tope de esos 50 GB.

Gracias a esto, te ahorras una burrada de espacio real del disco duro. Puedes tener como 5 VMs de 50 GB metidas en un disco duro de 100 GB, siempre y cuando no llenes todo al máximo.
Pero sí que hay una pequeñísima desventaja en perdida de rendimiento (minúscula, ni la notas), ya que el sistema tiene que hacer el esfuerzo de agrandar el archivo a tiempo real cuando escribes nuevos datos.

---
## Thick Provisioning
El *Thick provisioning* (Pre asignado, Formato `raw` o espacio reservado) es el concepto de guardar todo el espacio desde el primer segundo. De golpe, el sistema guarda esos 50 GB de disco duro del todo. En virt-manager, esto se hace marcando la casilla "Asignar todo el disco ahora" (Allocate entire disk now) al crear el almacenamiento.

Si le das, como el ejemplo de antes, 50 GB a la VM, el archivo del host pesará 50 GB inmediatamente, aunque la VM este completamente vacía.
La única ventaja que ofrece esto es que, como el bloque ya se encuentra reservado, la lectura y escritura de datos será mucho más rápida. Esto se recomienda principalmente cuando se va a montar servidores de Bases de datos de alto rendimiento o sistemas que hacen uso intensivo del disco (mucho I/O).