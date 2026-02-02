#Python Programación Python
Proveniente de [[Índice - Python]]

---
La sentencia match sirve para hacer comparaciones entre variables y una serie de casos (ya sea un str, int. float o bool) y de ahí dar una acción que se le asigne a cada caso. Puede simplificar algunos casos el uso de multiples [[Sentencia IF, ELIF y ELSE - Python|if, elif y else]] en un código.

Los usos más comunes se dan en momentos de multiselección, como por ejemplo un menú

---
## Ejemplo
Supongamos que tenemos que hacer un menú que pide al usuario que seleccione entre múltiples opciones. Esta selección ha de ejecutar sus respectivas funciones.

En este caso, al finalizar de ejecutar la función que el usuario pide, se vuelve a la selección:
```python
def caso1():
	#codigo...
	pass
def caso2():
	#codigo...
	pass

def menu():
	print(".::Menu::.")
	print("1. Funcion1")
	print("2. Funcion2")
	print("3. Salir")
	seleccion = int(input("Seleccione una de las opciones n\> "))
	match seleccion:
		case 1:
			caso1()
			return menu()
		case 2:
			caso2()
			return menu()
		case 3:
			print("Adiós...")

menu()
```
>[!note]
>Conviene agregar un manejo de errores para evitar que se ingresen otros datos que no sean integer, como el [[try, except - Python|try, except]].

Al match, se le pasa la variable a comparar, en este caso es selección, que pide al usuario que seleccione una de las opciones.
Luego, se compara cada caso con el valor `case`. En los casos 1 y 2, se hace un return del bucle que almacena el menú para que este se vuelva a ejecutar una vez terminado la función seleccionada.