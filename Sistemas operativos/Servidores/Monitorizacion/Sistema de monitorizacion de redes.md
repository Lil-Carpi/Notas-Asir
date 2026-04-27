> [!note]
>  Asegúrate de ejecutar estos comandos como `root` (usando `sudo`) o de que tu usuario actual pertenezca al grupo `libvirt`.

---

### 1. Gestión de Redes y Subredes

En `libvirt`, las redes se definen mediante archivos XML. Por defecto existe la red `default` (NAT), pero vamos a crear una nueva red interna con su propia subred y servidor DHCP.

**Paso A: Crear el archivo XML de la red**

Crea un archivo llamado `mi_red.xml` con tu editor favorito y añade lo siguiente:


```XML
<network>
  <name>red_privada</name>
  <bridge name='virbr1' stp='on' delay='0'/>
  <ip address='192.168.100.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.100.50' end='192.168.100.200'/>
    </dhcp>
  </ip>
</network>
```

**Paso B: Definir, iniciar y habilitar la red**

Una vez creado el archivo, inyectamos la configuración en `libvirt`:

```Bash
# Definir la red a partir del archivo XML
virsh net-define mi_red.xml

# Iniciar la red
virsh net-start red_privada

# Hacer que la red se inicie automáticamente al encender el servidor host
virsh net-autostart red_privada

# Listar las redes para verificar que está activa
virsh net-list --all
```

---

### 2. Crear una Máquina Virtual (VM)

Para crear la VM usaremos `virt-install`. Este comando crea el disco, asigna los recursos, conecta la red y lanza el instalador.

Ejemplo para crear una VM con 2GB de RAM, 2 CPUs y 20GB de disco:



```Bash
virt-install \
  --name mi_debian \
  --memory 2048 \
  --vcpus 2 \
  --disk path=/var/lib/libvirt/images/mi_debian.qcow2,size=20,format=qcow2 \
  --os-variant debian11 \
  --network network=red_privada \
  --graphics spice \
  --cdrom /ruta/absoluta/a/tu/imagen.iso
```

**Explicación de parámetros:**

- `--os-variant`: Optimiza la VM para ese sistema. Puedes ver la lista completa soportada usando el comando `osinfo-query os`.
    
- `--graphics spice`: Permite ver la pantalla de la VM de forma gráfica usando `virt-viewer`. Si vas a instalar un servidor puramente por consola de texto, podrías usar `--graphics none` y `--extra-args="console=ttyS0"`.
    

---

### 3. Listar, Encender y Apagar VMs

**Listar las máquinas virtuales:**



```Bash
# Ver solo las VMs encendidas
virsh list

# Ver TODAS las VMs (encendidas y apagadas)
virsh list --all
```

**Encender una VM:**



```Bash
virsh start mi_debian

# Si quieres que la VM arranque sola cuando el host físico se reinicie:
virsh autostart mi_debian
```

**Apagar una VM:**

Aquí hay una distinción crítica que debes conocer:



```Bash
# Apagado elegante (envía una señal ACPI al SO invitado para que se apague bien)
virsh shutdown mi_debian

# Apagado forzoso (Equivale a "desconectar el cable de la corriente". Úsalo solo si la VM se cuelga)
virsh destroy mi_debian

# Reiniciar la VM
virsh reboot mi_debian
```

---

### 4. Acceder a la Máquina Virtual

Si creaste la VM con gráficos (Spice o VNC), puedes ver su pantalla para realizar la instalación del sistema operativo:

>[!note]
>En RHEL, Spice esta obsoleto desde RHEL 9 en adelante.

```Bash

virt-viewer mi_debian
```

>[!attention]
>_(Si estás trabajando en un servidor remoto por SSH sin entorno gráfico local, tendrás que configurar el reenvío X11 (`ssh -X`) o conectar tu virt-viewer local a la URI remota: `virt-viewer -c qemu+ssh://usuario@tu_servidor/system mi_debian`)._

---

### 5. Borrar una Máquina Virtual

Para eliminar una VM por completo, debes detenerla, borrar su configuración (undefine) y opcionalmente borrar sus discos virtuales asociados.



```Bash
# 1. Asegúrate de que esté apagada
virsh destroy mi_debian

# 2. Borrar la VM y destruir sus archivos de disco duro virtual asociados
virsh undefine mi_debian --remove-all-storage
```

>[!caution]
>_Precaución: `--remove-all-storage` elimina el archivo `.qcow2` de forma permanente. Si solo quieres borrar la configuración de la VM pero guardar los datos del disco, usa solo `virsh undefine mi_debian`._