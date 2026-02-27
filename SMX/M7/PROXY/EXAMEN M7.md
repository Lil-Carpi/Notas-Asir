[[M7_Manual_Proxy_Obsidian]]
Lo que entra:
``` plain text
- DNS Transversal
- IPTABLES
- idiomas de mensaje de error
- RAM en concreto
- cantidad de memoria destinada
- Sistema de archivos concreto
- medida de disco en concreto
- Directorios y subdirectorios en concreto
- ACLs - Creacion de acls generales
- Usuarios - Configuración de credenciales
- Denegar o permitir accesos a URL (lista de urls o url)
- bloquear por ip o por red (puede ser por lista)
```


>	_NOTA DE CONFIGURACIÓN DE AUTENTICACIÓN_
>	Si se intenta acceder con los usuarios que SI se encuentren en una lista, se les deja pasar. Si NO están dentro, no se les dejará pasar. Si ponemos allow, será al revés. 


``` shell
sudo apt install a2utils

# Primer usuario a crear
sudo htpasswd -cm "/ruta/del/fichero" usuario

# Segundo usuario a crear
sudo htpasswd -m "/ruta/del/fichero" usuario2
```


``` ini
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/users
acl users 
http_access deny !users
```

![[Pasted image 20250422154327.png]]![[Pasted image 20250422154337.png]]