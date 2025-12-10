#M5-ASIX 
## ASIX1A - M5 - Sebastian Ariel Duarte Oruez
### 10/12/25
Fet en Obsidian / Markdown

[Enunciat](https://aulavirtual.iesthosicodina.cat/moodle/pluginfile.php/275223/mod_assign/intro/Pt1.%20Instal·lació%20i%20avaluació%20daplicacions%20%282025-26%29.pdf)
# índex 

```table-of-contents
```


# Entorn de desenvolupament de software (Linux)

A continuació, es detalla la selecció de software per a l'equip de desenvolupament, justificant les eleccions i comparant-les amb altres alternatives del mercat.

### 1. Entorn de Desenvolupament Integrat (IDE)

**Elecció:** **Visual Studio Code (VSCode)**

- **Justificació:** És actualment l'estàndard de facto a la indústria. És lleuger, de codi obert (en la seva base) i extremadament versàtil gràcies al seu ecosistema d'extensions. Permet unificar el desenvolupament de Javascript, PHP i Python en una sola interfície sense necessitat de canviar de programa.
    
- **Comparativa:**
    
    - _VSCode vs Sublime Text:_ Sublime és més ràpid, però VSCode té millors eines de depuració (debugging) integrades i millor gestió de Git.
        
    - _VSCode vs WebStorm/PyCharm (JetBrains):_ Les eines de JetBrains són més potents "out-of-the-box", però són de pagament i consumeixen molts més recursos del sistema. VSCode ofereix un equilibri perfecte entre rendiment i funcionalitat gratuïta.
        

### 2. Control de Versions (Git)

**Elecció:** **Git (Línia de comandes) + Extensió Git integrada a VSCode**

- **Justificació:** Git ve instal·lat per defecte o és trivial d'instal·lar en qualsevol distribució Linux. Tot i que la línia de comandes és essencial, per al dia a dia s'utilitzarà la **integració nativa de VSCode** (o extensions com _GitLens_), que permet veure diferències, fer commits i gestionar branques visualment sense sortir de l'editor.
    
- **Alternatives gràfiques:** GitKraken (molt visual però amb limitacions en versions gratuïtes) o SmartGit.
    

### 3. Tractament i Edició d'Imatges

**Elecció:** **GIMP (GNU Image Manipulation Program)**

- **Justificació:** És l'alternativa lliure més potent a Adobe Photoshop. Suporta capes, filtres avançats i scripts, cobrint totes les necessitats d'edició d'imatge per a web i desenvolupament.
    
- **Comparativa:**
    
    - _GIMP vs Krita:_ Krita està més enfocat a la pintura digital i il·lustració. Per a retoc fotogràfic i manipulació general, GIMP és superior.
        
    - _GIMP vs Inkscape:_ Inkscape és vectorial (SVG), mentre que GIMP és matricial. Per a edició de fotos, GIMP és l'eina correcta.
        

### 4. Tractament i Edició de Vídeo i Àudio

**Elecció:** **Kdenlive** (Vídeo) i **Audacity** (Àudio)

- **Justificació:**
    
    - **Kdenlive:** És un editor de vídeo no lineal molt robust per a Linux, part del projecte KDE. Suporta múltiples pistes i formats sense necessitat de conversió prèvia.
        
    - **Audacity:** És l'estàndard per a l'edició ràpida d'àudio, neteja de soroll i retall.
        
- **Comparativa:**
    
    - _Kdenlive vs OpenShot:_ OpenShot és més senzill, però Kdenlive ofereix característiques més professionals necessàries si el projecte creix.
        
    - _Audacity vs Ardour:_ Ardour és un DAW complet (com ProTools), massa complex per a tasques simples. Audacity és més àgil.
        

### 5. Accés a propietats d'arxius .PSD

**Elecció:** **GIMP** (o Photopea via web si es requereix especificitat)

- **Justificació:** Atès que ja hem instal·lat **GIMP**, aquest és capaç d'obrir i editar arxius natius de Photoshop (.psd). Manté les capes i permet veure propietats, ocultar elements i exportar assets.
    
    - _Nota:_ Si es requereix una fidelitat del 100% sense instal·lar Photoshop (que no corre natiu a Linux), una alternativa online molt utilitzada és **Photopea**, però com a eina d'escriptori, GIMP compleix la funció.
        

### 6. Mockups i Prototipatge

**Elecció:** **Pencil Project** (pencil.evolus.vn)

- **Justificació:** És una eina de codi obert excel·lent per crear diagrames i prototips d'interfícies d'usuari (GUI) ràpides. Té col·leccions de formes per a Android, iOS i Web.
    
- **Comparativa:**
    
    - _Pencil vs Balsamiq:_ Balsamiq és de pagament. Pencil és gratuït i ofereix una funcionalitat molt similar per a "wireframing".
        
    - _Pencil vs Figma:_ Figma és l'estàndard actual però és basat en web (tot i que té client d'escriptori, consumeix molta RAM). Per a una eina 100% offline i lleugera, Pencil és ideal.
        

### 7. Navegadors Web (Testing)

**Elecció:** **Mozilla Firefox** (Principal), **Google Chrome** i **Chromium**

