#Manuales
**Creador: Sebastian Ariel Duarte Oruez
M4: Sistemes Operatius en Xarxa
Grup: G4
Any: 24/25**

![[banana.gif|400]]

**FET EN MARKDOWN - OBSIDIAN**

---
**_💡 NOTA: Aquest document es troba a la meva [carpeta compartida de drive](https://drive.google.com/drive/folders/1M5qyT5SJvh1-kIyB4v6okQtKAwJb1ifH?usp=sharing) i es troba en la direcció:_**
``` shell
  /"THOSI_vainas"/M4/Integracio-LINUXxSAMBA/"Integració de clients heterogenis en un servei de directori"
```

**_També teniu accés a les imatges en:_**

``` shell
/"THOSI_vainas"/M4/Integracio-LINUXxSAMBA/IMGs
```
<div style=page-break-after: always;></div>

---

# Índex
```table-of-contents
```
<div style=page-break-after: always;></div>

---

# Unió d'un client Linux al servei d'Active Directory d'Ubuntu Server

## Configuració de la xarxa

Abans de poder connectar a domini el nostre client, haurem de configurar la seva xarxa. Com estem amb entorn gràfic (`Ubuntu 24.04.2 LTS`), podem configurar-ho sense tocar la terminal.

``` shell
"Adalt a la dreta > Cablejat > Configuracio de la xarxa cablejada > engranatge > IPv4 > Metode IPv4 Manual > Direccions:
"
IP: 192.168.0.200
MASCARA: 255.255.255.0
DNS: 192.168.0.1
"
Apliquem"
```

![[net-configuration.png]]![[net-configuration2.png]]![[net-configuration3.png]]

Per comprovar que funcionen correctament, cal fer pings per comprovar la connectivitat:
``` shell
"A ser possible, en terminals diferents" > ping -c3 8.8.8.8 ; ping -c3 192.168.0.1 ; ping -c3 google.es
```
![[pings.png]]
Si no n'hi ha cap paquet perdut, podem donar aquesta configuració com finalitzada.
<div style=page-break-after: always;></div>

---
## Connectar a domini

Abans de connectar-se a domini, haurem d'instal·lar algunes dependències:

```shell
sudo apt update; sudo apt install sssd-ad sssd-tools adcli realmd
```
![[install-dependences.png]]
Una vegada instal·lats, haurem de descobrir el nostre domini i si apareix, connectar-nos amb:

```shell
realm discover smb.consultingthos.lan\
realm join consultingthos.lan -U Administrator
```
***haurem de donar les credencials de Administrator***
![[realm-discover+realm-join.png]]

Si no surt cap error, ja estarem a domini. Podem comprovar la concessió amb la comanda `realm list`, a on ens hauria de sortir el mateix que quan fem `realm discover`.

## Edició de fitxers

Haurem d'editar dos fitxers:
- `/etc/sssd/sssd.conf` - Fitxer de configuració del `sssd (System Security Services Daemon)`. El que editarem, té a veure amb el tema de les polítiques. Algunes **GPOs** pot ser que no s'apliquin correctament, així que directament les desactivem.
- `/etc/pam.d/common-session` - Fitxer de configuració del sistema `PAM (Pluggable Autentication Module)`. Serveix per gestionar les sessions d'usuari un cop autenticats. En aquest cas, farem que ens creia automàticament el fitxer home de l'usuari amb qui iniciarem sessió.

Al fitxer `/etc/sssd/sssd.conf` haurem d'afegir el següent a última línia:
``` ini
ad_gpo_ignore_unreadable = true
```
![[sssd-conf-edit.png]]

També editarem el fitxer `/etc/pam.d/common-session` i afegirem el següent:

```ini
session optional pam_mkhomedir.so skel=/etc/skel unmask=077
```
![[common-session-edit.png]]

Una vegada editats, reiniciem el servei `sssd` amb:

```shell
sudo systemctl restart sssd.service
```
![[restart-sssd.png]]
Si has arribat fins aquí...
Enhorabona, has ficat a domini un Ubuntu 24.04 🗿👌

# Inici de sessió amb usuari de domini

Per iniciar sessió, a la pestanya d'inici de sessió, veurem un petit missatge que posa "***no ets a la llista?***"
Si ho pressionem, ens deixarà iniciar sessió amb altra compta. Aquí, posarem el de `Gerard GP. Prat`:

```python
user = gprat@CONSULTINGTHOS.LAN
passwd = -"CONFIDENCIAL"-
```
![[gprat-login.png]]
Quan fem això, es crearà automàticament el seu directori home.

Si a la terminal en fem un:

```shell
whoami ; pwd
```

Ens sortirà que som Gerard i que estem al `/home/gprat@consultingthos.lan`.
![[gprat-pwd-whoami.png]]

# Connexió a carpeta compartida

Per connectar una carpeta compartida prèviament configurada al Samba-AD-DC, ens n'anirem al `nautilus`, el gestor de fitxers per defecte de `GNOME`. 

``` shell
"(Abaix a la esquerra)-Altres ubicacions > (rectangle inferior) > smb://smb4duarte.consultingthos.lan/Compartit > Connecta com Usuari registrat >"
Nom d'usuari: gprat
Domini: consultingthos.lan
contrasenya: -CONFIDENCIAL-
```
![[connecting-Compartit.png]]
I si ho hem fet bé, ens hauria de deixar veure el contingut de la carpeta compartida. En el meu cas, havia creat prèviament un fitxer `README.txt` amb el contingut `carpeta-compartida`:
![[path-carpeta-compartida+test.png]]

I això es veu al contingut:

![[connection-successuf.png]]