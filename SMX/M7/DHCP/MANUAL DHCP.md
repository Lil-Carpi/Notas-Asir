**Creador: Sebastian Ariel Duarte Oruez
M7: Serveis de Xarxa
Grupo: G4
Año: 24/25**



**HECHO EN MARKDOWN - OBSIDIAN**

---

<div style="page-break-after: always;"></div>

---
# ÍNDICE
```table-of-contents
```

# Servei DHCP

## Funcions, tipus d'assignacions d'IP i esquemes de funcionament

El **DHCP** (**_Dynamic Host Configuration Protocol_**) és un servei donat per la configuració de la xarxa, la qual dona adreces IP als amfitrions per la seva comunicació.

> [[ESQUEMA-DHCPxMAC.canvas|ESQUEMA-DHCP]]
![[DHCP - ESQUEMA PER MAC.png]]

Si no es troba un servidor **DHCP**, les màquines utilitzen el protocol **APIPA** (**_Automatic Private Internet Protocol Addressing_**).

> [[ESQUEMA-APIPA.canvas|ESQUEMA-APIPA]]
![[ESQUEMA-APIPA.png]]


## Ports que fa servir el DHCP
## Paquets DHCP

# Configuració del servidor DHCP

Instal·lació:
```shell
sudo apt install isc-dhcp-server
```

Primer de tot, anirem a la direcció dels fitxers de configuració:

```shell
cd /etc/dhcp
```

I canviarem el nom del fitxer de configuració `/etc/dhcp/dhcpd.conf` a `/etc/dhcp/dhcpd.conf.bak` amb:

```shell
sudo mv dhcpd.conf dhcpd.conf.bak
```

Una vegada fet això, podem crear el fitxer `dhcpd.conf` amb el vostre editor preferit (el meu és Neovim):
```shell
sudo nvim dhcpd.conf
```

Posarem el següent:
``` c
authoritative;

default-lease-time 600;
max-lease-time 7200;

option domain-name "smx.com";
option domain-name-servers ns1.smx.com;
server-name "dhcp.smx.com";

subnet 10.0.3.0 netmask 255.255.255.0 {
        range 10.0.3.15 10.0.3.20;
        option routers 10.0.3.1;
        option broadcast-address 10.0.3.255; 
}
```
### Explicació desglossada (CONFIGURACIÓ BÀSICA):
```c
authoritative;
```
Aquesta directiva indica al servidor DHCP que és l'**autoritat** en la seva xarxa per a l'assignació d'adreces IP. Això significa que el servidor respondrà a les peticions DHCP dels clients i assignarà adreces IP sense dubtar.
**Implicacions:**

* Si tens múltiples servidors DHCP a la mateixa xarxa, només un d'ells hauria de ser marcat com a `authoritative` per evitar conflictes en l'assignació d'adreces.
* En la majoria de les configuracions estàndard amb un únic servidor DHCP, aquesta directiva és necessària.


```c
option domain-name "smx.com";
```
Aquesta opció configura el **nom de domini** que s'enviarà als clients DHCP. Quan un client rep una adreça IP d'aquest servidor, també se l'informa que el seu domini de xarxa és `smx.com`.

**Ús:**

* Aquesta informació pot ser utilitzada pels clients per a la resolució de noms dins de la xarxa local. Per exemple, si tens un servidor anomenat `servidor1` dins d'aquest domini, els clients podrien accedir-hi fent servir `servidor1.smx.com`.

```c
option domain-name-servers ns1.smx.com;
```
Aquesta opció especifica les adreces IP dels **servidors de noms de domini (DNS)** que els clients DHCP haurien d'usar per a la resolució de noms d'Internet i dins de la xarxa local. En aquest cas, s'està indicant que el servidor DNS és `ns1.smx.com`.

**Funcionament:**

* Quan un client rep la configuració DHCP, també rep l'adreça d'aquest servidor DNS. El client farà servir aquest servidor per traduir noms de domini (com `www.google.com`) a adreces IP.
* És comú tenir un o més servidors DNS configurats. Si hi hagués múltiples servidors DNS, es podrien llistar separats per comes (per exemple, `option domain-name-servers ns1.smx.com, 8.8.8.8;`).

