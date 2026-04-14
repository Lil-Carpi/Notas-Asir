### 1. Script de Control (2,5 punts)

Crea un script anomenat `recuperacio_a02.3.py` que accepti els següents paràmetres des del terminal:

- `-p` o `--path`: Ruta del directori a analitzar (String).
    
- `-e` o `--ext`: Extensió de fitxer a cercar, per exemple `pdf` o `jpg` (String).
    
- `-m` o `--mida`: Mida mínima en bytes (Sencer).
    
- `--filtrar`: Acció que crida a la funció de cerca per extensió.
    
- `--gran`: Acció que crida a la funció de cerca per mida.
    
- `-h` o `--help`: Mostra un missatge d'ajuda amb l'ús de l'script.
    

L'script ha de ser **robust**: ha de gestionar els paràmetres en qualsevol ordre i mostrar un error si les dades no són vàlides (per exemple, si la mida no és un número).

### 2. Funció `analitza_extensions(path)` (2,5 punts)

Aquesta funció ha de retornar un **diccionari** on les claus siguin les extensions trobades i els valors siguin la quantitat de vegades que apareix cada extensió.

- _Exemple de retorn:_ `{'txt': 5, 'pdf': 2, 'zip': 1}`.
    
def analitza_extensions(path): comptador = {} if not os.path.isdir(path): return comptador for fitxer in os.listdir(path): ruta_completa = os.path.join(path, fitxer) if os.path.isfile(ruta_completa): # Obtenim l'extensió i la netegem (sense el punt i en minúscules) ext = os.path.splitext(fitxer)[1].lower().replace('.', '') if ext: # Si el fitxer té extensió comptador[ext] = comptador.get(ext, 0) + 1 return comptador
### 3. Funció `trobaPerExtensio(path, extensio)` (2,5 punts)

Aquesta funció ha de retornar una **llista** amb els noms de tots els fitxers que tinguin l'extensió indicada.

- Heu de controlar que l'extensió funcioni tant si l'usuari posa el punt (`.pdf`) com si no (`pdf`).
    def trobaPerExtensio(path, extensio):
     if not extensio.startswith('.'): extensio = '.' + extensio resultat = [] if os.path.isdir(path): for fitxer in os.listdir(path): if fitxer.lower().endswith(extensio.lower()): resultat.append(fitxer) return resultat

### 4. Funció `fitxersGrans(path, mida_minima)` (2,5 punts)

Aquesta funció ha de retornar una **llista** amb els noms dels fitxers que tinguin una mida (en bytes) superior a la `mida_minima` indicada.


- _Nota:_ Cal fer servir `[os.path](https://aulavirtual.iesthosicodina.cat/moodle/mod/url/view.php?id=202303 "os.path").getsize()`.