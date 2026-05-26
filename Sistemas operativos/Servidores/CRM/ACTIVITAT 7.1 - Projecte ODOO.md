#Manuales #Servidores
Proveniente de [[Sistema de monitorizacion de redes]]
**Llenguaje de marques i sistemes de gestió d'informació - RA7**

**Sebastian Ariel Duarte Oruez**
**Curs 25/26**

---

![[odoo_logo.png]]
## Què és ODOO?
**Odoo** (conegut anteriorment com a _OpenERP_  i inicialment com a _TinyERP_ ) és un sistema d'ERP integrat de codi obert actualment produït per l'empresa belga Odoo S.A. El fabricant defineix el seu producte com una alternativa de codi obert a _SAP ERP_ i _Microsoft Dynamics_.

## Programari Empresarial
Odoo S.A. proporciona en el seu lloc web referències tant al mòduls amb suport oficial com als mòduls contribuïts (proporcionats per la comunitat).

Aquest programari té com a objectiu empreses de totes les mides. Inclou facturació, comptabilitat, fabricació, compres, gestió de magatzems i gestió de projectes.

## **Llicència i impacte en el model de negocis**
Els mòduls d'«Odoo Community version», a partir de la versió 9.0, majoritàriament, estan coberts per la **GNU Lesser General Puiblic License (LGPl)** i algunes parts utilitzen una derivada de la llicència Mozilla Public License. Com a conseqüència directa, Odoo no requereix cap pagament de llicències per a ser utilitzat. Això també implica que, mentre que es respectin els termes de la llicència, la modificació directa del programa és possible.

## Arquitectura
Odoo utilitza Arquitectura Orientada a Serveis com a patró de disseny.
### Arquitectura d'Aplicació Web
Les versions més recents d'Odoo (des de la versió 7) s'implementen com aplicació web seguint l'especificació Web Server Gateway Interface Odoo inclou un Servidor d'aplicacions /Servidor web (conegut com a Odoo Server) que se'n cuida de la lògica de negoci, de la comunicació amb el Sistema de gestió de bases de dades, i del client web per donar accés als navegadors web. La part del servidor i de lògica de negocis està escrit principalment en llenguatge de programació Python.  El client web està escrit principalment en JavaScript.

### Mòduls
Les funcionalitats del negoci s'organitzen en mòduls. Un mòdul és una carpeta amb una estructura predefinida, amb codi Python i arxius XMLdins. Un mòdul defineix l'estructura de les dades, formularis, informes, menús, procediments, fluxos de treball, etc. També poden contenir components web escrits en JavaScript. Els mòduls es defineixen mitjançant una sintaxi independent del client, de tal manera que afegir nous objectes, com menús i formularis els fa disponibles per a qualsevol client.

### Base de dades
Odoo utilitza PostgreSQL com a Sistema de gestió de bases de dades.
### Codi font i contribucions
El codi font d'Odoo s'allotja en GitHub], utilitzant el sistema de control de versions Git. Les contribucions també s'administren mitjançant GitHub.
## Programari com a servei
A partir de la versió 6.0, l'actual Odoo S.A. proporciona una versió d'Odoo com a servei: Odoo On Demand.
## Entorn de desenvolupament
El desenvolupament de mòduls es realitza editant arxius Python i XML. No hi ha un editor oficial, encara que en els tutorials hi ha preferència per Eclipse o PyCharm. Part de la lògica de l'aplicació pot ser canviada des de la interfície del client web en mode desenvolupament.