```c
server-name "dhcp.smx.com";
```
Aquesta opció assigna un **nom al servidor DHCP**. El nom `dhcp.smx.com` pot ser útil per a la identificació del servidor en els logs o en altres comunicacions de xarxa.

**Propòsit:**

* Principalment amb finalitats administratives i de registre. No afecta directament la funcionalitat de l'assignació d'adreces IP als clients.

``` c
subnet 10.0.3.0 netmask 255.255.255.0 { ... }
```
Aquesta secció defineix una **subxarxa** específica per a la qual el servidor DHCP proporcionarà configuració.

* **`subnet 10.0.3.0`**: Aquesta és l'**adreça de xarxa** de la subxarxa. Indica l'inici de l'interval d'adreces IP per a aquesta xarxa.
* **`netmask 255.255.255.0`**: Aquesta és la **màscara de subxarxa**. Determina quina part de l'adreça IP identifica la xarxa i quina part identifica el host dins d'aquesta xarxa. En notació CIDR, aquesta màscara equival a `/24`.

Dins d'aquesta definició de subxarxa, trobem les següents opcions:


```c
range 10.0.3.15 10.0.3.20;
```
Aquesta opció especifica l'**interval d'adreces IP** que el servidor DHCP pot assignar dinàmicament als clients dins d'aquesta subxarxa. En aquest cas, el servidor assignarà adreces IP des de `10.0.3.15` fins a `10.0.3.20`, ambdues incloses.

**Consideracions:**

* Assegura't que aquest interval no inclogui adreces IP que ja estiguin assignades estàticament a altres dispositius importants de la xarxa (com rúters, servidors, etc.).
* L'interval ha de ser dins de la subxarxa definida.

```c
option routers 10.0.3.1;
```
Aquesta opció defineix l'**adreça IP de la passarel·la predeterminada (rúter)** que s'enviarà als clients DHCP. Quan un client necessita comunicar-se amb dispositius que no es troben a la seva mateixa subxarxa, enviarà el tràfic a aquesta adreça IP.

**Funció:**

* Aquesta és la porta d'entrada de la xarxa local cap a altres xarxes (inclosa Internet).

```c
option broadcast-address 10.0.3.255;
```
Aquesta opció especifica l'**adreça de broadcast** per a aquesta subxarxa. L'adreça de broadcast s'utilitza per enviar missatges a tots els dispositius dins de la xarxa `10.0.3.0/24`.

**Ús:**

* Alguns protocols de xarxa fan servir l'adreça de broadcast per a la descoberta de serveis o per a la comunicació amb tots els amfitrions de la xarxa simultàniament.

En resum, aquest fitxer de configuració estableix un servidor DHCP autoritatiu per a la xarxa `10.0.3.0/24`. Els clients que sol·licitin una adreça IP rebran una adreça dins de l'interval `10.0.3.15 - 10.0.3.20`, se'ls informarà que el seu domini és `smx.com`, que el seu servidor DNS és `ns1.smx.com`, que la seva passarel·la predeterminada és `10.0.3.1` i que la seva adreça de broadcast és `10.0.3.255`. El servidor DHCP es coneixerà com a `dhcp.smx.com`.

## Configuracio estatica

Per la configuracio estatica, al fitxer `/etc/dhcp/dhcpd.conf` posarem el seguent:

```c
...
host client3{
	hardware ethernet <Direccio MAC>;
	option host-name <Nom del equip>;
	fixed-address 10.0.3.25;
	option domain-name-servers <DNS>;
}
```


### Explicacio desglossada (CONFIGURACIO ESTATICA)

``` c
host client3{...}
```
Aquesta opcio serveix per començar l'interpretacio de un host amb IP estatica.

**Funció**

Quan estem començant a configurar una IP estatica per un client en especific, s'ha d'assignar un nom especific per la configuracio.

**Ús**

- Per nomes permitir direccions MAC habilitades.

## Instal·lació del programari DHCP
Haurem d'instal·lar el programari `isc-dhcp-server` amb:

```shell
sudo apt install isc-dhcp-server
```

