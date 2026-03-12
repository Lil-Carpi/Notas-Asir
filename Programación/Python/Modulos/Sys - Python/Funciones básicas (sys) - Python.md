#Python Programación Python
Proveniente de [[Índice - Python]], [[sys - Índice · Python]]

---
`sys` Es uno de los módulos que es capaz de interactuar directamente con el intérprete de Python. Podemos interactuar con I/O directamente.

---
## `sys.argv`
Devuelve una lista que contiene los argumentos que se le pasan al script desde la línea de comandos al ejecutarlo. El primer elemento es `sys.argv[0]`, el cual es siempre el nombre del script.

Se utilizan en los casos que se le han de pasar argumentos directamente desde la terminal, como nombres de archivos, opciones del script, etc.
```python
import sys
print(f"Nombre del script: {sys.argv[0]}")
print(f"Argumentos recibidos: {sys.argv[1:]}")
```
>[!output]
>Nombre del script: script.py
>Argumentos recibidos: `['hola', 'mundo']`

---
## `sys.exit([arg])`
Termina la ejecución del script de manera limpia. Se le puede pasar un número entero que actúe como código de estado (el `0` significa éxito, normalmente, cualquier otro número significa error. Se puede hacer un diccionario con códigos de error).

Se utiliza para detener la ejecución en caso de que algo falle, por ejemplo, falta un fichero importante, si el usuario no proporciono un argumento necesario o si ocurre un error irrecuperable.
```python
import sys
if len(sys.argv) < 2:
	sys.exit("Error: Debes proporcionar al menos un argumento.")
```

---
## `sys.path`
Es una lista de cadenas que indica los directorios donde el intérprete buscará los módulos cuando usas la palabra clave `import`.

Al importar un módulo o paquete personalizado que no está en el directorio actual ni en la instalación global de Python
```python
import sys
import os

# Se agrega una carpeta a la ruta de busqueda
sys.path.append(os.path.abspath("../carpeta"))
import modulopersonal
```

---
## `sys.platform`
Devuelve una cadena que identifica la plataforma sobre la que se ejecuta Python (ej. `'win32'` para Windows, `'darwin'` para macOS y `'Linux'` para Linux).

Sirve para hacer código multiplataforma donde se necesita ejecutar un comando distinto dependiendo del sistema operativo del usuario.
```python
import sys

if sys.platform == 'win32':
	print("Ejecutando configuración especifica para Windows")
elif sys.platform == 'darwin':
	print("Ejecutando configuración especifica para macOS")
```


---
## `sys.version` y `sys.version_info`
Contiene información sobre la versión actual del intérprete de Python que está ejecutando el script.

Serviría para asegurarse de que el programa no se ejecute en versiones antiguas de Python que no soportan ciertas características, como las f-strings, que requieren 3.6+.
``` python
import sys

if sys.version_info < (3, 8):
	sys.exit("Este script requiere Python 3.8 o superior.")
```

---
## `sys.stdin`, `sys.stdout` y `sys.stderr`
Representan los flujos de datos estándar del sistema:
- `stdin`: Entrada estándar (usualmente el teclado).
- `stdout`: Salida estándar (usualmente la pantalla/consola).
- `stderr`: Salida de errores estándar.
Se utiliza para redirigir la salida del programa para que escriba directamente en un archivo en lugar de imprimir en la consola, o procesar datos masivos leídos mediante pipes en la terminal
```python
import sys

with open('log.txt', 'w') as f:
	sys.stdout = f
	print("Esto no saldrá en la consola, se guardará en log.txt")
	
	sys.stdout = sys.__stdout__
```


---
## Script: Receptor de argumentos:
![[Receptor de argumentos (script)- Sys (Python)]]