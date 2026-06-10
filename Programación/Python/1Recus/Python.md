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
## Lista de diccionarios
Una lista de diccionarios es la combinación entre una lista y uno o varios diccionarios... Diccionarios que van dentro de listas. No tiene mucho misterio.
Consiste en una lista (ordenada y accesible por índice numérico) donde cada elemento guardado en su interior es un diccionario independiente (accesible por claves).
Es la estructura perfecta para representar una tabla de datos (algo así como una mini base de datos indexada): La lista es la tabla entera, y cada diccionario es una fila con la información de un único individuo u objeto.
### Crear una lista de diccionarios
Puedes inicializarla directamente con todos los datos o empezar con una lista vacía e ir añadiendo diccionarios mediante bucles.
```Python
# Lista vacía a la que luego se le añadiran diccionarios
servidores = []
# Lista inicializada con varios diccionarios (cada diccionario es un servidor)
usuarios = [
	{"id": 1, "nombre": "Ana", "rol": "admin", "activo": True},
	{"id": 2, "nombre": "Luis", "rol": "editor", "activo": False},
    {"id": 3, "nombre": "Marta", "rol": "editor", "activo": True}
]
```
### Acceder y modificar elementos
Para acceder a un dato concreto, necesitas **dos pasos**: primero usar el índice numérico `[0]` para elegir qué diccionario de la lista quieres, y luego usar la clave `["nombre"]` para elegir qué dato de ese diccionario necesitas.
```python
# 1. Acceder a un diccionario completo (el primer elemento de la lista)
print(usuarios[0]) 
# Salida: {'id': 1, 'nombre': 'Ana', 'rol': 'admin', 'activo': True}
# 2. Acceder a un valor específico dentro de un diccionario
# (Buscamos el "nombre" del segundo usuario)
print(usuarios[1]["nombre"]) 
# Salida: Luis
# 3. Modificar un valor específico
# (Cambiamos el estado del tercer usuario a inactivo)
usuarios[2]["activo"] = False
print(usuarios[2]) 
# Salida: {'id': 3, 'nombre': 'Marta', 'rol': 'editor', 'activo': False}
```
### Añadir y eliminar diccionarios de la lista
Como la estructura principal que envuelve todo es una lista, debes usar los métodos de las listas (`append`, `pop`, `remove`) para añadir o quitar diccionarios enteros.
```Python
# Añadir un nuevo usuario (diccionario) al final de la lista
nuevo_usuario = {"id": 4, "nombre": "Carlos", "rol": "invitado", "activo": True}
usuarios.append(nuevo_usuario)
# Eliminar el último usuario de la lista
usuario_eliminado = usuarios.pop()
print(usuario_eliminado["nombre"]) # Salida: Carlos
```
### Recorrer una lista de diccionarios
Para hacer funcionar esta estructura, casi siempre se usa el bucle `for`. El bucle extraerá cada diccionario uno a uno, y dentro del bucle podrás acceder a sus claves.
```Python
print("--- LISTA DE USUARIOS ACTIVOS ---")
# En cada vuelta, la variable 'user' será un diccionario diferente
for user in usuarios:
    # Filtramos para mostrar solo los que tienen "activo" en True
    if user["activo"] == True:
        print(f"ID: {user['id']} - Nombre: {user['nombre']} ({user['rol']})")
# Salida:
# --- LISTA DE USUARIOS ACTIVOS ---
# ID: 1 - Nombre: Ana (admin)
# ID: 3 - Nombre: Marta (editor)
```
### Métodos y Operaciones esenciales
Como es una estructura combinada, no tiene métodos propios y exclusivos, sino que utilizas el arsenal de las listas y los diccionarios según la "capa" en la que estés trabajando:
- **A nivel de Lista (la capa exterior):**
    - `append(nuevo_dict)`: Para meter una nueva "fila" (diccionario) al final.
    - `len(lista)`: Para saber cuántos diccionarios (registros) hay en total.
    - `pop(indice)`: Para borrar un diccionario entero de la lista.
