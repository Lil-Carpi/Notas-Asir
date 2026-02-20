#Python Programación Python
Proveniente de [[OS - Índice · Python]], [[Índice - Python]]

---
Las funciones más importantes del módulo OS son aquellas que nos permiten interactuar de forma rápida y directa con los directorios que necesitemos interactuar.

Las funciones básicas del módulo son las siguientes:

---
### `os.getcwd()`
Esta función nos da la ruta absoluta de la posición en la que nos encontremos:
```python
os.getcwd()

# Output:
# /home/carpi/Documentos/Python
```

---
### `os.listdir(path)`
Lista los archivos y carpetas en la ruta absoluta que se le indique:
```python
os.listdir(/home/carpi)

# Output:
# ['Descargas', 'Documentos', 'Escritorio']
```

---
### `os.mkdir()` / `os.makedirs()`
Crea carpetas (makedirs crea carpetas de forma recursiva):
```python
os.mkdir("Carpeta")
os.makedir("Carpeta/Cosas")

# tree:
# .
# └── Carpeta
#     └── Cosas

```

---
### `os.environ`
Muestra un diccionario con las variables del entorno del sistema.
```python
os.environ

# No pongo output porque sale mucho texto.
# Si lo quieres probar, abre python y lo haces.
```

---
### `os.remove()`
Borra un archivo o directorio
```python
os.remove("Carpeta/Cosas")

# tree:
# .
# └── Carpeta
```

---
### `os.path()`
Sirve para la manipulación de rutas. Aunque es parte de `os`, se centra específicamente en manipular cadenas de texto que representan las rutas de archivos.

Tiene muchas funciones:

#### - `os.path.join(a, b)`
Une partes de una ruta absoluta usando el separador de directorios del sistema (`/` en Linux o macOS, `\` en Windows). *Se usa esto en lugar de concatenar strings manualmente*.
```python
ruta = os.path.join("usuario", "documentos", "archivo.txt")
print(ruta)

# Output
# En Linux|macOS: usuario/documentos/archivos.txt
# En Windows usuario\documentos\archivos.txt
```


#### - `os.path.exist(path)`
Devuelve `True` si la ruta existe.
```python
ruta1 = os.path.exist("Carpeta/Cosas")
ruta2 = os.path.exist("Carpeta")

print(ruta1)
print(ruta2)

# Output
# False
# True
```

#### - `os.path.isfile(path)` / `os.path.isdir(path)`
Comprueba si es un archivo o directorio respectivamente
```python
#(en la shell: ~$ touch cositas.txt)
comprovacion1 = os.path.isfile("Carpeta")
comprovacion2 = os.path.isfile("cositas.txt")
comprovacion3 = os.path.isdir("Carpeta")
comprovacion4 = os.path.isdir("cositas.txt")
print(comprovacion1)
print(comprovacion2)
print(comprovacion3)
print(comprovacion4)

# Output
# False
# True
# True
# False
```

#### - `os.path.basename(path)`
Obtiene el nombre del archivo final (ej.: de la ruta `/usr/bin/foto.png` saca `foto.png`)
```python
fichero = os.path.basename(/usr/bin/foto.png)
print(fichero)

# Output
# foto.png
```

#### - `os.path.splitext(path)`
Separa el nombre de la extensión del fichero
```python
fichero = os.path.splitexts(/usr/bin/foto.png)
print(fichero)

# Output
# ('/usr/bin/foto', '.png')r
```
