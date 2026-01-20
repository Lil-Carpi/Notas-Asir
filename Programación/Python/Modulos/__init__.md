#Python Programación Python
Proveniente de [[Índice - Python]]

---
`__init__.py` Es un fichero de Python que indica al intérprete que el directorio en el que se encuentra lo conforman ficheros importables como módulos, es decir: Todo lo que se encuentre en este directorio contiene módulos.

---
## Ejemplo de uso
Imagina que tenemos esta pila de ficheros:
``` ini
.
├── app
│   └── app.py
└── modulos
    ├── geometria.py
    └── __init__.py
```

Podemos ver que tenemos el directorio `/modulos/`, en el cual se encuentra el fichero de geometria.py, que contiene:
```python
def cuadrado():
    base = int(input("Introduzca la base: "))
    altura = int(input("Introduce la altura: "))
    print(f"El area del cuadrado es {base*altura/2}")
# Bastante simple
```

Tambien, tenemos el fichero `__init__.py`, que indica que todo lo que se encuentre dentro del directorio de modulos, contiene ficheros con modulos importables.

En `/app/`, tenemos un fichero en el cual debemos importar los modulos que se encuentran en el directorio `/modulos/`, se ve asi:

