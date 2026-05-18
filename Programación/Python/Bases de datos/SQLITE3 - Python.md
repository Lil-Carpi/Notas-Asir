#Python Programación Python
Proveniente de [[Índice - Python]]

---
## Conexion con la base de datos

```python
import sqlite3 as db
conn = db.connect(fichero.db)
cursor = conn.cursor()
conn.close()
```
---
## DDL y DML
**Consultas de lectura** (`SELECT`): Solo piden informacion. No se altera el archivo fisico. No necesitan informacion.

**Consultas de modificacion** (`INSERT`, `UPDATE`, `DELETE`, `CREATE TABLE`): Alteran los datos. Si no se confirma con el commit, los cambios se descartan.
**Siempre usar commit para guardar cambios**
```python
conn.commit()
```

---
### Pasar parametros sin sqli
Nunca usar fstrings para pasar datos a las sentencias sql.
**Varias variables**:
```python
query = "INSERT INTO characters (id, name) VALUES (?, ?)"
cursor.execute(query, (id_personaje, nombre_personaje))
```

**Una sola variable:**
```python
query = "SELECT * FROM quests WHERE difficulty = ?"
cursor.execute(query, (nivel_dificultad,)) # <---- Ojo a la coma
```

---
## Recojer datos
Al hacer el `SELECT`, se ejecuta la sentencia, pero se ha de pedir al cursor los resultados de las mismas:
##### `cursor.fetchone()`-> Devuelve una **tupla** `(valor1, valor2, ...)`
- Da una sola fila (la primera que encuentre).
- Usala para buscar PKs (`id`), para comprovar si algo existe, o con fuinciones agregadas (`COUNT`, `MAX`, `MIN`).
- Para sacar el dato limpio, se accede por indice de posicion:
```python
cursor.execute("SELECT won_battles FROM characters WHERE name = ?", (nombre,))
fila = cursor.fetchone() # devuelve por ejemplo: (12,)

if fila:
	victorias = fila[0] # Sacamos el numero 12 de la tupla
```
##### `cursor.fetchall()` -> Devuelve una **lista de tuplas** `[(...)]`
- Te trae todas las filas que coincidan con la consulta.
- Es una lista (corchetes) llena de tuplas (parentesis).
- Para recorrerla y procesarla, se usa `for`:
```python
cursor.execute("SELECT id, name FROM characters")
lista_personajes = cursor.fetchall()
# Devuelve [(1, 'Gimli'), (2, 'Legolas')]

for personajes in lista_personajes:
	id_char = personaje[0]
	name_char = personaje[1]
	print(f"ID: {id_char} -> Nombre: {name_char}")
```

---
## Tratar errores
Se utiliza el tipico `try...except`, utilizando los returns de sqlite3. El mas comun al insertar es duplicar una PK:
```python
try:
	cursor.execute("INSERT INTO characters (id, name) VALUES (?, ?)", (id_char, name))
	conn.commit()
except sqlite3.IntegrityError:
	print("Error: Violacion de integridad. Este ID ya existe en la tabla.")
except sqlite3.Error as e:
	print(f"Error generico de SQLite: {e}")
```

---
### Anteriores programas:
```python
import sys
import sqlite3

def usage():
    print("Modo de uso: script.py -c <nombre> [-i <id>]")

def main():
    args = sys.argv[1:]
    if not args:
        usage()
        return

    argval = 0
    nombre = None
    id_personaje = None

    while argval < len(args):
        arg = args[argval]

        if arg in ("-h", "--help"):
            usage()
            return
        elif arg == "-c":
            if argval + 1 < len(args):
                nombre = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta el nombre del personaje.")
                return
        elif arg == "-i":
            if argval + 1 < len(args):
                id_personaje = int(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta el ID.")
                return
        else:
            print(f"Error: Parámetro '{arg}' desconocido.")
            return

    # Una vez el bucle while termina de parsear y validar, 
    # abres la conexión y ejecutas la lógica de base de datos usando 
    # las variables 'nombre' o 'id_personaje' que capturó el bucle.
```

El caso real más complejo del examen es cuando haces un `fetchall()` y tienes que recorrer la **lista de tuplas**:

```Python

# Esto es lo que te escupe cursor.fetchall() al pedir los atletas
filas_bd = [
    (1, "Asafa Powell", "555893834"),
    (2, "Maurice Greene", "55592223")
]

# Recorremos la LISTA. En cada vuelta, 'fila' es una TUPLA individual
for fila in filas_bd:
    num_llicencia = fila[0]
    nom_atleta = fila[1]
    print(f"Llicència: {num_llicencia} -> Atleta: {nom_atleta}")
```
