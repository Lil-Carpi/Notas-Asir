#FedoraServer #ClusterAltaDisponibilidad #Manuales 
Proveniente de [[Índice - CAD (Cluster de Alta Disponibilidad)]]

---

![[proxmoxLogo.png]]

Enunciat:
[[Pt9.1. Clúster dalta disponibilitat.pdf]]

---
Proxmox és un entorn de virtualització de servidors de codi obert. És una distribució de [[Índice - GNULinux|GNU/Linux]] basada en [[Debian|Debian]], amb una versió modificada del Kernel [[Ubuntu|Ubuntu]] LTS i permet el desplegament i la gestió de màquines virtuals i contenidors. Proxmox inclou una consola Web i eines de línia de comandes, i proporciona una API REST per eines de tercers. Dos tipus de virtualitzacions són compatibles: els contenidors basats en LXC (a partir de la versió 4.0 que reemplaça [[OpenVZ|OpenVZ]], utilitzada en la versió 3.4, inclòs), i la virtualització amb [[KVM|KVM]]. Porta un instal·lador i inclou un lloc web basat en la interfície d'administració.

*Proxmox VE està baix llicència GNU Affero General Public License, versió 3.*

### Models d'emmagatzematge
Proxmox suporta emmagatzematge local amb el grup LVM, el directori i [[ZFS|ZFS]], així com tipus de xarxa d'emmagatzematge com [[iSCSI|iSCSI]], [[Canal de fibra|Canal de fibra]], [[Índice - NFS|NFS]], [[GlusterFS|GlusterFS]] i [[CEPH|CEPH]].

### Clúster d'alta disponibilitat
Proxmox pot ser agrupat a través de múltiples nodes del servidor.
Des de la versió 2.0, Proxmox ofereix una opció d'alta disponibilitat per grups basats en la pila de comunicacions [[Corosync|Corosync]]. Els servidors virtuals individuals poden ser configurats per la seva alta disponibilitat, l'ús de [[Red Hat Cluster Suite (RHCS)|Red Hat Cluster Suite (RHCS)]]. Si un node de Proxmox no està disponible o els servidors virtuals no poden moure automàticament a un altre node i es reinicia. La base de dades i el Fusible basat en el sistema de fitxers de Proxmox de Clúster (pmxcfs) fa que sigui possible dur a terme la configuració de cada node del clúster a través de la pila de comunicacions de [[Corosync|Corosync]].

### Migració en viu
En un clúster AD (Alta Disponibilitat) que executa màquines virtuals es poden moure d'un servidor físic a un altre sense temps d'inactivitat.

### Dispositius virtuals
Proxmox disposa de servidors de dispositius de programari preempacats que poden ser descarregats mitjançant la interfície gràfica d'usuari. És possible descarregar i implementar les eines de la [[TurnKey Linux Virtual Appliance Library|TurnKey Linux Virtual Appliance Library]].

