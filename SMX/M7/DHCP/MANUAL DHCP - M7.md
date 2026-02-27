**Creador: Sebastian Ariel Duarte Oruez
M7: Serveis de Xarxa
Grupo: G4
Año: 24/25**
![[banana.gif]]

**FET EN MARKDOWN - OBSIDIAN**
<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>
[[MANUAL DHCP]]
# Índex
```table-of-contents
```
<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

---
# 1 Què és i com funciona el servei DHCP
## 1.1 Què és el DHCP i perquè serveix
Un servidor *DHCP (Dynamic  Configuration Protocol)* es el servidor que s'encarrega de donar les direccions IPs als host que ho solicitin. Normalment sol ser-ne automatic, pero tambe es pot configurar per donar IPs a hosts especifics.

## 1.2 Explica com funciona
![[DHCP - ESQUEMA PER MAC.png]]

![[ESQUEMA-APIPA.png]]
## 1.3 Quin port fa servir

DHCP fa servir diferents ports pel client i pel servidor:
- 67/UDP (Servidor)
- 68/UDP (Client)

---
# 2 Configuració del Servei DHCP

## 2.1 Esquema de configuració

## 2.2 Instal·lació del servei

- Instal·lació

```shell
sudo apt install isc-dhcp-server
```

- Comprovar l’estat
```shell
sudo systemctl status isc-dhcp-server
```

- Configurar i comprovar la interfície de xarxa

Per configurar la interfície:
```shell
sudo nvim /etc/default/isc-dhcp-server 
```
```ini
INTERFACESv4="<interficie>"
```
## 2.3 Exemple de configuració

```
authoritative;

default-lease-time 600;
max-lease-time 7200;

option domain-name "smx.com";
option domain-name-servers dns2.sduarte.cat;
server-name "ns.sduarte.cat"

subnet 10.0.3.0 netmask 255.255.255.0 {
        range 10.0.3.15 10.0.3.20;
        option routers gateway.sduarte.cat;
        option broadcast-address 10.0.3.255; 
}
host client5{
        hardware ethernet 00:16:3e:85:26:19;
        option host-name "client5";
        fixed-address 10.0.3.25;
        option domain-name-servers dns1.sduarte.cat;
}

```

- Descriu que fa cada paràmetre
	- `Autoritative;`:  Indica que aquet será el servidor que mana.
	- `default-lease-time`: Indica la quantitat minima de temps en segons que ha de passar per tornar a demanar una IP.
	- `max-lease-time`: Indica la quantitat maxima de temps en segons que ha de passar per tornar a demanar una IP.
	- `option domain-name`: Defineix un nom de servidor visible pels clients.
	- `option domain-name-servers`: Especifica les adreces IP dels DNS.
	- `server-name`: Dona un nom al servidor DHCP
	- `subnet <IP> netmask <Mask> {...}`: Defineix una subxarxa per donar una configuracio especifica.
		- `range`: Es el rang d'ips que es donará a les maquines que demanin IP a la subxarxa
		- `option routers`: Defineix la GATEWAY predeterminada per la subxarxa.
		- `option broadcast-address`: Defineix la direccio BROADCAST.
	- `host <client>{...}`: Defineix un host amb IP estatica.
		- `hardawe ethernet`: Especifica la adreça **MAC** del host a la que es vol aplicar la IP estatica
		- `Option host-name`: Serveix per donar un nom especific al host (Nomes a Windows).
		- `fixed-address`: Especifica la adreça IP del host.
		- `option domain-name-servers`: Especifica el DNS.

- Diferencia la configuració global i la de Xarxa
```shell
ip a
...
2: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether d8:5e:d3:06:9a:6e brd ff:ff:ff:ff:ff:ff
    altname enp0s31f6
    inet 192.168.105.6/16 brd 192.168.255.255 scope global eno1
       valid_lft forever preferred_lft forever
    inet6 fe80::da5e:d3ff:fe06:9a6e/64 scope link 
       valid_lft forever preferred_lft forever
3: wlp1s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 9a:10:44:97:ae:64 brd ff:ff:ff:ff:ff:ff permaddr 28:d0:ea:57:68:4f
4: lxcbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 00:16:3e:00:00:00 brd ff:ff:ff:ff:ff:ff
    inet 10.0.3.1/24 brd 10.0.3.255 scope global lxcbr0
       valid_lft forever preferred_lft forever
```