- **A nivel de Diccionario (la capa interior):**
    - `lista[i].keys()`: Para ver qué claves tiene el diccionario en la posición `i`.
    - `lista[i].get("clave", valor_defecto)`: Fundamental para evitar que el script explote (con un `KeyError`) si intentas leer un dato que algún diccionario no tiene.        
    - `lista[i].update(otro_dict)`: Para actualizar múltiples valores de golpe dentro de uno de los diccionarios.

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
- `clear()`: Vacía el conjunto por completo.
- `pop()`: Elimina y devuelve un elemento **aleatorio** (ya que no tienen orden). Falla si el conjunto está vacío.
- `update()`: Añade múltiples elementos a la vez (como el `union()`)

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
	contador += 1 # Sirve para actualizar la variable (sumar 1 cada vez)
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

**Ejemplo más completo**
`try...except` también tiene sus excepciones internas, como `else` y `finally`:
```Python
import sqlite3
conn = None # Declaramos la variable fuera para poder usarla en el finally
try:
    print("Intentando conectar a la base de datos...")
    conn = sqlite3.connect("dnd.db")
    cursor = conn.cursor()
    # Intentamos una consulta (que podría fallar si la tabla no existe)
    cursor.execute("SELECT * FROM tabla_inexistente")
    datos = cursor.fetchall()
except sqlite3.Error as e:
    # Esto SOLO se ejecuta si falla algo en la base de datos
    print(f"Ha fallado la consulta: {e}")
else:
    # Esto SOLO se ejecuta si el bloque 'try' terminó con éxito (sin errores)
    print("¡Consulta realizada con éxito!")
    for fila in datos:
        print(fila)
finally:
    # Esto se ejecuta SIEMPRE (haya habido error o no, e incluso si el except hace un 'return' o 'break')
    print("Ejecutando tareas de limpieza (finally)...")
    if conn:
        conn.close()
        print("Conexión a la base de datos cerrada de forma segura.")
```
### Errores 
#### Las Clases Base (Categorías principales)
Estas no suelen saltar por sí solas, sino que agrupan a otros errores. Por ejemplo, si haces un `except ArithmeticError:`, capturarás cualquier error matemático.
- **`BaseException`**: La clase base de todas las excepciones.
- **`Exception`**: La clase base para todos los errores regulares (los que no detienen el sistema a la fuerza).
- **`ArithmeticError`**: Clase base para los errores matemáticos.
- **`LookupError`**: Clase base para errores al buscar algo que no existe (como un índice en una lista o una clave en un diccionario).
- **`OSError`**: Clase base para errores relacionados con el sistema operativo (archivos, red, permisos).
#### Errores de Búsqueda y Referencia (`LookupError`)
Ocurren cuando intentas acceder a un dato en una colección de forma incorrecta.
- **`IndexError`**: Intentas acceder a una posición en una lista o secuencia que no existe (ej. pedir la posición 10 en una lista de 3 elementos).
- **`KeyError`**: Intentas acceder a un valor en un diccionario usando una clave que no existe.
#### Errores de Tipos y Valores
Son, con diferencia, los que más vas a ver en el día a día.
- **`TypeError`**: Aplicas una operación o función a un tipo de dato incorrecto (ej. intentar sumar un string y un integer: `"Hola" + 5`).
- **`ValueError`**: La función recibe el tipo de dato correcto, pero el valor en sí no tiene sentido (ej. `int("Hola")`, la función espera un string, pero ese string no se puede pasar a número).
- **`NameError`**: Intentas usar una variable o función que no ha sido definida previamente.
- **`AttributeError`**: Intentas usar un método o propiedad que no existe para ese tipo de objeto (ej. intentar hacer `.append()` a un string).
- **`UnboundLocalError`**: Un subtipo de `NameError`. Ocurre cuando intentas modificar una variable local dentro de una función antes de haberle asignado un valor.
#### Errores Matemáticos (`ArithmeticError`)
- **`ZeroDivisionError`**: El clásico de intentar dividir o hacer el módulo de un número entre cero.
- **`OverflowError`**: El resultado de una operación matemática es demasiado grande para ser representado en la memoria (aunque en Python los integers pueden crecer casi infinitamente, esto suele pasar con floats).
- **`FloatingPointError`**: Rara vez se ve (si te sale, considéralo un error Shiny); ocurre cuando falla una operación de coma flotante a bajo nivel.
#### Errores del Sistema Operativo (`OSError`)
Fundamentales para scripts de administración. Todos estos heredan de `OSError`.
- **`FileNotFoundError`**: Intentas abrir un archivo o directorio que no existe.
- **`PermissionError`**: Intentas hacer algo para lo que el usuario actual no tiene permisos (ej. escribir en `/etc/` sin ser root).
- **`FileExistsError`**: Intentas crear un archivo o carpeta que ya existe en esa ruta.
- **`TimeoutError`**: Una operación a nivel de sistema (normalmente de red) ha tardado demasiado tiempo y se ha agotado el tiempo de espera.
- **`IsADirectoryError`**: Intentas usar un método de lectura de archivos (como `.read()`) sobre una ruta que resulta ser una carpeta.
- **`NotADirectoryError`**: Intentas hacer una operación de carpetas (como `os.listdir()`) sobre un archivo.
#### Errores de Sintaxis e Importación
Saltan antes o justo en el momento en el que el programa intenta empezar a ejecutarse o cargar módulos.
- **`SyntaxError`**: Has escrito código que Python no entiende (te falta cerrar un paréntesis, dos puntos `:` al final de un `if`, etc.).
- **`IndentationError`**: Subtipo de `SyntaxError`. Ocurre cuando los espacios o tabuladores al principio de la línea están mal alineados.
- **`TabError`**: Has mezclado espacios y tabuladores en la indentación de un mismo bloque de código.
- **`ImportError`**: Intentas importar un módulo y este falla (por ejemplo, porque hay una dependencia rota dentro de él).
- **`ModuleNotFoundError`**: Subtipo de `ImportError`. Intentas hacer `import` de un módulo que no está instalado o no existe.
#### Errores de Ejecución y Memoria
- **`MemoryError`**: Tu script se ha quedado sin memoria RAM disponible.
- **`RecursionError`**: Has creado una función que se llama a sí misma demasiadas veces (recursión infinita) y ha superado el límite de profundidad de Python.
- **`NotImplementedError`**: Se suele usar al diseñar clases para indicar que un método concreto aún no ha sido programado.
- **`RuntimeError`**: Un error genérico que se lanza cuando el error no encaja en ninguna de las otras categorías específicas.
#### Excepciones de Interrupción y Salida (Derivan directo de `BaseException`)

