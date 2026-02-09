#FedoraServer \ #Fedora - Fedora Server
Proveniente de [[Índice - Fedora Server]]

---
Fedora, al utilizar firewalld, se deben activar los puertos que se van a utilizar. Para abrir un puerto, se debe de indicar si es tipo TCP o UDP y asegurarse de que el cambio se hace permanente para que siga aplicado después de un reinicio.

---
### Sintaxis básica:
>[!warning]
>En este caso, se aplica el *`--permanent`* para que el puerto siga abierto despues de un reinicio. En caso de que no se necesite persistencia, simplemente se quita esta opcion.

Modo permisivo:
```shell
sudo firewall-cmd --set-default-zone=trusted
```
Modo restrictivo:
```shell
sudo firewall-cmd --set-default-zone=drop
```

Activar modo pánico (corta todo)
```shell
sudo firewall-cmd --panic-on
```
Desactivar modo pánico:
```shell
sudo firewall-cmd --panic-off
```
Verificar estado del modo pánico:
```shell
sudo firewall-cmd --query-panic
```


Añadir puertos
```shell
sudo firewall-cmd --add-port=XXXX/tcp(o udp) --permanent
```
Verificar puertos abiertos:
```shell
sudo firewall-cmd --list-all
```
>[!nota]
>Podemos utilizar *`--add-service=http`* para abrir los puertos por defecto de estos servicios.

Borrar puertos:
```shell
sudo firewall-cmd --remove-port=XXXX/tcp(o udp) --permanent
```
Recargar servicio para aplicar cambios:
```shell
sudo firewall-cmd --reload
```


---
#### Ejemplo de uso
Imaginemos que tenemos un puerto TCP que queremos abrir, en este caso el puerto `8080` para una app web que estamos probando:
```shell
sudo firewall-cmd --add-port=8080/tcp --permanent
```
Luego, recargamos para aplicar cambios:
```shell
sudo firewall-cmd --reload
```
Una vez hemos terminado de utilizar el puerto, lo quitamos con:
```shell
sudo firewall-cmd --remove-port=8080/tcp --permanent
```
y reiniciamos para aplicar cambios:
```shell
sudo firewall-cmd --reload
```