En el escenari plantejat, `eno1` es la interficie que dona a internet, mentres que l'interficie `lxcbr0` es la interficie de la xarxa interna.

- Comprova que ha lliurat la configuració
Configuració dinàmica:
![[client3-16.png]]
Configuracio estatica
![[client5-15.png]]
## 2.4 Assignació d’IPs dinàmiques

- Exemple d’un rang,
```ini
subnet 10.0.3.0 netmask 255.255.255.0 {
        range 10.0.3.15 10.0.3.20;
        option routers 10.0.3.1;
        option broadcast-address 10.0.3.255; 
}
```
- Número de IPs que es lliuren
Es lliuren 5 IPs. 
- Exemple de més d’un rang
``` ini
subnet 10.0.3.0 netmask 255.255.255.0 {
        range 10.0.3.15 10.0.3.20;
        range 10.0.3.50 10.0.3.55;
		option routers 10.0.3.1;
        option broadcast-address 10.0.3.255; 
}
```
- Explica el funcionament
Ara, es lliuraran per la subxarxa `10.0.3.0` les següents adreces IP: 
- `10.0.3.15` a `10.0.3.20`
- `10.0.3.50` a `10.0.3.55`
	--
- Comprova que ha lliurat la configuració
![[client3-16.png]]

## 2.5 Assignació d’IPs estàtiques o reserva d’IPs

- Exemple
```ini
host client5{
	hardware ethernet 00:16:3e:85:26:19;
	option host-name client5;
	fixed-address 10.0.3.25;
	option domain-name-servers smx-conf;
}
```
- Descriu que fa cada paràmetre
	- `host <client>{...}`: Defineix un host amb IP estatica.
		- `hardawe ethernet`: Especifica la adreça **MAC** del host a la que es vol aplicar la IP estatica
		- `Option host-name`: Serveix per donar un nom especific al host (Nomes a Windows).
		- `fixed-address`: Especifica la adreça IP del host.
		- `option domain-name-servers`: Especifica el DNS.
- Comprova que ha lliurat la configuració
![[fixed-address-confirmation.png]]
## 2.6 Exemple global, integrat amb DNS

- Exemple

Configuració DNS:
```python
; BIND reverse data file for empty rfc1918 zone
;
; DO NOT EDIT THIS FILE - it is used for multiple zones.
; Instead, copy it, edit named.conf, and use that copy.
;
$TTL    86400
@       IN      SOA     ns. localhost (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                          86400 )       ; Negative Cache TTL
;
@       IN      NS      ns.
www     IN      A       192.168.105.0
gateway IN      A       10.0.3.1
dns1    IN      A       10.0.3.1
dns2    IN      A       192.168.105.6
dnsthos IN      A       192.168.99.99

```

Configuració zona:
``` python
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";
zone "sduarte.cat"{
	type master;
	file "/etc/bind/db.smx.com";
};
```

Configuracio DHCP
``` ini
authoritative;

default-lease-time 600;
max-lease-time 7200;

option domain-name "smx.com";
option domain-name-servers dns2.sduarte.cat;
server-name "ns.sduarte.cat";

subnet 10.0.3.0 netmask 255.255.255.0 {
        range 10.0.3.15 10.0.3.20;
        option routers gateway.sduarte.cat;
        option broadcast-address 10.0.3.255; 
}
host client5{
        hardware ethernet 00:16:3e:85:26:19;
        option host-name "client5";
        fixed-address 10.0.3.25;
        option domain-name-servers dns1.sduarte.cat;
}
```

- Comprova que ha lliurat la configuració
![[ipfixaresolvectl-status.png]]
## 2.7 Eines de comprovació

Verificar de que funciona el DNS:
AL CLIENT: resolvectl status

Verificar que isc-dhcp-server funcioni:
systemctl status isc-dhcp-server.