Estas no representan "errores" en el sentido estricto del código, sino interrupciones del flujo.
- **`KeyboardInterrupt`**: El usuario ha pulsado `Ctrl + C` en la terminal para matar el programa. (Por eso capturar `Exception` no bloquea el `Ctrl + C`, pero capturar `BaseException` sí lo haría, lo cual es una mala práctica).
- **`SystemExit`**: Se lanza cuando el programa llama a la función `sys.exit()`.
- **`StopIteration`**: La usa internamente Python en los bucles `for` para avisar de que ya no quedan más elementos en una lista o iterador.
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
## Lectura y escritura de ficheros (`open()`)
La función integrada `open()` es la herramienta principal de Python para interactuar con los archivos del sistema. Permite abrir un archivo en diferentes "modos" (leer, escribir, añadir) para manipular su contenido como si fuera flujo de texto (o de bytes).
Es una buena práctica utilizar siempre la estructura `with open(...) as variable:` ya que esto se conoce como un *gestor de contexto* y garantiza que el archivo se cierre automáticamente al terminar, incluso si ocurre un error en el proceso.
### Modos de apertuira principales:
- `'r'` (Read): Solo lectura. Da error si el archivo no existe. (Es el modo por defecto).
- `'w'` (Write): Escritura. Sobrescribe todo el archivo si ya existe, o crea uno nuevo si no existe.
- `'a'` (Append): Añadir. Escribe al final del archivo conservando lo que ya había. Crea uno nuevo si no existe.
- `'+'` (Update): Se combina con los anteriores (ej. `'r+'` para leer y escribir sin borrar).
### Lectura de ficheros
Puedes leer un archivo entero de golpe, o recorrerlo línea a línea (es lo mejor para archivos muy grandes para no saturar la RAM).
```Python
# Leer todo el contenido de golpe
with open("datos.txt", "r", encoding="utf-8") as f:
    contenido_total = f.read()
    print(contenido_total)
# Leer un archivo línea a línea usando un bucle for
with open("nombres.txt", "r", encoding="utf-8") as f:
    for linea in f:
        # Usamos strip() para quitar el salto de línea invisible (\n) del final
        print(linea.strip())
```
### Estructura de ficheros
Recuerda que si usas `'w'`, borrarás todo lo que había en el archivo antes de escribir lo nuevo. Para añadir como en un log, usa `'a'`.
```Python
# Sobrescribir o crear un archivo nuevo
with open("salida.txt", "w", encoding="utf-8") as f:
    f.write("Esta es la primera línea.\n")
    f.write("Esta es la segunda línea.\n")
# Añadir contenido al final de un archivo existente
lista_compra = ["Manzanas\n", "Peras\n", "Plátanos\n"]
with open("compra.txt", "a", encoding="utf-8") as f:
    # writelines() escribe una lista de strings de golpe
    f.writelines(lista_compra)
```
### Métodos esenciales para Ficheros
**Métodos esenciales para Ficheros**
- **`read([size])`**: Lee y devuelve todo el contenido del archivo como un único string. Si le pasas un número (size), lee esa cantidad de caracteres.
- **`readline()`**: Lee y devuelve una sola línea del archivo (hasta encontrar un `\n`).
- **`readlines()`**: Lee todo el archivo y devuelve una **lista** donde cada elemento es una línea del texto.
- **`write(string)`**: Escribe el string indicado en el archivo. No añade saltos de línea automáticamente, debes poner `\n` manualmente.
- **`writelines(lista)`**: Escribe una lista de strings en el archivo. Tampoco añade saltos de línea extra.
- **`seek(offset)`**: Mueve el cursor de lectura/escritura a la posición (byte) especificada. Útil si quieres volver a leer el archivo desde el principio (`f.seek(0)`).
- **`tell()`**: Devuelve la posición actual (en bytes) en la que se encuentra el cursor dentro del archivo.

