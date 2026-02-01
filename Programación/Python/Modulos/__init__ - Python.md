#Python Programación Python
Proveniente de [[Índice - Python]]

---

El Dunder `__init__` es un caso especial, porque no solo nos sirve como método, sino también como fichero. En su formato fichero, este indica a Python que el directorio en donde se encuentra es un paquete.

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
Gracias al init, en `main.py` ahora podemos hacer `from utilidades import calculos`

