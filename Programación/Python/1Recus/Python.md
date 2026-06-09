**Para ver ejercicios, consultar [[Python - Ejercicios]]**
```table-of-contents
```
---
# RA1 - Conceptos de programación
## Listas
Una lista es una estructura de datos integrada que se utiliza para almacenar colecciones ordenadas y mutables de elementos de cualquier tipo.
### Crear una lista
Puedes crear una lista vacía o con elementos iniciales. También puedes mezclar diferentes tipos de datos dentro de la misma lista.
```python
# Lista vacía
miLista = []
# Lista con elementos del mismo tipo
numeros = [1, 2, 3, 4, 5]
# Lista mixta con todos los elementos que se pueden poner en ella (integer, string, boolean, float)
mixta = [10, "Hola", True, 3.14]
```

### Acceder y modificar elementos
Las listas utilizan un índice basado en cero, lo que significa que el primer elemento tiene el índice 0. También admiten indexación negativa para empezar a contar desde el final (-1 es el último elemento).
```python
frutas = ["manzana", "plátano", "cereza"]
print(frutas[0])  # salida: manzana
print(frutas[-1]) # salida: cereza
# Modificar un elemento directamente
frutas[1] = "pera"
print(frutas)     # salida: ["manzana", "pera", "cereza"]
```
### Métodos esenciales para listas
**Métodos esenciales para listas** Python incluye una amplia variedad de métodos integrados para manipular los datos de una lista:
- **`append(elemento)`**: Añade un elemento al final de la lista.
- **`insert(índice, elemento)`**: Añade un elemento en la posición específica que elijas.
- **`extend(iterable)`**: Une otra lista o elemento iterable al final de la lista actual.
- **`remove(elemento)`**: Borra la primera aparición del elemento indicado.
- **`pop(índice)`**: Elimina y devuelve el elemento del índice indicado (si no pones nada, elimina el último).
- **`clear()`**: Elimina todos los elementos, dejando la lista vacía.
- **`sort()`**: Ordena de forma ascendente los elementos de la lista en su lugar.
- **`reverse()`**: Invierte el orden actual de los elementos de la lista.

---
## Diccionarios
Un diccionario es una estructura de datos integrada que almacena colecciones de datos en formato de pares clave-valor. Son mutables, pero sus claves deben ser únicas e inmutables (como strings o números).
### Crear un diccionario
Se definen utilizando llaves `{}`. Cada par clave-valor se separa por dos puntos `:`, y los elementos se separan por comas.
```Python
# Diccionario vacío
vacio = {}
# Diccionario con datos iniciales
usuario = {
	"nombre": "Ana",
	"edad": 28,
	"activo": True
}
```

### Acceder y modificar elementos
No se accede a los elementos mediante un índice numérico, sino llamando a su clave. Si asignas un valor a una clave que no existe, esta se añade automáticamente:
```Python
print(usuario["nombre"]) # Salida: Ana
# Modificar un valor existente
usuario["edad"] = 29
# Añadir un nuevo par clave-valor
usuario["email"] = "ana@email.com"
print(usuario) # salida: usuario = {"nombre": "Ana", "edad": 29, "activo": True, "email": "ana@email.com"}
```

### Métodos esenciales para diccionarios
- **`get(clave, valor_defecto)`**: Devuelve el valor de la clave. Si la clave no existe, no da error, sino que devuelve `None` o el `valor_defecto` que le indiques.
- **`keys()`**: Devuelve una vista con todas las claves del diccionario.
- **`values()`**: Devuelve una vista con todos los valores del diccionario.
- **`items()`**: Devuelve una vista con los pares clave-valor (útil para iterar con bucles `for`).
- **`pop(clave)`**: Elimina la clave indicada y devuelve su valor.
- **`update(otro_diccionario)`**: Actualiza el diccionario añadiendo los pares clave-valor de otro diccionario.

