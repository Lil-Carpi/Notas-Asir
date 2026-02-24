![[fstab-config.png]]

El fichero esta en `/etc/fstab`.
La sintaxis:
```ini
//{ip-servidor}/{directorio} /{lugar de}/{montaje} cifs username={usuario},password={contraseña},vers=3.1.1,_netdev,x-systemd.automount 0 0
```