---
## Bases de datos locales (`sqlite3`)
SQLite es una base de datos relacional ligera que viene integrada directamente en la *Biblioteca Estándar* de Python (`import sqlite3`). No necesita un servidor corriendo de fondo (como MariaDB); toda la base de datos se guarda en un único archivo físico (por ejemplo, el archivo que esta en el moodle de Python, `dnd.db`) .
### Conexión y consulta (Lectura)
Para interactuar, necesitas abrir la conexión, crear un "cursor" (que es el encargado de ejecutar las órdenes SQL), ejecutar la orden, extraer los datos y cerrar la conexión.
```Python
import sqlite3
try:
    # 1. Conectar al archivo de la base de datos
    conn = sqlite3.connect("dnd.db")
    # 2. Crear el cursor
    cursor = conn.cursor()
    # 3. Preparar la sentencia SQL con '?' para evitar inyección SQL
    dificultad_deseada = 5
    sql = "SELECT name, winner_id FROM quests WHERE difficulty = ?"
    # 4. Ejecutar la sentencia (los parámetros siempre van en una TUPLA)
    cursor.execute(sql, (dificultad_deseada,))
    # 5. Obtener los resultados (devuelve una lista de tuplas)
    resultados = cursor.fetchall()
    for fila in resultados:
        # fila[0] es name, fila[1] es winner_id
        print(f"Misión: {fila[0]} - Ganador ID: {fila[1]}")
except sqlite3.Error as err:
    print(f"Error de base de datos: {err}")
finally:
    # 6. Cerrar la conexión SIEMPRE en el finally
    if 'conn' in locals():
        conn.close()
```
### Inserción y Guardado de datos (Escritura)
Cuando haces operaciones que modifican la base de datos (`INSERT`, `UPDATE`, `DELETE`), debes confirmar los cambios explícitamente con `commit()`, de lo contrario no se guardarán al cerrar el programa.
```Python
import sqlite3
try:
    conn = sqlite3.connect("dnd.db")
    cursor = conn.cursor()
    nuevo_id = 99
    nuevo_nombre = "Elrond"
    sql = "INSERT INTO characters (id, name) VALUES (?, ?)"
    cursor.execute(sql, (nuevo_id, nuevo_nombre))
    # Importante: confirmar la transacción para que se guarde en el archivo
    conn.commit()
    print("Personaje insertado con éxito.")
except sqlite3.Error as err:
    print(f"Error: {err}")
finally:
    if 'conn' in locals():
        conn.close()
```

