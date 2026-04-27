Por defecto, QEMU le da a las maquinas virtuales una NAT, lo que le da acceso a internet por defecto. Pero en algunos casos, necesitamos de otras redes, (Red Nat, Adaptador Puente, etc) para realizar distintos escenarios de redes.

QEMU por defecto no tiene la capacidad de generar distintos tipos de red como lo tenemos en otros gestores de maquinas virtuales como [[VirtualBox - Índice|VirtualBox]] por ejemplo.
En estos casos, hemos de generar nosostros mismos estas modificaciones de red con `nmcli`

---
## Adaptador puente
Para hacer un adaptador puente, tenemos que hacer una red de tipo bridge y luego configurar a la maquina virtual para que utilice este adaptador.

```shell
sudo nmcli connection add type bridge ifname br0 con-name br0
```
Esto crea la conexion de tipo puente con nombre `br0`. Podemos cambiarle el nombre si hace falta.

```shell
sudo nmcli connection add type ethernet ifname enp43s0 master br0 con-name bridge-enp43s0
```
Esto crea la conexion esclava con la interfaz enp43s0 y le asigna a br0 como master. Esta conexion ahora se llama `bridge-enp43s0`.

```shell
sudo nmcli connection modify br0 bridge.stp no
```
Véase [[STP - Protocolos de red|STP]] para más info.
Esto quita el protocolo STP a al switch virtual de la conexión bridge de br0, dándole una conexión instantánea a la red.

---
## Red Nat