---
## Conjuntos (`set`)
Un conjunto es una colección desordenada, no indexada y mutable de elementos únicos e inmutables. Su característica principal es que no permite valores duplicados.
### Crear un conjunto
Se puede crear usando llaves `{}` (pero con elementos sueltos, no pares como los diccionarios) o la función `set()`.
```Python
# Conjunto vacio (Ojo, {} crea un diccionario vacío, hay que usar set())
vacio = set()
# Conjunto con elementos (eliminará los duplicados automáticamente)
numeros = {1, 2, 2, 3, 3, 3, 4}
print(numeros) # Salida: {1, 2, 3, 4}
```
### Añadir y eliminar elementos
Como no tienen un orden especifico, no puedes acceder a ellos mediante índices como `numeros[0]`.
```Python
frutas = {"manzana", "pera"}
# Añadir un elemento
frutas.add("cereza")
# Eliminar un elemento (si no existe, dará el error KeyError)
frutas.remove("pera")
# Eliminar un elemento (si no existe, NO dará error)
frutas.discard("kiwi")
```
### Métodos esenciales para conjuntos (operaciones matemáticas)
Los conjuntos van muy bien a la hora de hacer comparaciones matemáticas entre diferentes grupos de datos:
- `union(otro_set)`: Devuelve un nuevo conjunto con todos los elementos de ambos conjuntos.
- `intersection(otro_set)`: Devuelve los elementos que están presentes en ambos conjuntos a la vez.
- `difference(otro_set)`: Devuelve los elementos que están en el primer conjunto pero no en el segundo.

---
## Cadenas de texto (`str`)
Un string es una secuencia ordenada e inmutable de caracteres utilizada para representar texto. Que sea inmutable significa que, una vez creado, no puedes modificar sus caracteres directamente: cualquier cambio generará un string nuevo.
### Crear un string
Se puede definir usando comillas simples, dobles o triples (para textos de varias líneas).
```python
texto_simple = 'Hola'
texto_doble = "Mundo"
texto_multilinea = """ Este es un texto
que ocupa
varias líneas.
"""
```

### Acceder y "modificar" elementos
Al igual que las listas, los strings utilizan índices base cero y admiten indexación negativa y "slicing" (cortar trozos).
```Python
palabra = "Python"
print(palabra[0]) # Salida: P
print(palabra[-1]) # Salida: n
# Slicing: Extraer desde el índice 0 hasta el 2 (el 2 no se incluye)
print(palabra[0:2]) # Salida: Py
# Intento de modificación directa (va a dar error)
# palabra[0] = "J"
```

### Métodos esenciales para strings
Los métodos de los strings no se modifican en la variable original, sino que devuelven una versión nueva modificada.
- **`upper()`**: Convierte todo el texto a mayúsculas.
- **`lower()`**: Convierte todo el texto a minúsculas.
- **`strip()`**: Elimina los espacios en blanco (o caracteres indicados) al principio y al final del texto.
- **`split(separador)`**: Divide el string en una lista de subcadenas usando el separador indicado (por defecto, los espacios).
- **`join(iterable)`**: Une los elementos de una lista (o iterable) en un único string, separados por el string que llama al método.
- **`replace(viejo, nuevo)`**: Sustituye todas las apariciones de un texto por otro nuevo.
- **`count(subcadena)`**: Cuenta cuántas veces aparece una subcadena o carácter dentro del texto.