## Fitxer de configuració i directives més importants

Els fitxers de configuració més importants per la configuració del DHCP són les següents:

- `/etc/dhcp`: Aquí es troba la configuració general del servidor
- `/etc/default/isc-dhcp-server`: Aquí es troba la configuració per la interfície de xarxa que s'utilitzarà. 

Les directives de configuració més rellevants per la configuració del DHCP són:

- **`subnet <xarxa> netmask <mask> { ... }`**: Aquesta directiva és **fonamental** per definir la subxarxa o subxarxes que el teu servidor DHCP gestionarà. Dins d'aquesta declaració, configures el rang d'adreces IP a assignar i altres opcions específiques per a aquesta xarxa. Sense una declaració de `subnet`, el servidor DHCP no sabrà quines adreces pot oferir.

- **`range <inici> <fi>;`**: Dins d'una declaració de `subnet`, aquesta directiva és **crucial**. Especifica el rang d'adreces IP que el servidor DHCP pot assignar dinàmicament als clients dins d'aquesta subxarxa. Si no defineixes un `range`, no s'assignaran adreces IP automàticament.

- **`option domain-name-servers <servidor_dns1>[, <servidor_dns2>, ...];`**: Aquesta directiva és **essencial** perquè els clients puguin resoldre noms de domini. Sense servidors DNS configurats, la navegació per internet i l'accés a recursos per nom seran impossibles.

- **`option routers <adreça_ip_gateway>;`**: Aquesta directiva és **vital** perquè els clients puguin comunicar-se amb xarxes externes (com ara internet). Defineix l'adreça IP de l'encaminador o gateway a través del qual el tràfic ha de ser enviat.

- **`default-lease-time <segons>;`**: Defineix la durada predeterminada de les concessions, **important** per a la gestió de les IPs.

- **`max-lease-time <segons>;`**: Estableix el límit màxim de durada d'una concessió, també **important** per al control de les IPs.

- **`option domain-name "<nom_de_domini>";`**: Especifica el sufix DNS que s'assignarà als clients. Útil per a xarxes locals amb un domini intern.
   
- **`option broadcast-address <adreça_de_broadcast>;`**: Defineix l'adreça de broadcast per a la subxarxa. Tot i que sovint es calcula automàticament, especificar-la pot ser necessari en certes configuracions.

- **`host <nom_del_client> { hardware ethernet <adreça_mac>; fixed-address <adreça_ip>; }`**: Permet la reserva d'adreces IP específiques per a clients amb una adreça MAC determinada. **Important** per a dispositius que necessiten una IP consistent.
   
- **`option ntp-servers <servidor_ntp1>[, <servidor_ntp2>, ...];`**: Configura els servidors NTP per a la sincronització horària dels clients. Tot i que no sempre és crític per a la connectivitat bàsica, és **important** per a la consistència i el funcionament adequat de molts sistemes i aplicacions.

- **`authoritative;`**: Aquesta directiva és **crucial** en la majoria de les configuracions. Indica al servidor DHCP que és l'únic o el principal servidor DHCP autoritzat per a la subxarxa o subxarxes configurades. Sense aquesta directiva, el servidor DHCP podria no respondre a les peticions dels clients
## Paràmetres de definició del servidor DHCP
## Configuració per assignació d'IP dinàmiques

## Instal·lació i configuració d'un servidor de PXE.
## Configuracio DNS
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
Ejemplos:

DHCP
RANG 1 (1 IP's) .100 - .101
RANG 2 (2 IP's) .103 - .104

Estatica per MAC .102:

```c
authoritative;

default-lease-time 600;
max-lease-time 7200;

option domain-name "smx.com";
option domain-name-servers ns1.smx.com;
server-name "dhcp.smx.com";

subnet 10.0.3.0 netmask 255.255.255.0 {
        range 10.0.3.100 10.0.3.101;
	range 10.0.3.103 10.0.3.104;
        option routers 10.0.3.1;
        option broadcast-address 10.0.3.255; 
}

host clientx{
	hardware ethernet 00:16:3e:85:26:19;
	fixed-address 10.0.3.102;
}
```

Verificar si funciona la resolucion dns

```
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