---
## Bases de datos Cliente-Servidor (`mysql.connector`/`MariaDB`)
A diferencia de SQLite, MySQL y MariaDB son bases de datos basadas en servidor. Python necesita usar una librería externa (conocida como `mysql.connector`) para comunicarse con ese servidor a través de la red (o localmente) validándose con un usuario y contraseña. La lógica de programación es idéntica a `sqlite3`, pero cambia la forma de conectar y el símbolo para los parámetros.
**Diferencias**: En `sqlite3`, los parámetros seguros se ponen con una interrogación (`?`), mientras que en MySQL/MariaDB se ponen con un porcentaje y una ese (`%s`) independientemente de si el dato es númerico o texto.
## Conexión y Consulta MySQL
```Python
import mysql.connector
try:
    # 1. Conexión usando credenciales del servidor MariaDB/MySQL
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="tu_password",
        database="atletisme"
    )
    cursor = conn.cursor()
    ciudad_buscar = "Barcelona"
    # ¡Atención! Usamos %s, no ?
    sql = "SELECT * FROM reunio WHERE lloc = %s" 
    cursor.execute(sql, (ciudad_buscar,))
    filas = cursor.fetchall()
    for fila in filas:
        print(fila)
except mysql.connector.Error as err:
    print(f"Error conectando al servidor: {err}")
finally:
    if 'conn' in locals() and conn.is_connected():
        cursor.close()
        conn.close()
```
### Metodos esenciales para Bases de datos (comunes a SQLite y MySQL):
- **`connect(...)`**: Abre la conexión a la base de datos (por archivo en sqlite3, por red en mysql).
- **`conn.cursor()`**: Crea un objeto cursor que se utilizará para ejecutar los comandos SQL.
- **`cursor.execute(sentencia_sql, tupla_parametros)`**: Ejecuta un comando SQL. Si hay filtros variables en el `WHERE` o valores en un `INSERT`, se pasan como una tupla en el segundo argumento para prevenir inyecciones SQL.
- **`cursor.fetchall()`**: Recupera todas las filas de la última consulta ejecutada (`SELECT`) y devuelve una **lista de tuplas**.
- **`cursor.fetchone()`**: Recupera solo la siguiente fila de la consulta (devuelve una única tupla o `None`).
- **`cursor.rowcount`**: Devuelve el número de filas afectadas por el último `INSERT`, `UPDATE` o `DELETE`, o el número de filas devueltas por un `SELECT`.
- **`cursor.lastrowid`**: Devuelve el ID autoincremental de la última fila que acabas de insertar con un `INSERT`.
- **`conn.commit()`**: Confirma y guarda permanentemente en disco los cambios realizados (obligatorio tras `INSERT`, `UPDATE`, `DELETE`).
- **`conn.rollback()`**: Deshace cualquier cambio pendiente que no haya recibido un `commit()`.
- **`conn.close()`** y **`cursor.close()`**: Cierran la comunicación. Muy importante hacer esto en el bloque `finally` para no dejar bloqueada la base de datos.

---
# Comentarios y licencia
Tanto esta hoja de apuntes como la hoja de ejercicios han sido un trabajo extenuante de 15 horas (sí, 15 horas de volada). Es posible que no me veáis más tocar un lenguaje de programación en todo el verano después de esto, tan siquiera abrir la terminal para hacer un `dnf update`. 
Si estás leyendo esto, es posible que estés en Junio. También es posible que me veas en la misma aula. Si te ha servido de alguna manera, agradecería que te acercaras para darme un feedback rápido sobre mi trabajo. Lo agradecería un montón.
- Mi perfil de GitHub:
	![|50](https://www.svgrepo.com/show/394174/github.svg) 
	[Lil-Carpi](https://github.com/Lil-Carpi)

>[!License]
> *Este manual es una obra libre; puedes redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General Affero de GNU publicada por la Free Software Foundation, ya sea la versión 3 de la Licencia, o (a tu elección) cualquier versión posterior.* 
> *Este manual se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; ni siquiera la garantía implícita MERCANTIL o de APTITUD PARA UN PROPÓSITO DETERMINADO. Consulta la Licencia Pública General Affero de GNU para más detalles.*
> ![Licencia: AGPL v3](https://img.shields.io/badge/License-AGPL_v3-blue.svg)