---
## Condicionales (`if`, `elif`, `else`)
Las estructuras condicionales permiten que un programa tome decisiones. Evalúan una expresión y, dependiendo de si el resultado es verdadero (`True`) o falso (`False`), ejecutan un bloque de código u otro.
### Uso del `if` y `else`
El bloque `if` ejecuta el código identado debajo de él solo si la condición se cumple. El bloque `else` es opcional y sirve como un "en caso contrario" ejecutándose únicamente si la condición del `if` fue falsa.
```Python
# Evaluar una condición simple
edad = 15
if edad >= 18:
	print("mayor de edad")
else:
	print("menor de edad") # Salida: menor de edad
```
### Uso de múltiples condiciones con `elif`
Cuando tienes más de dos caminos posibles, puedes usar `elif` (una abreviatura de "else if"). Puedes poner tantos `elif` como necesites. Python evaluará las condiciones en orden y se detendrá en la primera que sea verdadera.
```Python
# Evaluar multiples condiciones
nota = 7
if nota >= 9:
	print("Sobresaliente")
elif nota >= 7:
	print("Notable") # Salida: Notable
elif nota >= 5:
	print("Suficiente")
else:
	print("Suspendido")
```
### Conceptos esenciales para las condiciones
- **Indentación**: En Python, los bloques de código se definen por los espacios al principio de la línea. Todo lo que esté dentro de un `if` debe estar "metido a la derecha" (normalmente son 4 espacios o un tabulador).
- **Operadores de comparación**: `==` (igual a), `!=` (diferente de), `>` (mayor que), `<` (menor que), `>=` (mayor o igual a), `<=` (menor o igual a).
- **Operadores lógicos**: `and` (se deben cumplir ambas condiciones), `or` (basta con que una condición se cumpla), `not` (invierte el resultado de la condición).

---
## Bucle definido (`for`)
Puedes usar el `for` para extraer cada elemento de una lista o cada letra de un string uno por uno.
```Python
# Recorrer una lista de nombres
nombres = ["Mortadelo", "Filemón", "Anacleto"]
for nombre in nombres:
	print(nombre)
	# Salida:
	# Mortadelo
	# Filemón
	# Anacleto
# Recorrer un string letra por letra
palabra = "Hola"
for letra in palabra:
	print(letra) # Imprimirá H, o, l, a en líneas separadas.
```

### Generar secuencias (`range`)
Muy habitual en la RA1 (es posible que ni se vea fuera de esta). La función `range` genera una secuencia de números, lo que le permite repetir un bloque de código un número exacto de veces.
```Python
# range(5) genera los números del 0 al 4
for i in range(5):
	print(i) # Salida: 0, 1, 2, 3, 4
# range(inicio, fin) -> el número de "fin" NO se incluye
for i in range(1, 4)
	print(i) # Salida: 1, 2, 3
```

---
## Bucle indefinido (`while`)
El bucle `while` repite un bloque de código continuamente *mientras* una condición específica siga siendo verdadera (`True`). Es ideal cuando no sabes exactamente cuántas iteraciones habrá, como cuando esperas a que el usuario introduzca un dato correcto.
### Uso básico con un contador
Necesitas asegurarte de que la condición cambie en algún momento dentro del bucle; de lo contrario, crearás un "bucle infinito" y el programa se quedará bloqueado.
```Python
# Bucle con contador
contador = 0
while contador < 3:
	print(contador)
	contador =+ 1 # Sirve para actualizar la variable (sumar 1 cada vez)
                  # y que el bucle termine
# Salida: 0, 1, 2
```
### Bucles infinitos y rupturas (`break`)
En muchos ejercicios de validación de datos (como pedir notas o números del 1 al 10), se usa un `while True` para forzar un bucle infinito que se detiene solo usando la instrucción `break` cuando se cumple lo que queremos.
```Python
# Bucle de validación
while True:
	numero = int(input("Introduce un número positivo: "))
	if numero > 0 :
		print("¡Correcto!")
		break # Esto se encarga de romper el bucle while y el programa continúa.
	else:
		print(f"El número {numero} no es positivo. Vuelve a intentarlo.")
```
### Conceptos esenciales para bucles (`for` y `while`)
- **`break`:** Detiene la ejecución del bucle por completo inmediatamente, sin importar si quedaban iteraciones. 
- **`continue`:** Salta el resto del código en la iteración actual y pasa directamente a la siguiente vuelta del bucle.
- **`pass`:** Es una operación nula. No hace nada. Se usa cuando la sintaxis requiere que haya código (como dentro de un `if` o `except` vacío), pero tú no quieres ejecutar nada en ese momento.

