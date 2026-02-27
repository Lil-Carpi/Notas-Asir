M8: Aplicacions Web
Sebastian Ariel Duarte Oruez
Grupo: G4
Año: 24/25


```table-of-contents
```


## 0-. **RESPON**: Quins són els requisits a nivell de programari i de maquinari per a poder instal·lar Moodle?

Els requisits bàsics de programari són:

- Un servidor web funcional (Apache, Nginx, OpenLiteSpeed)...
- Una base de dades (MySQL, MariaDB)... 
- Tenir PHP configurat

Els requisits bàsics de maquinari són: 

- **MEMÒRIA**: 200 MB pel codi font més el que necessitis. 5 GB és una mida realista.
- **PROCESSADOR**: 1 GHz (mínim), 2 GHz dual nucli o més recomanat.
- **RAM**: 512 MB (mínim), 1 GB és recomanat. 8 GB ja seria com un servidor de producció gran.
- Separació entre servidors back-end i front-end (OPCIONAL).


---
## 1-. Segueix les instruccions per a instal·lar Moodle en una màquina virtual o en el teu disc:
***Màquina: el meu disc***

---
## 2-. Documenta el procediment.
Descarreguem el servidor web:
```shell
sudo apt install apache2
```
![[install-apache2.png]]

```shell
sudo apt install apache2 ghostscript libapache2-mod-php mysql-server php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip curl -y
```
![[install-php.png]]

mysql
![[mysql-config.png]]

![[moodle-download1.png]]

![[moodle-download2.png]]
![[moodle-unzip.png]]
![[mv--moodle-var.png]]

![[ls-lmoodledata.png]]


Primer, fem un directori pel Moodle. Jo ho faré a `/etc`:

```shell
sudo mkdir /etc/moodle ; cd moodle
```
![[clone-moodle.png]]

Creem el directori `/var/www/moodle` i `/var/moodledata` i movem la carpeta `moodle` a `/var/moodledata`:

```shell
sudo mkdir /var/moodledata ; sudo mkdir /var/www/moodle ; sudo mv moodle /var/moodledata
```

Instal·lem MySQL:
``` shell
sudo apt install mysql-server
```
![[install_mysql-server.png]]
```shell
#permissos
cd /var/www/html
sudo git clone https://github.com/moodle/moodle.git
sudo chmod -R 755 moodle
sudo chown -R www-data:www-data moodle
sudo mkdir /var/moodledata
sudo chown -R root:www-data /var/moodledata
sudo chmod -R 770 /var/moodledata
```


![[apache-config.png]]
![[moodle-install-php.png]]
![[direction-var-www-moodledata.png]]
![[choose-database.png]]
![[database-config-moodle.png]]
![[copyright-accept.png]]



## 3-. Has trobat inconvenients? Quins? Com els has solucionat?

### Error en iniciar MySQL
Cada que intentava entrar a MySQL, tenia el següent error (conclusió: màquina virtual):

```shell
sudo mysql -u root
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (13)
```
![[mysql-error.png]]
*Aquesta és una representació visual. Quan vaig intentar entrar, ho vaig fer amb sudo*.

Vaig solucionar-ho posant en marxa MySQL en mode segur:

Primer, detenim `mysql`:
```shell
sudo /etc/init.d/mysql stop
```
Ara, iniciem `mysql` en mode segur:
```shell
sudo mysqld_safe --skip-grant-tables &
```
Ara podem iniciar mysql amb normalitat
```shell
sudo mysql -u root
```
![[mysql-u-root.png]]

En intentar crear l'usuari pel Moodle, tenia un error que deia que no podia crear l'usuari per sintaxi. L'error era més perquè estava a mode segur...

```sql
`ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'IDENTIFIED BY 'password1'' at line 1`
```

Així que, directament esborraré MySQL completament i tornaré a començar:

```shell
sudo apt remove --purge mysql-server
sudo apt purge mysql-server
sudo apt autoremove
sudo apt autoclean
sudo apt remove dbconfig-mysql
sudo apt dist-upgrade
```
*Aixo natejará per complet l'ordinador, a mes de esborrar MySQL*

Torno a instal·lar-lo:
```shell
sudo apt install mysql-server
```

No funciona. Faré servir màquina virtual...

---
![[error--var-www-no-writable.png]]
![[chmodw-var-www.png]]
![[mv-moodledata-www.png]]


---
![[config-completed-moodle.png]]
![[php-configuration-file.png]]

![[mv-and-write-config-php.png]]


# IMPOSSIBLE CONTINUAR. Faig servir UBUNTU 24.10 (una versio recent de ubuntu "ubuntu oracular") el qual no te suport per MySQL 8.4, nomes per MySQL 8.0. 
![[mysql-selection-v8.png]]

---

