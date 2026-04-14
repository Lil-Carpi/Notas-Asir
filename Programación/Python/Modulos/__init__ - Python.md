#Python Programación Python
Proveniente de [[Índice - Python]]

---

El Dunder `__init__` es un caso especial, porque no solo nos sirve como método, sino también como fichero. En su formato fichero, este indica a Python que el directorio en donde se encuentra es un paquete. Está directamente relacionado con [[Clases - Python]].

---
## Método `__init__`
El método `__init__` nos sirve como constructor de una [[Clases - Python|clase]]. La función principal es el de *inicializar* (de ahí el nombre) los atributos del objeto cuando se crea.
## Ejemplo
Creamos la clase `Persona`. Queremos que cada persona tenga un nombre y una edad desde el momento que se crea en el código.
```python
class Persona:
	# A partir de aqui comienza el constructor
	def __init__(self, nombre, edad):
		self.nombre = nombre # Se le asigna el valor al atributo del obj.
		self.edad = edad     # Se le asigna el valor al atributo del obj.
		
	def saludo(self): # Se crea una funcion que la persona puede hacer.
		return f"Hola, soy {self.nombre} y tengo {self.edad} años."
		
persona1 = Persona("José", 30)  # Le pasamos los valores 
persona2 = Persona("Antonio", 25)

print(persona1.saludar())
print(persona2.saludar())
```
>[!Output]
>Hola, soy José y tengo 30 años
>Hola, soy Antonio y tengo 25 años

¿Y qué pasa si no pongo `__init__`?
Que Python usará algo básico por defecto que no va a hacer nada. Podrás crear el objeto, pero estará vacío y tienes que ir metiendo valores manualmente y uno por uno:
```python
class Persona:
	pass
p = Persona()
p.nombre = "Antonio"  # En caso de que te olvides de una linea, el objeto queda incompleto.
p.edad = 25
```

---
## Fichero `__init__.py`
Como dije antes, el fichero `__init__.py` metido dentro de un directorio indicará a python que lo que se encuentr dentro de este es un paquete.
Imaginemos este escenario:
```tree
mi_proyecto/ 
 │
 ├── main.py
 └── utilidades/ <-- Carpeta normal 
     ├── __init__.py <-- ¡Este archivo la convierte en paquete! 
     ├── calculos.py 
     └── fechas.py
```
Gracias al init, en `main.py` ahora podemos hacer `from utilidades import calculos`.

```python
import sys
import os

# 2. Funció analitza_extensions
def analitza_extensions(path):
    comptador = {}
    if not os.path.isdir(path):
        return comptador
    
    for fitxer in os.listdir(path):
        ruta_completa = os.path.join(path, fitxer)
        if os.path.isfile(ruta_completa):
            # Obtenim l'extensió i la netegem (sense el punt i en minúscules)
            ext = os.path.splitext(fitxer)[1].lower().replace('.', '')
            if ext: # Si el fitxer té extensió
                comptador[ext] = comptador.get(ext, 0) + 1
    return comptador

# 3. Funció trobaPerExtensio
def trobaPerExtensio(path, extensio):
    # Assegurem que l'extensió comenci per punt per comparar correctament
    if not extensio.startswith('.'):
        extensio = '.' + extensio
    
    resultat = []
    if os.path.isdir(path):
        for fitxer in os.listdir(path):
            if fitxer.lower().endswith(extensio.lower()):
                resultat.append(fitxer)
    return resultat

# 4. Funció fitxersGrans
def fitxersGrans(path, mida_minima):
    resultat = []
    if os.path.isdir(path):
        for fitxer in os.listdir(path):
            ruta_completa = os.path.join(path, fitxer)
            if os.path.isfile(ruta_completa):
                # os.path.getsize() retorna la mida en bytes
                if os.path.getsize(ruta_completa) > mida_minima:
                    resultat.append(fitxer)
    return resultat

def mostrar_ajuda():
    print("\n..:: Ajuda ::..")
    print("USAGE: python3 recuperacio_a02.3.py [OPCIONS]")
    print("-p, --path   : Ruta del directori a analitzar.")
    print("-e, --ext    : Extensió del fitxer a cercar (ex: pdf o .pdf).")
    print("-m, --mida   : Mida mínima en bytes (Sencer).")
    print("--filtrar    : Acció que busca per extensió.")
    print("--gran       : Acció que busca fitxers més grans que la mida indicada.")
    print("-h, --help   : Mostra aquesta ajuda.")

def main():
    args = sys.argv[1:]
    
    # Valors per defecte
    path = None
    extensio = None
    mida = None
    accio_filtrar = False
    accio_gran = False

    # 1. Script de Control (Gestionar paràmetres)
    i = 0
    while i < len(args):
        try:
            if args[i] in ("-h", "--help"):
                mostrar_ajuda()
                return
            elif args[i] in ("-p", "--path"):
                path = args[i+1]
                i += 2
            elif args[i] in ("-e", "--ext"):
                extensio = args[i+1]
                i += 2
            elif args[i] in ("-m", "--mida"):
                try:
                    mida = int(args[i+1])
                except ValueError:
                    print("Error: La mida (-m) ha de ser un número sencer.")
                    return
                i += 2
            elif args[i] == "--filtrar":
                accio_filtrar = True
                i += 1
            elif args[i] == "--gran":
                accio_gran = True
                i += 1
            else:
                print(f"Paràmetre desconegut: {args[i]}")
                i += 1
        except IndexError:
            print(f"Error: El paràmetre {args[i]} requereix un valor.")
            return

    # Validacions de seguretat
    if not path or not os.path.exists(path):
        print("Error: Cal indicar una ruta de directori vàlida amb -p.")
        return

    # Execució de les accions segons els flags
    print(f"--- Anàlisi del directori: {path} ---")
    
    # Sempre mostrem el resum d'extensions (opcional, però útil)
    resum = analitza_extensions(path)
    print(f"Resum d'extensions trobades: {resum}")

    if accio_filtrar:
        if extensio:
            llista = trobaPerExtensio(path, extensio)
            print(f"Fitxers amb extensió '{extensio}': {llista}")
        else:
            print("Error: Per filtrar cal indicar una extensió amb -e.")

    if accio_gran:
        if mida is not None:
            llista = fitxersGrans(path, mida)
            print(f"Fitxers més grans de {mida} bytes: {llista}")
        else:
            print("Error: Per cercar fitxers grans cal indicar la mida amb -m.")

if __name__ == "__main__":
    main()

```