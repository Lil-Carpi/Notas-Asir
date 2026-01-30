Antes de la instalación de cualquier software, se ha de sanear algunas cosas:

### Usuario ROOT desactivado
El usuario Root debe venir desactivado por defecto. Esto se hace en la propia instalación dentro de la anaconda.

#### Usuario administrador en el grupo `wheel`
El usuario administrador debe estar en el grupo `wheel` para ejecutar lo necesario sin recurrir a Root.

#### Firewalld activo
Firewalld debe estar activo siempre. Se comprueba con:
```shell
sudo systemctl status firewalld
```

#### Filtros de firewalld
Añadir una política restrictiva a cualquier petición (ejecutar líneas una por una):
```shell
sudo firewall-cmd --set-default-zone=drop 
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd reload
```

En caso de añadir algún servicio
```shell
sudo firewall-cmd --add-port=XXXX/tcp --permanent
```

#### Desactivar login de Root por SSH y usar claves públicas para SSH
Se ha de desactivar la línea de login de root en `/etc/ssh/sshd_config`:
```ini
PermitRootLogin no
PasswordAutentication no
PubkeyAuthentication yes
ChallengeResponseAuthentication no
UsePAM yes
AllowUsers usuario
MaxAuthTries 3
LoginGraceTime 20
```

En el cliente:
```shell
ssh-copy-id usuario@ip
```

#### SELinux
Mantener siempre activo y en ENFORCING (verificar con `getenforce`). Tener siempre los puertos correctos abiertos y en los contextos correctos.
Ejemplo de exposición de alguna web:
```shell
sudo semanage port -a -t http_port_t -p tcp 8080
```

#### sysctl.d
Crear el fichero `/etc/sysctl.d/99-hardening.conf`:
Añadir
```ini
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.tcp_syncookies = 1
net.ipv4.icmp_echo_ignore_broadcast = 1
```

Aplicar cambios con:
```shell
sudo sysctl --system
```