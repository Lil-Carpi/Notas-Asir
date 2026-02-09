#FedoraServer \ #Fedora - Fedora Server
Proveniente de [[Índice - Fedora Server]]

---
Los puertos SELinux solo se tocan cuando se va a usar un puerto no estándar para un servicio (por ejemplo, el puerto apache en 8088 en vez del puerto 80). En caso de usar los puertos por defecto, SELinux ya los tendrá permitidos.

Para la configuración de los puertos se utiliza *`semanage`*.

---
### Sintaxis
Modo permisivo:
```shell
sudo setenforce 0
```
Modo restrictivo:
```shell
sudo setenforce 1
```
Verificar el estado de SELinux:
```shell
getenforce
```
>[!Output]
>Enforcing

#### Cambio permanente
Se edita el fichero `/etc/selinux/config` y en la línea de `SELINUX` se añade:
```shell
SELINUX=enforcing # Para modo restrictivo permanente 
```
```Shell
SELINUX=permissive # Para modo permisivo permanente
```
En caso de que se quiera detener SELinux (lo cual no es recomendable bajo ningún concepto) se ha de poner:
```shell
SELINUX=disabled
```


Para utilizar SELinux, se ha de saber primero la etiqueta del servicio:
```shell
sudo semanage port -l | grep http
```
*`grep http`* Es solo un ejemplo. Busque los puertos que necesite.

Se verá algo como esto:
```shell
carpi@carpi:~$ sudo semanage port -l | grep http
http_cache_port_t              tcp      8080, 8118, 8123, 10001-10010
http_cache_port_t              udp      3130
http_port_t                    tcp      80, 81, 443, 488, 8008, 8009, 8443, 9000
http_port_t                    udp      80, 443
pegasus_http_port_t            tcp      5988
pegasus_https_port_t           tcp      5989
```

En caso de que no se encuentre el puerto que necesitamos habilitar en la etiqueta, podemos añadir la etiqueta de dicho puerto de la siguiente manera:
```shell
sudo semanage port -a -t http_port_t -p tcp 8088
```

Para borrar puertos de la etiqueta, se hace de la siguiente manera:
```SHELL
sudo semanage -d -t http_port_t -p tcp 8088
```