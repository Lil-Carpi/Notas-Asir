#FedoraServer \ #Fedora - Fedora Server
Proveniente de [[Índice - Fedora Server]]

---

Se utiliza `nmcli` para configurar la red.

Configuración de IP estática: 
```bash
sudo nmcli connection modify <interfaz de red> ipv4.addresses <ipv4>/<cidr>
```

Configuración del `GATEWAY`: 
```shell
sudo nmcli connection modify <interfaz de red> ipv4.gateway <ipv4>
```

Configuración de los DNS:
```shell
sudo nmcli connection modify <interfaz de red> ipv4.dns "<ipv4 separado por espacios>"
```
>[!attention]
>Es recomendable poner 2 direcciones DNS, por ejemplo la de Cloudflare <1.1.1.1> y la de Google <8.8.8.8>, por temas de disponibilidad.

Cambio a método manual para que no busque DHCP:
```shell
sudo nmcli connection modify <interfaz de red> ipv4.methdo manual
```

Activar la red que acabamos de configurar:
```shell
sudo nmcli connection up <interfaz de red>
```

---
Para hacer los test de conexión se puede hacer pings a los propios DNS que configuraste o a un dominio de internet. 