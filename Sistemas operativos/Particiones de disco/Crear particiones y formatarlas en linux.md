Para crear las particiones en Linux, se utiliza la herramienta `mkfs`

---
## Identificación del disco o partición
Primero identificamos la partición con la que queremos trabajar.
```shell
carpi@In19pc12 ~> lsblk
NAME                   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda                      8:0    0 931,5G  0 disk 
├─sda1                   8:1    0     1G  0 part /boot/efi
├─sda2                   8:2    0     8G  0 part 
├─sda3                   8:3    0     1G  0 part /boot
├─sda4                   8:4    0 667,3G  0 part 
│ ├─rhel_in19pc12-root 253:0    0    70G  0 lvm  /
│ ├─rhel_in19pc12-swap 253:1    0   7,8G  0 lvm  [SWAP]
│ └─rhel_in19pc12-home 253:2    0 589,5G  0 lvm  /home
└─sda6                   8:6    0 254,2G  0 part ###este
```
En mi caso, es `sda6`.

#### Formato
En este caso, estamos trabajando con RHEL, así que el formato de partición suele ser `XFS`. Si no es el caso, se ha de buscar el tipo de partición que haga falta. Para un [[Índice - GNULinux|GNU/Linux]] común, normalmente suele ser `ext4`.

```shell
sudo mkfs.xfs -L ISOS /dev/sda6
```
Le ponemos una etiqueta a la partición para una fácil identificación, así como darle formato `XFS` a la partición.

#### Montado permanente
Si queremos que el sistema monte automáticamente la partición cada que entremos al sistema, hemos de modificar el `/etc/fstab`.

Primero, buscamos el `UUID` de la partición con:
```shell
carpi@In19pc12 ~> sudo blkid /dev/sda6
/dev/sda6: LABEL="ISOS" UUID="fdf6a957-b0f5-439a-92d0-a7e9e8dc6ef8"
```
Copiamos ese UUID, ya que con eso, fstab podrá identificar el disco en cualquier máquina que lo conectemos.
Editamos el fstab y lo ponemos en este formato (APLICA PARA `RHEL`):
```fstab
UUID=fdf6a957-b0f5-439a-92d0-a7e9e8dc6ef8 /ISOS                   xfs     defaults        0 0
```
