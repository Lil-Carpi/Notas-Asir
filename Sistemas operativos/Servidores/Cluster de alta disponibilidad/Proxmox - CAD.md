#FedoraServer #ClusterAltaDisponibilidad
Proveniente de [[Índice - CAD (Cluster de Alta Disponibilidad)]]

---

Enunciat:
[[Pt9.1. Clúster dalta disponibilitat.pdf]]

---
Proxmox és un entorn de virtualització de servidors de codi obert. És una distribució de [[Índice - GNULinux|GNU/Linux]] basada en [[Debian|Debian]], amb una versió modificada del Kernel [[Ubuntu|Ubuntu]] LTS i permet el desplegament i la gestió de màquines virtuals i contenidors. Proxmox inclou una consola Web i eines de línia de comandes, i proporciona una API REST per eines de tercers. Dos tipus de virtualitzacions són compatibles: els contenidors basats en LXC (a partir de la versió 4.0 que reemplaça [[OpenVZ|OpenVZ]], utilitzada en la versió 3.4, inclòs), i la virtualització amb [[KVM|KVM]]. Porta un instal·lador i inclou un lloc web basat en la interfície d'administració.

*Proxmox VE està baix llicència GNU Affero General Public License, versió 3.*

### Models d'emmagatzematge
Proxmox suporta emmagatzematge local amb el grup LVM, el directori i [[ZFS|ZFS]], així com tipus de xarxa d'emmagatzematge com [[iSCSI|iSCSI]], [[Canal de fibra|Canal de fibra]], [[NFS|NFS]], [[GlusterFS|GlusterFS]] i [[CEPH|CEPH]].

### Clúster d'alta disponibilitat
Proxmox pot ser agrupat a través de múltiples nodes del servidor.
Des de la versió 2.0, Proxmox ofereix una opció d'alta disponibilitat per grups basats en la pila de comunicacions [[Corosync|Corosync]]. Els servidors virtuals individiuals poden ser configurats per la seva alta disponibilitat, l'ús de [[Red Hat Cluster Suite (RHCS)|Red Hat Cluster Suite (RHCS)]]. Si un node de Proxmox no està disponible o els servidors virtuals no poden moure automàticament a un altre node i es reinicia. La base de dades i el Fusible basat en el sistema de fitxers de Proxmox de Clúster (pmxcfs) fa que sigui possible dur a terme la configuració de cada node del clúster a través de la pila de comunicacions de [[Corosync|Corosync]].

### Migració en viu
En un clúster AD (Alta Disponibilitat) que executa màquines virtuals es poden moure d'un servidor físic a un altre sense temps d'inactivitat.

### Dispositius virtuals
Proxmox disposa de servidors de dispositius de programari preempacats que poden ser descarregats mitjançant la interfície gràfica d'usuari. És possible descarregar e implementar les eines de la [[TurnKey Linux Virtual Appliance Library|TurnKey Linux Virtual Appliance Library]].

-*Wikipedia ([Proxmox Virtual Environment](https://es.wikipedia.org/wiki/Proxmox_Virtual_Environment))*

---
# Creació de l'entorn de xarxa
### Entorn de xarxa
L'entorn de la xarxa és el següent:
	Xarxa NAT (Proxmox)
		- Identificador de xarxa: 192.168.100.0/24
![[IdentificadorDeXarxa-PT9.1-RA4-M5.png]]

### Màquines virtuals
Dominis de les màquines virtuals i adreces IP (els ports d'accés per web és el mateix per tots: 8006)
>[!.pve1.duarte.local - 192.168.100.10/24]	
![[pve1-PT9.1-RA4-M5.png]]

>[!.pve2.duarte.local - 192.168.100.20/24]
![[pve2-PT9.1-RA4-M5.png]]

>[!.pve3.duarte.local - 192.168.100.30/24]
![[pve3-PT9.1-RA4-M5.png]]