---
# RA2 - Programación estructurada
## Funciones
Una función es un bloque de código reutilizable y organizado que se utiliza para realizar una única acción relacionada. Solo se ejecuta cuando es llamado explícitamente, lo que ayuda a evitar la repetición de código y hace que los programas sean más modulares y fáciles de leer.
### Crear y llamar una función
Puedes crear una función utilizando la palabra clave `def`, seguida del nombre de la función y paréntesis. Pueden recibir datos (parámetros) y devolver un resultado (`return`).
```Python
# Función básica sin parámetros
def saludar():
	print("¡Hola Mundo!")
# Llamada a la función
saludar() # Salida: ¡Hola Mundo!
# Función con parámetros y valor de retorno
def sumar(a, b):
	resultado = a + b
	return resultado
# Guardamos el valor que devuelve la función de una variable
total= sumar(3, 5)
print(total) # Salida: 8
```

---
## Documentación del código
PEP8 es la guía de estilo oficial de Python para escribir código limpio y legible. Dentro de estas buenas prácticas está el PEP 257, que define las convenciones para los "docstrings" (cadenas de documentación). Un docstring es un texto literal que se pone justo debajo de la definición de una función o módulo para explicar qué hace.
### Añadir un Docstring a una función
Se utilizan comillas triples `"""` para permitir que la documentación ocupe varias líneas si es necesario.
```Python
def calcular_area_rectangulo(base, altura):
	"""
	Calcula el área de un rectángulo.
	
	Parametros:
	base (float): La base del rectángulo.
	altura (float): La altura del rectángulo.
	
	Retorna:
	float: El área total calculada.
	"""
	return base * altura
# Puedes ver la documentación de una función usando el método especial __doc__
print(calcular_area_rectangulo.__doc__)
```
---
## Estructura condicional (`match`)
Introducida en Python 3.10, la sentencia `match` es el equivalente al `switch/case` de otros lenguajes. Permite comparar una variable contra múltiples patrones de forma mucho más limpia y legible que usando una cadena interminable de `if...elif...else`.
### Crear una estructura match
Utiliza la palabra clave `match` seguida de la variable a evaluar, y bloques `case` para cada posible coincidencia. El `case _` actúa como un comodín o caso por defecto (como el `else`).
```Python
opcion = 2
match opcion:
	case 1:
		print("Has elegido inciar el juego.")
	case 2:
		print("Has elegido cargar la partida.")
	case 3:
		print("Saliendo del juego...")
	case _:
		print("Opción incorrecta. Elige 1, 2 o 3.")
# Salida: Has elegido cargar la partida.
```
---
## Control de errores (`try ... except`)
El bloque `try...except` se utiliza para manejar excepciones (errores que ocurren mientras el programa se está ejecutando). En lugar de que el programa "explote" y se detenga bruscamente mostrando un error por pantalla, puedes capturar ese error y decidir qué hacer.
### Estructura básica de captura de errores
El código "peligroso" se pone dentro del `try`. Si falla, la ejecución salta inmediatamente al bloque `except`.
```Python
# Ejemplo de error por intentar dividir entre cero
try:
	numero = 10
	divisor = 0
	resultado = numero / divisor
	print(resultado)
except ZeroDivisionError:
	print("Error: No se puede dividir entre cero.")
# Ejemplo de error de conversión de datos
try:
	edad = int(input("Introduce tu edad: ")) # si el usuario escribe "Hola", dará error.
	print(f"tienes {edad} años.")
except ValueError:
	print("Error: Debes introducir un número entero válido.")
```
---
## Módulos y biblioteca estándar
Un módulo es simplemente un archivo de Python (`.py`) que contiene funciones y variables que puedes importar en tu programa. Python incluye una "Biblioteca Estándar" enorme, que son módulos preinstalados listos para usar sin necesidad de descargar nada extra.
### Importar y usar módulos (`os`, `sys`, `shutil` y `getopt`)
Se utiliza la palabra clave `import` al principio del script.
```Python
# SYS: Interactúa con el intérprete de Python (ej: leer argumentos de la consola)
import sys
# sys.argv es una lista que guarda los argumentos escritos en la terminal.
# si ejecutas: python script.py -u admin
print(sys.argv) # salida: ['script.py', '-u', 'admin']
# Nótese que el primer valor ^^^^^^^ es el nombre del script
# OS y OS.PATH: Interactúa con el sistema operativo (archivos, carpetas, rutas)
import os
# Comprovar si un archivo existe
if os.path.exists("archivo.txt"):
	print("El archivo está ahí.")
# Crear una carpeta nueva
os.makedirs("nueva_carpeta", exist_ok=True)
# SHUTIL: Operaciones de alto nivel con archivos (copiar, mover, borrar carpetas enteras)
import shutil
# Copiar un archivo de un sitio a otro
shutil.copy2("origen.txt", "destino.txt")
# GETOPT: Analiza los argumentos de la línea de comandos (sys.argv) de forma estructurada
import getopt
#Supongamos que ejecutamos: python script.py -a -b valor
argumentos = sys.argv[1:] # Quitamos el nombre del script
opciones, resto = getopt.getopt(argumentos, "ab") # 'b:' significa qyue b necesita un valor.
```
---
#### Módulo `os` y `os.path`
El módulo `os` es una librería de la biblioteca estándar que te proporciona una forma versátil de utilizar funcionalidades dependientes del sistema operativo, como leer o escribir archivos, o manipular rutas. `os.path` es un submódulo específico para trabajar con las rutas de los archivos de forma segura, independientemente de si estás en Linux o Windows.
###### Ejemplo de uso
Crear carpetas y comprobar rutas.
```Python
import os
ruta_directorio = "/home/dades/copies"
# Comprobar si el directorio ya existe
if not os.path.exists(ruta_directorio):
    # Si no existe, lo creamos
    os.makedirs(ruta_directorio)
    print("Directorio creado.")
else:
    print("El directorio ya estaba ahí.")
# Unir rutas de forma segura (añade las barras / automáticamente)
archivo_nuevo = os.path.join(ruta_directorio, "backup.txt")
print(archivo_nuevo) # salida: /home/dades/copies/backup.txt
```
###### Conceptos esenciales para `os` y `os.path`:
- **`os.listdir(ruta)`**: Devuelve una lista con los nombres de todos los archivos y carpetas que hay dentro del directorio indicado.
- **`os.makedirs(ruta, exist_ok=True)`**: Crea un directorio y todos los directorios intermedios necesarios. El parámetro `exist_ok=True` es vital para que el script no explote si la carpeta ya existe.
- **`os.getcwd()`**: (*Get Current Working Directory*) Un `pwd` de toda la vida.
- **`os.chdir(ruta)`**: (Change Directory) El equivalente a `cd` de Linux.
- **`os.remove(ruta)`**: Elimina un archivo en concreto. (Ojo, solo archivos: para carpetas vacías se usa `os.rmdir()`, y para carpetas llenas el `shutil.rmtree()`).
- **`os.path.join(ruta1, ruta2, ...)`**: Une uno o más componentes de una ruta de forma inteligente, usando el separador correcto del sistema operativo (`/` en Linux, `\` en Windows).
- **`os.path.exists(ruta)`**: Devuelve `True` si la ruta (archivo o carpeta) existe, y `False` si no.
- **`os.path.isdir(ruta)`** y **`os.path.isfile(ruta)`**: Devuelven `True` si la ruta apunta concretamente a un directorio o a un archivo normal, respectivamente.
- **`os.path.getsize(ruta)`**: Devuelve el tamaño del archivo en bytes.
- **`os.path.getmtime(ruta)`**: Devuelve la fecha de la última modificación del archivo (útil para saber cuál es el backup más antiguo).
- **`os.path.basename(ruta)`**: Extrae **solo el nombre del archivo** final de una ruta larga. (*De hecho, en el ejercicio de backups (RA2-Exercici amb móduls/4) para saber el nombre de la carpeta que debíamos copiar*).
	- Ejemplo: `os.path.basename("/home/usuario/dades.txt")` devuelve `dades.txt`.
- **`os.path.dirname(ruta)`**: Hace lo contrario que el anterior; te devuelve solo la ruta del directorio, quitando el archivo final.
---
#### Módulo `sys`
El módulo `sys` provee acceso a algunas variables y funciones que interactúan fuertemente con el intérprete de Python. Su uso estrella en la administración de sistemas (ASIR) es leer lo que el usuario escribe en la consola al lanzar el script.
##### Ejemplo de uso
Leer argumentos y forzar la salida del programa.
```Python
import sys
# sys.argv es una lista. El índice 0 siempre es el nombre del script.
# Los índices del 1 en adelante son los parámetros pasados por el usuario.
argumentos = sys.argv[1:]
if not argumentos:
	print("Error: No has pasado ningún parámetro.")
	sys.exit(1) # Cierra el programa con un código de error (1)
print(f"Has pasado estos parámetros: {argumentos}")
```
##### Conceptos esenciales para `sys`:
- `sys.argv`: Es la lista que contiene los argumentos de la línea de comandos pasados al script. Si escribes `python script.py -u admin`, `sys.argv` será `['script.py', '-u', 'admin']`.
- `sys.exit(código)`: Termina la ejecución del programa inmediatamente. Un código `0` significa que todo ha ido bien (salida exitosa), mientras que cualquier otro número (como `1`) indica al sistema operativo que ha habido un error.
- `sys.platform`: Devuelve un string con el sistema operativo sobre el que se está corriendo en script (ej: `linux`, `win32`, `darwin` para macOS). Sirve muy bien para hacer un script que deba comportarse distinto en Windows que en Linux.
- `sys.stdin`, `sys.stdout`, `sys.stderr`: Representan la entrada estándar (teclado), salida estándar (pantalla) y salida de errores. Puedes usarlos para redirigir directamente los `print` a un archivo de registro (log) en lugar de a la consola.
- `sys.version`: Te devuelve la versión exacta de Python que está ejecutando el script.
---
### Módulo `shutil`
El módulo `shutil` (shell utilities) ofrece una serie de operaciones de alto nivel sobre archivos y colecciones de archivos. Mientras que `os` te permite crear o borrar carpetas vacías, `shutil` es la herramienta que necesitas para copiar y borrar árboles enteros de directorios.
###### Ejemplos de uso
Copiar archivos y eliminar carpetas llenas.
```Python
import shutil
origen = "/var/log/syslog"
destino = "/home/usuario/backup_syslog.txt"
carpeta_a_borrar = "/home/usuario/temporales"
# Copiar un archivo de origen conservando sus metadatos (fecha de creación/modificación)
shutil.copy(origen, destino)
# Borrar una carpeta entera, incluso si tiene archivos dentro
shutil.rmtree(carpeta_a_borrar)
```
###### Conceptos esenciales para `shutil`
- `shutil.copy2(origen, destino)`: Copia un archivo desde el origen al destino. A diferencia de un `copy` normal, `copy2` intentará preservar todos los metadatos del archivo (como la fecha de creación original).
- `shutil.copytree(origen, destino, dirs_exist_ok=True)`: Copia un árbol de directorios entero (una carpeta y todo lo que contiene). El parámetro `dirs_exist_ok=True` (disponible desde Python 3.8) permite que la carpeta de destino ya exista sin lanzar un error.
- `shutil.rmtree(ruta)`: Elimina un árbol de directorios completo. Borra la carpeta y absolutamente todo el contenido que tenga dentro de forma recursiva.
- `shutil.move(origen, destino)`: Mueve un archivo o directorio de un sitio a otro. Un `mv` de Linux.
- `shutil.disk_usage(ruta)`: Su principal uso desde mi punto de vista sería la monitorización. Te devuelve una tupla con el espacio total, el espacio usado y el espacio libre (en bytes) de la partición donde esté la ruta.
- `shutil.make_archive(nombre_base, formato, directorio_raiz)`: Comprime una carpeta entera en `.zip` o `.tar`. Brutal para hacer scripts de backups.
	- Ejemplo: `shutil.make_archive("backup_mayo", "zip", "/home/dades")`.
---
### Módulo `getopt`
El módulo `getopt` es un analizador de opciones de línea de comandos (basado en la función `getopt()` de C). Básicamente, hace de forma automática lo que yo (el creador de este manual y de los ejercicios) estaba haciendo a mano con punteros con el bucle `while` recorriendo `sys.argv`.
###### Ejemplo de uso
Analizar parámetros cortos(`-h`, `-o`, `-d`) que el usuario pasa por consola.
```Python
import sys
import getopt
# Supongamos que el usuario ejecuta: python script.py -o origen.txt -d destino.txt
argumentos = sys.argv[1:]
try:
	# "ho:d:" significa que acepta -h (sin valor), -o (necesita valor), -d (necesita valor)
	opciones, resto = getopt.getopt(argumentos, "ho:d:")
except getopt.GetoptError as err:
	print(f"Error en los parámetros: {err}")
	sys.exit(1)
origen = None
destino = None
for opcion, valor in opciones:
	if opcion == "-h":
		print("Ayuda: script.py -o <origen> -d <destino>")
		sys.exit() # No poner nada es como poner 0.
	elif opcion == "-o":
		origen = valor # Automáticamente guarda "origen.txt"
	elif opcion == "-d":
		destino = valor # Automáticamente guarda "destino.txt"
print(f"Copiando de {origen} a {destino}")
```
###### Conceptos esenciales para `getopt`
- `getopt.getopt(args, shortops)`: Analiza la lista de argumentos (`args`, que suele ser `sys.argv[1:]`). El string `shortops` define qué letras se aceptan. Si una letra lleva dos puntos (`o:`), significa que ese parámetro exige que el usuario escriba un valor justo después. Retorna dos listas: los pares de opciones/valores detectados, y el resto de argumentos que no encajan.
- `getopt.GetoptError`: Es la excepción (error) que salta si el usuario pasa una opción que no está definida en `shortopts` o si se olvida de ponerle un valor a una opción que lo requería (como escribir `-o` sin poner el archivo después).
- **Opciones largas** (`longopts`): Al usar la función, le pasas una lista con los nombres de las opciones largas. Si la opción exige un valor, se le pone un signo igual `=` al final.
```Python
import sys
import getopt
argumentos = sys.argv[1:]
try:
	# "ho:d:" -> Opciones cortas (-h, -o valor, -d valor)
	# ["help", "origen=", "desti="] -> Opciones largas (--help, --origen valor --desti valor)
	opciones, resto = getopt.getopt(argumentos, "ho:d:", ["help", "origen=", "desti="])
except getopt.GetoptError as err:
	print(f"Error en los parámetros: {err}")
	sys.exit(1)
origen = None
destino = None
for opcion, valor in opciones:
	if opcion in ("-h", "--help"):
		print("Ayuda: script.py -o (--origen) <origen> -d (--desti) <destino>")
		sys.exit()
	elif opcion in ("-o", "--origen"):
		origen = valor
	elif opcion in ("-d", "--desti"):
		destino = valor
print(f"Copiando de {origen} a {destino}")
```
---
# RA3 - Entrada y salida de datos