-*Wikipedia ([Proxmox Virtual Environment](https://es.wikipedia.org/wiki/Proxmox_Virtual_Environment))*

---

```table-of-contents
```



---
# Creació de l'entorn de xarxa
### Entorn de xarxa
L'entorn de la xarxa és el següent:
	Xarxa NAT (Proxmox)
		- Identificador de xarxa: 192.168.100.0/24
![[IdentificadorDeXarxa-PT9.1-RA4-M5.png]]


---

### Màquines virtuals
Dominis de les màquines virtuals i adreces IP (els ports d'accés per web és el mateix per tots: 8006)
>[!.pve1.duarte.local - 192.168.100.10/24]
>![[proxmoxpve1.png|450]]	
![[pve1-PT9.1-RA4-M5.png|450]]


>[!.pve2.duarte.local - 192.168.100.20/24]
>![[proxmoxpve2.png|450]]
![[pve2-PT9.1-RA4-M5.png|450]]

>[!.pve3.duarte.local - 192.168.100.30/24]
>![[proxmoxpve3.png|450]]
![[pve3-PT9.1-RA4-M5.png|450]]

---
## Fitxers `/etc/hosts`
Abans de fer el clúster, hem d'assegurar-nos que les màquines es poden veure entre elles.
Per això, editem el fitxer `/etc/hosts` i afegim a la màquina corresponent:

>[!.pve1.duarte.local]
>```
>192.168.100.20 pve2.duarte.local pve2
>192.168.100.30 pve3.duarte.local pve3
>```
>![[proxmoxEtcHostsPVE1.png]]


>[!.pve2.duarte.local]
>```
>192.168.100.10 pve2.duarte.local pve1
>192.168.100.30 pve3.duarte.local pve3
>```
>![[proxmoxEtcHostsPVE2.png]]

>[!.pve3.duarte.local]
>```
>192.168.100.10 pve1.duarte.local pve1
>192.168.100.20 pve2.duarte.local pve2
>```
>![[proxmoxEtcHostsPVE3.png]]

---
# Clúster
## Creació del clúster
Per aquesta acció, agafaré el clúster `pve1.duarte.local` com principal. 

Fem:
```Instruccions
Centro de datos > Cluster > Crear cluster
```
![[ProxmoxCrearCluster.png]]

Ara demanarà un nom pel clúster. Jo li posaré de nom ***ClusterHA***:
![[proxmoxClusterName.png]]

Li donem a crear i esperem que digui ***`TASK OK`***:
![[proxmoxClusterOk.png]]

---
## Connexió de màquines al clúster
Per connectar les altres màquines al clúster, hem de cercar a la pestanya de `Información de la unión`, la ID. Donem directament al botó de `Copiar información`:
![[proxmoxIDCopy.png]]

Ara, anem a les altres màquines i al mateix lloc a la màquina `pve2`, però ara, `Unirse al Cluster`:
>[!Unirse al Cluster]
>```Instrucciones
>Centro de datos > Cluster > Unirse al Cluster
>```
![[proxmoxJoinCluster.png]]

Ens sortirà un requadre a on hem de pegar tota l'info que ens va donar el `pve1`. Quan ho fem, agafarà tota la informació del clúster, i només hem de posar-ne la contrasenya de root del `pve1`:
![[proxmoxJoinClusterPaste.png]]

Li donem a `Unir 'ClusterHA'`. Fem el mateix per `pve3`.
![[proxmoxClusterJoinResults.png]]

El resultat és que, a totes les màquines apareix el `ClusterHA`, amb les 3 màquines connectades:
![[proxmoxClusterConnected.png]]

---
## Afegir els discos durs per HA
Ara, apaguem les màquines i creem tres discos durs addicionals, un per cada màquina virtual:
![[proxmoxDiskCreations.png]]
![[proxmoxDiskAttatchement.png]]
***Fem el mateix pels discos de les màquines `pve2` i `pve3`.***

Ara veurem que totes les màquines tenen un disc addicional de 8 GB:
![[proxmoxAditionalDrive.png]]

---
## Configuració de HA
Prosseguirem amb la instal·lació del programari `Ceph`, que és un sistema d'arxius distribuit.
Fem:
>[!Instal·lacio Ceph]
>```
>Centro de datos > Ceph
>```
>![[proxmoxCephInstall.png]]

Veurem que ens apareixerà directament l'opció d'instal·lar-lo. Donem al botó `Instalar Ceph`.

Ens obrirà una finestra gran, a on al desplegable inferior dret hem de seleccionar `Sin-Subscripción`, després donem a instal·lar.
![[proxmoxCephInstallStart.png]]
Esperarem una estona a què acabi d'instal·lar.

La següent pestanya és la de Configuració. Aquí seleccionem la adreça IP del `pve1`, i donem a següent
![[proxmoxCephConfig.png]]

Esperem al fet que acabi. Aquest és el resultat que volem:
![[proxmoxCephInstallSuccess.png]]
***Fem el mateix amb el `pve2` i `pve3`***.

---

## Creació de monitors
Ara, cal crear un monitor per fer servir totes les màquines.

>[!Monitors]
>```
>pve1 > Monitor > Crear > Seleccionem el 3 pves
>```
![[proxmoxMonitorCreation.png]]
>![[proxmoxMonitorCreationPVEs.png]]

Ha de quedar-ne així:
![[proxmoxMonitorCreationResults.png]]

---

## Configuració dels ODS
Ara, configurem l'ODS per fer servir els discos de les tres màquines pve com un sol:
```Instruccions
ODS > Crear: ODS
```
![[proxmoxOSDconfig.png]]
Ens sortirà una petita finestra per seleccionar el disc per fer l'ODS. Donem a següent:
![[proxmoxCephOSD.png]]
***Fem el mateix en les pestanyes de pve2 i pve3***.

Ens hauria de quedar així, amb els tres discos funcionant:
![[proxmoxCephOSDResult.png]]

![[proxmoxCephOSDResultGeneral.png]]

---
## Creació d'una pool

Ara, perquè totes les màquines funcionin com una sola amb els discos extra, hem de crear una pool
```Instruccions
Anem a Ceph > Conjuntos > Crear
```
![[proxmoxPoolCreation.png]]

Ens demanarà un nom per la pool. Jo li posaré `ClusterHA`:
![[proxmoxPoolCreationName.png]]

Una vegada hagi acabat, veurem la pool creada, amb el seu nom, i a la columna de vista de dades per servidor, veurem que s'ha creat una nova secció anomenada `ClusterHA`
![[proxmoxPoolCreationResultsIndividual.png]]
![[proxmoxPoolCreationResultsServerview.png]]

---
## Creació de HA
Ara ja tenim tot preparat per posar-li el servidor apache.
Fem:
```instruccions
pve1 > local(pve1) > Plantillas de CT > Plantillas
```
![[proxmoxVMTemplate.png]]
S'obrirà una finestra amb múltiples màquines virtuals. Jo seleccionaré `Ubuntu 22.04-standart`.

Ara, es descarregarà la plantilla, es descomprimirà i anirà al directori de plantilles.
![[proxmoxVMTemplateDownload.png]]
![[proxmoxVMTemplateCache.png]]

Ara, creem el contenidor amb el botó superior dret que diu `Crear CT`:
![[proxmoxCreateCTButton.png]]

En la primera finestra, demanarà el nom de la màquina, node i una contrasenya
![[proxmoxCTCreation1.png]]

Segona finestra, demanarà una plantilla. Posem la que acabem de descarregar:
![[proxmoxCTCreation2.png]]

Tercera finestra, demanarà el disc en el qual s'emmagatzemarà la màquina.
![[proxmoxCTCreation3.png]]

Ignorarem la pestanya de CPU i Memòria.
Quarta finestra, demanarà la direcció IP de la màquina que crearem.
![[proxmoxCTCreation4.png.png]]
>[!attention]
>Al final he posat DHCP per defecte. 
>Ha agafat la direccio IP:
>- `192.168.100.7`

Ara, només cal fer següent a tot, i la màquina s'instal·larà:
![[proxmoxCTCreationSuccessful.png]]

Ara, veurem que s'ha creat un cubet baix pve1 a la columna de vista de servidor. Aquesta se la màquina virtual que acabem de crear:
![[proxmoxCTCreatedStpped.png]]
L'encenem amb
```instruccions
Clic dret sobre > Iniciar
```
![[proxmoxCTInit.png]]

Una vegada iniciat, podem anar a la consola i veure la màquina funcionant:
![[proxmoxVMCreated.png]]

---
## Instal·lació d'Apache2
Una vegada que estem dins de la màquina, fem:
```shell
sudo apt update -y ; sudo apt upgrade -y ; sudo apt install apache2
```
Això actualitzarà el sistema per complet i instal·larà el servidor web.
![[proxmoxApache2Install.png]]

Ara, podem anar a la seva IP en el navegador i veure la pantalla `It Works!` tipica:
![[proxmoxItWorksScreen.png]]

---
## Creació de l'alta disponibilitat
Bé, una vegada creada la màquina virtual, cal fer la configuració d'alta disponibilitat. Fem:
```instruccions
Centre de dades > HA > Agregar
```
![[proxmoxHACreation.png]]

S'obrirà una petita finestra, la qual demanarà quina màquina volem posar-la com HA:
![[proxmoxHAMachine.png]]
Seleccionem la màquina que acabem de crear i donem a Agregar.

Si s'ha creat correctament, veurem en la part superior que els tres nodes del clúster s'han *entre cometes* "fusionat". També ens adonarem que només un node del clúster està funcionant, mentre que els altres estan esperant instruccions:
![[proxmoxHACreated.png]]

---
## Comprovació de l'alta disponibilitat
Per comprovar que realment el servidor està configurat en mode alta disponibilitat, apagarem uns dels nodes del clúster i intentarem accedir a la pàgina del Apache un altre vegada.

Agafem el node principal, `pve1`, i l'apaguem *a lo vasco*:
![[proxmoxHATestPVE1Shutdown.png]]

Veurem que el primer node s'apaga
![[proxmoxHATestPVE1ShuttedDown.png]]
També veurem dins de la pestanya HA que el servidor `pve1` està mort:
![[proxmoxHATestPVE1ShuttedDown2.png]]

Cap a uns segons, veurem que `pve2` agafa la batuta:
![[proxmoxHATestPVE1ShuttedDown3.png]]

I veurem que el servidor Apache passa a mans de `pve2`
![[proxmoxHATestPVE1ShuttedDown4.png]]

Provem d'entrar a la web i veurem que funciona com si res ha passat
![[proxmoxHATestSuccessful.png]]

---
## Configuracio de prioritats
Es pot configurar la prioritat del cluster si cal. 
Modus operandi:
- Maquina virtual es troba a `pve1`
- `pve1` cau, la maquina virtual passa a `pve2`
- Quan `pve1` torna a estar-ne operatiu, la maquina virtual passa del `pve2` al `pve1`

```instruccions
Centro de datos > HA > Reglas de afinidad > Reglas de afinidad con el nodo HA
```
![[proxmoxHAPriority.png]]

![[proxmoxHAPriorityConfigured.png]]