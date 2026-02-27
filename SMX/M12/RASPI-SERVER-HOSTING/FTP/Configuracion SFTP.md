```table-of-contents
```
---
# Plantejament
## Estructura de fitxers:
![[Pasted image 20250520192530.png]]
## Requisits
- Seguritzacio SSL/TLS
- Usuaris que representin un departament (Engabiat al seu home, amb accés a una carpeta compartida i accés al directori anònim)
- Accés anònim (engabiat)
- Possibilitat de connectar-se amb domini.
---
# Instal·lacio de ProFTPD

Instal·lem el paquet de `ProFTPD`:
```
sudo apt install proftpd
```

---
# Creació del certificat SSL/TLS
Creem el directori de les keys i creem les keys per SSL/TLS:
```shell
sudo mkdir /etc/proftpd/certs ; sudo openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/proftpd/certs/sftp.key -out /etc/proftpd/sftp.crt -days 365 
```
![[Pasted image 20250520172656.png]]
Aixo ens creara la clau i certificat SSL/TLS que podrem fer servir per encriptar la transmissio i recepcio de fitxers.

Per seguretat, farem que nomes root tingui permissos de lectura i escriptura sobre la key i certificats:
```shell
sudo chmod 600 sftp.*
```
![[Pasted image 20250520172557.png]]

---
# Creació de directoris, usuaris i grups

Primer creem el grup `sftpusers`:
![[Pasted image 20250520183741.png]]

Primer, creem els directoris a `/srv/` (ignoreu el chown) :
![[Pasted image 20250520173631.png]]

Crearem els usuaris plantejats, els assignem el grup `ftpusers` i els donarem el seu home dins del directori `/srv/sftp`:
![[Pasted image 20250520174225.png]]

Canviarem l'usuari i grup propietari de `/srv/sftp` a root perquè ningú pugui sortir del seu lloc:
```shell
sudo chown root:root /srv/sftp
```
*Canvia el propietari i el grup a root
Perquè ningú surti de l'engabiament. Al directori arrel no pot escriure ningú excepte Root
Si això no es compleix, sshd bloqueja la connexió per seguretat.*

``` shell
sudo chmod 755 /srv/sftp
```
*Permet als usuaris entrar al directori, però no escriure en ell
És necessari perquè funcioni l'accés als subdirectoris dins de l'arrel*.

``` shell
sudo mkdir -p /srv/sftp/rteam/uploads
```
*Es crea el directori de treballs a on els usuaris puguin pujar els seus arxius.*

``` shell
sudo chown rteam:sftpusers /srv/rteam/uploads
```
*Associa la propietat a l'usuari rteam i al grup sftpusers, perquè els membres de sftpusers puguin accedir també*


``` shell
sudo chmod 755 /srv/sftp/public
```
*Permet entrar a tothom a llegir el contingut, però no escriure. Això permet que els usuaris anònims puguin llegir el contingut.*

```shell
sudo mkdir /srv/sftp/public/uploads
sudo chown :sftpusers /srv/sftp/public/uploads
sudo chmod 775 /srv/sftp/public/uploads
```
*Permet que el grup sftpusers puguin ingressar a un directori públic de pujada d'arxius, però no permet que els usuaris anònims puguin crear arxius, només llegir.*

![[Pasted image 20250520175213.png]]
![[Pasted image 20250520191657.png]]
Ara, editem el fitxer `/etc/proftpd/proftpd.conf`:
- Esborrem la última línia i posem el següent:
```ini
Include /etc/proftpd/sftp.conf
```
![[Pasted image 20250520185925.png]]

Creem el fitxer `/etc/proftpd/sftp.conf` i posem el següent:
![[Pasted image 20250520175355.png]]
```ini
<IfModule mod_sftp.c>
  SFTPEngine on
  Port 2222
  SFTPLog /var/log/proftpd/sftp.log

  SFTPHostKey /etc/proftpd/certs/sftp.key
  SFTPAuthMethods password

  # Chroot (enjaular)
  DefaultRoot ~

  # Usuarios anonimos (solo lectura)
  <Anonymous /srv/sftp/public>
    User ftp
    Group nogroup
    UserAlias anonymous ftp
    MaxClients 10
    <Directory *>
      <Limit WRITE>
        DenyAll
      </Limit>
    </Directory>
  </Anonymous>

  # Usuarios normales
  <Limit LOGIN>
    AllowUser rteam bteam forensic
    DenyAll
  </Limit>

</IfModule>

```

Reiniciem el servei i activem:
```shell
sudo systemctl restart proftpd
```


---
# Redirecció de ports i configuració de tallafoc 
![[Pasted image 20250520212543.png]]
![[Pasted image 20250520182107.png]]
![[Pasted image 20250520182505.png]]