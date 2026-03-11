#Manuales
M8: Aplicacions Web
Grupo: G4
Año: 24/25
[[Instal·lacio de Moodle]]

---

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>


# Índex
```table-of-contents

```

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>
---
# Instal·lació MySQL i prerequisits
![[Pasted image 20250518220041.png]]
![[Pasted image 20250518222223.png]]


## Instal·lació Moodle
![[Pasted image 20250518224016.png]]![[Pasted image 20250518224028.png]]![[Pasted image 20250518223837.png]]
![[Pasted image 20250518224117.png]]
![[Pasted image 20250518224142.png]]
![[Pasted image 20250518224254.png]]
![[Pasted image 20250518224358.png]]
![[Pasted image 20250518224733.png]]
![[Pasted image 20250518225203.png]]![[Pasted image 20250518224849.png]]
![[Pasted image 20250518225001.png]]

![[Pasted image 20250518225226.png]]
![[Pasted image 20250518225244.png]]
![[Pasted image 20250518230419.png]]![[Pasted image 20250518230724.png]]
![[Pasted image 20250518231039.png]]![[Pasted image 20250518231133.png]]
![[Pasted image 20250518231213.png]]![[Pasted image 20250518231240.png]]
Fet🗿👍🏻

# Configuracio Moodle

![[Pasted image 20250518232253.png]]
![[Pasted image 20250518232520.png]]
![[Pasted image 20250518232706.png]]![[Pasted image 20250518232719.png]]
![[Pasted image 20250518232752.png]]


### Canvia el tema per defecte
![[Pasted image 20250518232927.png]]

![[Pasted image 20250518232956.png]]
# Crea l'estructura en arbre de categories i cursos.

## 1. Crea la categoria **SMX Sistemes microinformàtics i xarxes**
![[Pasted image 20250518233447.png]]
![[Pasted image 20250518233549.png]]

## 2. Crea les subcategories **1r curs SMX** i **2n curs SMX i personalitza les seves descripcions**
![[Pasted image 20250518233633.png]]
![[Pasted image 20250518233701.png]]
![[Pasted image 20250518233727.png]]
## 3. Crea els cursos **MP1, MP2, MP3 i MP5** els quals pertenyen a la categoria 1r curs SMX.
![[Pasted image 20250518234351.png]]
![[Pasted image 20250518234653.png]]


## 4. Crea els cursos **MP4, MP6, MP7 i MP8** els quals pertenyen a la categoria 2n curs SMX.
![[Pasted image 20250518234705.png]]
![[smx2-corses.png]]

## 10. La mida límit dels fitxers que es poden pujar de 1r curs ha de ser de 4 Mb.
![[Pasted image 20250522164420.png]]

---

# Activitat 3 - Perfils i rols
1. **Creació manual** d'usuaris
    1. Crea manualment l'usuari XYZmanual amb "_mètode d'autenticació manual_".


2. **Creació automàtica** d'usuaris utilitzant un fitxer .csv. Consulta aquest **[enllaç](https://docs.moodle.org/30/en/Upload_users#File_formats_for_upload_users_file)** per saber la sintaxi dels registres del fitxer.
    1. Crea el fitxer **_ususAuto.csv_** amb 4 usuaris alumnes seguint el patró següent: Alu1nom Alu1cog1 Alu1cog2.


    2. Crea els 4 alumnes.

    3. Crea el fitxer **profs_Auto.csv_** amb 2 usuaris professors seguint el patró següent: Prof1nom Prof1cog1 Prof1cog2.Crea els 2 professors.

3. **Assignació de rols**
    1. Fes que l'usuari XYYmanual creat manualment, tingui rol de **_gestor d'àmbit global._**

    2. Fes que l'usuari professor _Prof1_ sigui **creador** de cursos d’àmbit global i sigui el professor del mòdul MP5.

    3. Fes que l'usuari professor _Prof2_ sigui el **professor** del mòdul  MP6 i també sigui **alumne** del mòdul MP5.

    4. Fes que l'usuari professor _Prof3_ sigui el **professor** del mòdul MP8 i també sigui **_professor no editor_** del mòdul MP6.

4. **Inscripció d'alumnes**: Comprova que els alumnes es poden inscriure en cursos.  
    1. Els usuaris alumne Alu1 i Alu2 s'han d'inscriure en els cursos MP5, MP6 i MP8.

    2. L'usuari alumne _Alu3_ s'ha d'inscriure només en el curs MP6.

    3. L'usuari alumne _Alu4_ s'ha d'inscriure només en el curs MP8.

5. **Creació de grups**: prova que els professors dels mòduls poden agrupar els seus alumnes.
    1. Els usuaris professor han de crear els grups 2SMXG1 i 2SMXG2.

    2. El grup 2SMXG1 conté els usuaris alumnes Alu3 i Alu4.

    3. El grup 2SMXG2 conté els usuaris alumnes Alu1 i Alu2. 


**RESPON:** Què és un rol d'usuari i per a què serveix?