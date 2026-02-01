Dependiendo del tamaño del disco duro que contenga el sistema operativo, tenemos que tener un disco externo con la suficiente capacidad como para almacenarlo. En este caso, tengo un Windows 10 en un nvme de 500 GB, así que con tener la misma cantidad de espacio es suficiente.

Aunque diga yo que es suficiente tener la misma cantidad de espacio en un disco externo, el sistema no va a almacenar TODO el sistema operativo en el disco externo. Lo que va a hacer va a ser separar en trocitos la información del disco, la comprime y luego lo pasa al disco externo.

Bueno, mucho texto. Al lío.

---
## Preparación
Antes de comenzar, tenemos que verificar que tenemos un disco con el espacio suficiente para hacer esta tarea:
```shell
carpi@carpi:/mnt$ lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINT,LABEL
NAME          SIZE TYPE FSTYPE MOUNTPOINT  LABEL
sda         931,5G disk                    
└─sda1      931,5G part ntfs               Nuevo vol
sdb         931,5G disk                    
├─sdb1         95M part vfat   /boot/efi   EFI
├─sdb2        1,9G part ext4   /boot       BOOT
├─sdb3       93,1G part ext4   /           ROOT
├─sdb4      146,7G part ext4   /home       Trabajos
├─sdb5      255,2G part ext4   /maquinitas Maquinitas
└─sdb6      434,5G part ext4               Cópias
zram0           8G disk swap   [SWAP]      zram0
nvme0n1     476,9G disk                    
├─nvme0n1p1   100M part vfat               
├─nvme0n1p2    16M part                    
├─nvme0n1p3 476,3G part ntfs               
└─nvme0n1p4   559M part ntfs  
```

En este caso, tenemos la partición sdb6, que nos servirá para almacenar la copia del OS, ya que tiene el espacio suficiente (434,5 GB).

También podemos ver el disco de Windows, que es la /nvme0n1, esta es la que tenemos que copiar y meter en /dev/sdb6.

Como no está montado (sdb6), creamos la carpeta para montarlo y luego montamos la partición:
```shell
mkdir /mnt/copias ; sudo mount /dev/sdb6 /mnt/copias
```

Una vez montado, verificamos que este montado correctamente:
```shell
carpi@carpi:/mnt$ df -h /mnt/copias/
S. fitxers      Mida En ús Lliure  %Ús Muntat a
/dev/sdb6       427G  0G   427G   0% /mnt/copias
```
Aquí podemos ver que ha sido montado con éxito, ya que vemos la partición /dev/sdb6 en /mnt/copias.


---
## Copiado
Una vez tengamos todo preparado, procederemos a la copia del sistema operativo.
Utilizaremos `dd` para hacer la lectura y compresión de los datos del nvme al disco de copias:
```shell
sudo sh -c 'dd if=/dev/nvme0n1 bs=64K status=progress | zstd -15 -T0 > /mnt/copias/windows_nvme.img.zst'
```
- `bs=64k`: Este será el tamaño en el que va a partir cada celda que lea del disco duro
- `status=progress`: Verbose. Muestra el estado en el que se encuentra la copia y cuanto lleva.
- `zstd -15 -T0`: ZStandard, software de compresión de alta velocidad hecho por Facebook. -15: Indica el nivel de agresividad de compresión, básicamente le dedica más tiempo a verificar que los trozos de datos sean correctos. -T0: Detecta todos los hilos del procesador y úsalos todos.

El proceso tarda un huevo, así que ten paciencia. En mi caso fue:
```shell
carpi@carpi:/mnt$ sudo sh -c 'dd if=/dev/nvme0n1 bs=64K status=progress | zstd -15 -T0 > /mnt/copias/windows_nvme.img.zst'
512080084992 bytes (512 GB, 477 GiB) copied, 6793 s, 75,4 MB/s
7814181+1 records in
7814181+1 records out
512110190592 bytes (512 GB, 477 GiB) copied, 6793,77 s, 75,4 MB/s
```

$$
6793 / 3600 = 1,887 h -||-
0,887 × 60 = 53 min -||-
0,2 × 60 ≈ 12 s
$$
$$1h,53min,12s$$
---
## Comprobación
Después de que haya terminado la compresión, es recomendable hacer la comprobación de los datos y de que estos están correctamente. Podemos utilizar el propio zstd para esto:
```
zstd -t -T0 /mnt/copias/windows_nvme.img.zst
```
Él `-t` es de "test" y el `-T0` es Thread 0 (verifica los hilos disponibles y úsalos todos).

---
## Reescritura de los datos al disco
Cuando se quiera volver a implantar la imagen al disco o a otro disco, se ha de hacer:
```shell
sudo sh -c 'zstd -dc /mnt/copias/windows_nvme.img.zst | dd of=/dev/nvme0n1 bs=1M status=progress'
```
`-d`: Descomprimir
`-c`: Mandar a salida estándar (`stdout`) para que el pipe lo recoja (en este caso, lo pilla el `dd`).

En caso de que se implante en un disco de mayor tamaño que el disco anterior (por ejemplo, uno de `1 TB`), este no reconocerá el nuevo espacio (solo reconocerá los `500 GB`) y lo tendrá como espacio no asignado y tendrás que asignarle el espacio o particiones correspondientes si hace falta en el Administrador de Discos de Windows.