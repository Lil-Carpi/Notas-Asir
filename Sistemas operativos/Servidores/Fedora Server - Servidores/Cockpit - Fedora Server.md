#FedoraServer \ #Fedora - Fedora Server
Proveniente de [[Índice - Fedora Server]]

---
Cockpit es una terminal web de Fedora, que sirve para utilizar la terminal del servidor mediante un navegador. Se pueden tener varios usuarios a la vez, permite la verificación de software instalado, visor de logs y de servicios, así como de las actualizaciones pendientes e instaladas, da información sobre la red y también el espacio de disco utilizado. Normalmente, en [[Fedora Server]] se encuentra abierto por defecto en `http://localhost:9090`.

En la distribución de [[Fedora|Fedora]], está desactivado por defecto.
![[cockpit-overview.png]]
*Overview de Cockpit del Fedora Workstation Edition*

Cockpit es compatible con las siguientes distros:
- [[Fedora Server]]
- [[Fedora]]
- [[Fedora CoreOS]]
- [[CentOS]]
- [[Debian]]
- [[Arch Linux]]
- [[Ubuntu]]
- [[Tumbleweed]] (No testeado)
- [[SUSE Linux Enterprise Micro]] (No testeado)

Para más info, ver la [documentación oficial de Cockpit](https://cockpit-project.org/running)

---
## Descargado y activación de Cockpit
Para instalarlo:
```shell
sudo dnf install cockpit
```
Activación del servicio:
```shell
sudo systemctl enable --now cockpit.socket
```
Configuración del firewall:
```shell
sudo firewall-cmd --add-service=cockpit --permanent
```