- **Justificació:**
    
    - **Firefox:** Per les seves excel·lents eines de desenvolupament (DevTools) i privacitat.
        
    - **Chrome/Chromium:** Necessari perquè és el motor (Blink) més utilitzat pels usuaris finals. És obligatori testejar que la web es vegi bé aquí.
        

### 8. Clients FTP Gràfics

**Elecció:** **FileZilla**

- **Justificació:** És el client FTP/SFTP més conegut, multiplataforma i robust. Permet gestió de llocs, cues de transferència i edició remota d'arxius.
    
- **Alternatives:** _gFTP_ (més antic) o _Cyberduck_ (CLI/Mac, menys comú a Linux GUI).
    

### 9. Clients SSH Gràfics

**Elecció:** **Termius** (o Remmina)

- **Justificació:** Tot i que a Linux se sol utilitzar la terminal nativa, **Termius** ofereix una interfície moderna per organitzar i guardar credencials de múltiples servidors, amb sincronització.
    
    - _Alternativa clàssica:_ **Putty** (molt utilitzat a Windows, però existeix a Linux) o **Remmina**(que a més de SSH gestiona VNC i RDP, ideal per a administradors de sistemes). Recomanem **Remmina** per ser tot-en-un.
        

### 10. Comunicació en Temps Real

**Elecció:** **Slack**

- **Justificació:** És l'estàndard en moltes empreses de desenvolupament. Té client natiu per a Linux (.deb/.rpm/snap) que funciona fluidament.
    
- **Alternatives:** _Discord_ (més enfocat a gaming, tot i que utilitzat en dev) o _Mattermost_ (alternativa Open Source self-hosted).
    

### Instal·lació de la pila de desenvolupament (Backend/Frontend)

Per completar l'entorn, s'instal·laran els següents serveis sol·licitats:

1. **Servidor Web:** **Apache HTTP Server**. (Estàndard, robust i modular).
    
2. **Base de Dades Relacional:** **MariaDB**. (Fork de MySQL totalment compatible, open source i amb millor rendiment/comunitat a Linux).
    
3. **Javascript Runtime:** **Node.js** (Versió LTS per a estabilitat).
    
4. **Base de Dades NoSQL:** **MongoDB**.
    
5. **Gestors de BBDD Gràfics:**
    
    - **DBeaver** o **Adminer**: L'enunciat demana _Adminer_ (que és un script PHP), però **DBeaver** és una aplicació d'escriptori universal molt més potent per a desenvolupadors. Si cal cenyir-se a l'enunciat: **Adminer**.
        
    - **MongoDB Compass**: L'eina oficial GUI per a MongoDB.
        
6. **API Testing:** **Postman**. Imprescindible per provar els endpoints del desenvolupament Backend.
    

# Entorn Windows (Ofimàtica)

Seguint els criteris d'eficiència i estandardització per al departament administratiu/ofimàtica.

### 1. Suite Ofimàtica

**Elecció:** **LibreOffice** (Opció Open Source) o **Microsoft Office 365** (Estàndard empresarial).

- _Recomanació:_ Si l'empresa busca estalviar costos i utilitzar software lliure com al departament de desenvolupament: **LibreOffice**. Si es requereix màxima compatibilitat amb clients externs: **Microsoft Office**.
    
- **Justificació LibreOffice:** Inclou Writer (Docs), Calc (Excel) i Impress (PowerPoint). És gratuït i llegeix formats de Microsoft.
    

### 2. Infografies i Presentacions

**Elecció:** **Canva** (Online - Accés directe) i **Impress/PowerPoint** (Escriptori).

- **Justificació:**
    
    - **Canva:** Per a infografies ràpides i modernes, és insuperable en facilitat d'ús. En ser online, crearem un accés directe a l'escriptori o marcador al navegador.
        
    - **Eina d'escriptori:** Per a presentacions confidencials o sense internet, s'utilitzarà la inclosa a la suite ofimàtica.
        

### 3. Videoconferència

**Elecció:** **Microsoft Teams** (o Zoom).

- **Justificació:**
    
    - **Teams:** Si l'empresa utilitza entorn Windows, Teams sol venir integrat i permet xat + vídeo + gestió d'arxius.
        
    - **Zoom:** És l'alternativa més estable si només es busca vídeo i no col·laboració documental.
        

### 4. Comunicació Interna

**Elecció:** **Slack** (Versió Windows).

- **Justificació:** Per mantenir la coherència amb el departament de desenvolupament i que tota l'empresa estigui al mateix canal de comunicació.
    

### 5. Utilitats Vàries (Necessàries per a l'entorn)

- **Compressor:** **7-Zip** (Gratuït, potent, obre tot).
    
- **Lector PDF:** **Adobe Acrobat Reader** o **Foxit Reader** (Per signar documents i visualització avançada).
    
- **Navegador:** **Google Chrome** o **Edge** (Preinstal·lat, funciona bé en entorn corporatiu).
    
- **Reproductor Multimèdia:** **VLC Media Player** (Per obrir qualsevol vídeo o àudio sense problemes de còdecs).