*-Wikipedia ([Odoo](https://ca.wikipedia.org/wiki/Odoo))*

---
## Justificació del sistema triat

---
# Índex
```table-of-contents
```

---
# Configuració de xarxa i sistema operatiu
#### Xarxa
La xarxa està en l'entorn de Zabbix (que és d'un altra pràctica)
- Identificador de xarxa: 192.168.100.0/24
- Adreça IP de la màquina virtual: 192.168.100.79/24
![[zabbixNatNetworkConfig.png]]
---
#### Màquina virtual i sistema operatiu
La màquina virtual té les següents característiques:
- 2096 MiB de RAM
- 2 vCPU
La distribució és **Ubuntu 24.04.4 LTS**
---
## Preparació d'instal·lació
#### Actualització
Primer, cal actualitzar el sistema operatiu amb:
```shell
sudo apt update -y ; sudo apt upgrade -y
```
![[odooUpdate.png]]

#### Instal·lació de dependències
Instal·larem les dependències necessàries:
```shell
sudo apt install -y python3-venv python3-pip python3-dev git postgresql postgresql-client libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libtiff5-dev libjpeg8-dev libpq-dev libfreetype6-dev zlib1g-dev libwebp-dev libharfbuzz-dev libfribidi-dev libxcb1-dev

# Amb aixo, s'instalaran dependencies de python (venv), git per poder descarregar ODOO des dels repositoris oficials i la base de dades postgresql.
```
![[odooDependencies.png]]
>[!nota]
>Com el servidor web funciona amb python, no cal instalar apache2

#### Instal·lació de Wkhtmltopdf
Aquesta eina és la que ODOO farà servir per exportar a PDF.
```shell
sudo apt install wkhtmltopdf -y
```
![[odooWkhtmltopdfInstall.png]]

#### Creació d'un usuari per la base de dades
ODOO necessitarà un usuari a la base de dades per poder-hi accedir i modificar dades.
Amb ***root***, fem:
```shell
postgres -c "createuser -s odoo"
```
![[odooPostgresUserCreation.png]]

Canviem les credencials de l'usuari Odoo amb:
```shell
sudo su - postgres -c "psql -c \"ALTER USER odoo WITH PASSWORD 'odoo';\""
```
![[odooPostgresUserAlter.png]]

---
## Instal·lació d'ODOO
#### Clonació des del GitHub
Clonem ODOO des del seu GitHub oficial:
```shell
git clone https://github.com/odoo/odoo.git -b 17.0 --depth 1
# Clonem la versio (b de branch) 17.0
```
![[odooGitClone.png]]

#### Creació de l'entorn virtual (venv)
>[!warning]
> Venv és una eina de Python que permet crear espais aïllats per projectes. En activar-ho, tots els paquets o llibreries que descarreguem allà dins es quedarà només allà en comptes de instal·lar-lo de manera global.

Entrem al directori d'odoo, creem l'entorn virtual i activem venv:
```shell
cd odoo/
python3 -m venv odoo-venv
source odoo-venv/bin/activate
# Veurem que esta activat si a la part esquerre del prompt veiem "(odoo-venv)"
```
![[odooVenv.png]]

Ara, actualitzem pip:
```shell
pip install --upgrade pip
```
![[odooPipUpdate.png]]
#### Instal·lació de paquets de Python
ODOO necessita els paquets que té al fitxer `requirements.txt`.  A més, instal·larem el paquet `wheel` i el paquet `openpyxl`:
```shell
pip install wheel && pip install -r requirements.txt && pip install openpyxl
```
![[odooPipInstallAll.png]]
![[odooInstallOpenpyxl.png]]

Quan acabi d'instal·lar, iniciem el servidor:
```shell
./odoo-bin --db-host=127.0.0.1 -r odoo -w odoo --addons-path=addons
```
![[odooServerIni.png]]

Ara, cal continuar la instal·lació des de la pàgina web

---
## Instal·lació Web
Ingressa'm a la direcció `http://192.168.100.79:8069`
>[!warning]
>**IMPORTANT**: S'ha d'ingressar al servidor web amb `http`, no `https`

![[odooWebInstallBegin.png]]

Emplenem els camps, en aquest cas, de la següent manera:
- Master Password: miqm-vtup-c63n
- Database Name: ODOO-LMSGI
- Email: carpi@lilcarpi.com
- Password: 123
- Phone Number: 555 555 555
- Language: Spanish / Español
- Country: Spain
- Demo Data [ x ]
![[odooWebInstallDades.png]]

Donem a `Create Database`. Pot trigar una mica. Podem veure que va fent coses si mirem a la consola:
![[odooInstallationConsole.png]]

Una vegada hagi acabat, ja estarà instal·lat correctament. 

---
## Instal·lació dels mòduls
Iniciem sessió amb les credencials que hem donat abans:
![[odooLogin.png]]

Una vegada iniciem sessió, veurem totes les aplicacions disponibles:
![[odooLoggedIn.png]]

Els mòduls que ens interessa és el de `Ventas`, `Contabilidad` i `CRM`. Per poder fer l'inventari més endavant, activem també el mòdul de `Inventario`.
![[odooCRMModule.png]] ![[odooVentasModule.png]]![[OdooContabilidadModule.png]] ![[odooInventarioModule.png]]

---
## Creació i gestió d'usuaris
Per la creació i gestió d'usuaris, hem d'anar a `Ajustes > Gestionar usuarios`
![[odooGU1.png]] ![[odooGU2.png]]

Per al moment, només tindrem creats dos usuaris, l'usuari de demostració i el nostre:
![[odooUsers.png]]

Pitgem el botó de `Nuevo` a la part superior esquerre per crear un usuari nou. Ens sortirà el següent:
![[odooNewUser.png]]

Explicaré una mica que és cada cosa:
- **Sales (Ventas)**: Controla què pot fer en el fluxe de pressupostos i comandes de clients
- **Accounting (Contabilidad)**: Defineix el nivell d'accés a les factures, comptes bancaris, asents contables i informes financers. El part més sensible de totes.
- **Banco**: Habilitat per registrar extractes bancaris, fer pagaments i gestionar comptes de l'empresa
- **Inventory (Inventario)**: Accés al magatzem, control d'estoc, receptors de mercaderia i enviaments.
- **Administration (Administración)**: Dona accés a configuracions globals del sistema. Instal·lacions de nous mòduls i edició de codi o configuracions tècniques d'Odoo.

---
Crearem dos usuaris:
- `John Doe` amb correu `jdoe@lilcarpi.com`: **Gestor comercial / Técnic d'inventari**

**Configuració de permisos de l'usuari**
- **Vendes i inventari**: Se li assignen permisos de nivell *Usuari* per permetre-li gestionar de manera autònoma el catàleg de productes, consultar existències i formalitzar comandes de clients.
- **Comptabilitat:** Es limita el seu accés exclusivament a _Facturació_ per tal que pugui generar factures derivades de les seves vendes, sense capacitat per alterar els llibres comptables ni accedir a dades financeres profundes.
- **Seguretat Organizativa**: Es deixen completament en blanc els mòduls de _Banco_ i _Administración_. Amb aquesta mesura s'aplica el principi de privilegis mínims, garantint que l'usuari no pugui modificar configuracions crítiques del sistema ni accedir a dades bancàries de l'empresa.
![[odooUserJDoe.png]]

- `Jane Smith` amb correu `jsmith@lilcarpi.com`: **Contable / Gestora financiera**.
**Configuració de permisos de l'usuari** 
- **Comptabilitat i Banc:** Se li assignen permisos de nivell _director / Comptable_ per tal de permetre la gestió integral dels llibres diaris, conciliació bancària, control de venciments i la generació d'informes financers i d'anàlisi.
- **Vendes i Inventari:** Es restringeix completament l'accés (`Ningú`) a aquests mòduls. Com que el seu rol és purament administratiu de fons, no requereix visualitzar l'estat del magatzem ni interactuar amb el flux de pressupostos.
- **Seguretat Organitzativa:** Mitjançant la separació de deures (_Segregation of Duties_), s'assegura que l'usuari que gestiona els diners de l'empresa (Jane) sigui un perfil totalment diferent del que fa les vendes i mou l'estoc (John), evitant conflictes d'interessos i errors humans en la base de dades.
![[odooUserJane.png]]

Als dos usuaris, li donem a l'engranatge de dalt a l'esquerra i a `Cambiar contraseña` per assignar-li una contrasenya a cada compte:
![[odooAsignPasswd.png]]
![[odooPasswdChange.png]]
*Fem el mateix amb l'usuari de Jane Smith.*

---
## Exportació i importació de dades
#### Exportació
Aprofitarem que hem marcat la casella de `Demo Data` en crear-ne la base de dades i exportarem dades per modificar-les i tornar-les a importar.

Anem al `Menu > Inventario > Productos > Productos`
![[odooMenuInventari.png]] ![[odooProductosProductos.png]]

Ens sortirà una llista `kanban` de tots els productes que tenim. A dalt a l'esquerra, pitgem el botó d'ordre > Llista per poder seleccionar:
![[odooListModeSelector.png]]
![[odooStockList.png]]

Ara que tenim la llista de productes, seleccionem 4 o 5 productes, donem a `Acciones > Exportar`
![[odooExport.png]]

Ens sortirà una finestra gran. Per poder exportar-lo, donem a la casella de dalt que posa `Quiero actualizar datos (exportación compatible con importación)`:
![[odooExportData.png]]

Ara donem clic a exportar, baix a l'esquerra:
![[odooDataExport.png]]

Es descarregarà un fitxer amb format `.xlsx` que podrem editar amb el LibreOffice Calc:
![[odooExportSucces.png]]

Així és com es veu obert:
![[odooExcel.png]]

Modifiquem qualsevol valor de la taula. Canviaré el preu de tots els productes i li posaré un `standart price` i un `list price` de 9999:
![[odooPricesChanged.png]]

---
#### Importació de dades
Una vegada modificat el document, hem de reincorporar-ho a Odoo.
Tornem a la pestanya de `Productos`, fem clic a l'engranatge que està a dalt a l'esquerra > `Importar registros > Subir archivo`:
![[odooImportationStarted.png]]![[odooImportFichero.png]]

Seleccionem el nostre fitxer:
![[odooSubirFichero.png]]

Si surt tot bé, ens sortirà això:
![[odooImportedOk.png]]
Aquí es veu el canvi de standard_price a 9999. 

Fem una prova primer amb el botó `Probar` de dalt a l'esquerra:
![[odooImportValido.png]]
Si posa `Todo parece válido`, podem donar-li a `Importar`.

Quan li donem a `Importar`, podrem veure el canvi a les columnes de l'inventari:
![[odooImportSuccess.png]]
Veiem que el preu de venda i el cost han pujat a `9.999,00€`.

---
## Informes de vendes i anàlisi comercial
#### Informe
Per fer l'informe de vendes, anem al `Menu > Ventas > Informes > Ventas`:
![[odooGoToVentas.png]]![[odooGoToVentas2.png]]

Aquí veurem una gràfica com aquesta:
![[odooSalesGraphic.png]]

Dalt a la dreta, donem al requadre de vista > `Tabla dinámica`:
![[odooDynTable.png]]
Aqui es pot fer l'analisi de vendes:
![[odooAnalisis.png]]


#### Creació d'una factura
Per fer una factura, anem a `Menu > Facturación / Contabilidad > Informes > Analisis de facturas`
![[odooGoToFacturacion.png]] ![[odooCreateFactuira.png]]
Fem la factura:
![[odooFacturaCreated.png]]

Creem també un altre factura per una pròxima prova:
![[odooFactura2.png]]

Ara anem a `Menu > Facturación / Contabilidad > informes > Analisis y facturas`
Donem a vista pie chart i cliquem sobre el pie chart:
![[odooFactures.png]]
Aquí podrem veure el número de factura que hem fet abans.


---
## Generar informe financer
Anem al panell de comptabilitat:
`Menu > Facturación / Contabilidad > Informes`

Si tornem al pie chart, també podrem fer un ordre de factures pendents de pagament, de client, d'empreses, per temps, etc. Per exemple, un filtre de factures pagades d'empreses:
![[odoofacturasfiltros.png]]
![[odooFacturaEmpresas.png]]

---
## Informe d'inventari
Anem a `Menu > Inventario > Informes > Valoración`

![[odooGoToInventari.png]] ![[odooValoracion.png]]

Ens donarà la següent taula a la vista de taula:
![[odooInventariTaula.png]]

#### Informe personalitzat
Per fer un informe personalitzat, fem un filtre personalitzat:
![[odooPersonalizedFilter.png]]

Per exemple, busquem una companyia que es digui `ES Company`:
![[odooSorting.png]]
![[odooNoResults.png]]
No hi ha res.

---
## Mesures de seguretat
#### Fora del ERP
En fer l'exportació de dades fora del sistema Odoo amb format `.csv` o `.xlsx`, quedaran exposats al sistema d'arxius local. Com aquestes dades contenen dades delicades subjecta a la **LOPDGDD**, s'han d'aplicar mesures dràstiques al servidor.

**Xifratge amb OpenPGP**
Suposem que tenim un document amb dades confidencials. Abans de passar-ho a un altre servidor o ordinador, haurem de xifrar-ho:

Faré servir el `.xlsx` d'abans:
![[odooExportSucces.png]]

Ara l'encriptem:
```shell
gpg -c "Producto (product.template).xlsx"
```
![[odooFitxerEncriptat.png]]

S'obrirà una finestra que demanarà una frase com contrasenya pel fitxer:
![[odooFraseContraseña.png]]

Es generarà un altre fitxer encriptat que podrem compartir per la xarxa:
![[odooEncriptedFile.png]]

Per tornar a obrir el document, fem:
```shell
gpg -d 'Producto (product.template).xlsx.gpg' > 'Producto (product.template).xlsx'
```
![[odoounencrypt.png]]

Demanarà la contrasenya que hem posat abans:
![[odoounencryptsuccess.png]]

i ja estarà desencriptat un altra vegada:
![[Pasted image 20260524225747.png]]

Això ho podem fer servir quan editem un Excel important i ho passem a un nas de l'empresa o a altres destins.

---
## Reflexió final
