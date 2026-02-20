#Python Programación Python
Proveniente de [[Shutil - Índice · Python]], [[Índice - Python]]

---
Mientras que `OS` maneja operaciones de bajo nivel, `shutil` se encarga de las operaciones de alto nivel con archivos, como copiar, mover o archivar. Es como las acciones que se harían con el ratón en el explorador de archivos.

## `shutil.copy(src, dst)`
Copia un archivo, con datos y permisos incluidos:
```python
shutil.copy("datos.csv", "datos_backup.csv")
```

---
## `shutil.copy2(src, dst)`
Igual que el anterior, copia un archivo, con datos, permisos y metadatos incluidos:
```python
shutil.copy2("datos.csv", "datos_backup.csv")
```

---
## `shutil.move(src, dst)`
Mueve o renombra archivos o directorios:
```python
shutil.move("datos_backup.csv", "datos_dia12.csv")
shutil.move("/var/www/web", "/home/carpi")
```

---
## `shutil.rmtree(path)`
Borra un directorio completo de forma recursiva.
```python
shutil.rmtree("/home/carpi/carpetaConBasura")
```

---
## `shutil.make_archive()`
Crea archivos ZIP o TAR comprimidos
```python
shutil.make_archive("datos_dia12.csv", 'zip', "datos12comprimido")

# Output
# datos12comprimido.zip
```
