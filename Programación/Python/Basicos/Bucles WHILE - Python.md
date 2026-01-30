#Python Programación Python
Proveniente de [[Índice - Python]]

---
Los bucles WHILE se utilizan cuando se cumpla una condicion. Por ejemplo, ejecuta X mientras Y sea `True`.

---
## Ejemplo días de la semana:
```python
dia = 0
semana = ["Lunes","Martes","Miércoles","Jueves","Viernes","Sábado","Domingo"]
while dia < 7:
	print("Hoy es" semana[dia])
	dia += 1
```
>[!Output]
>Hoy es Lunes
>Hoy es Martes
>Hoy es Miércoles
>Hoy es Jueves
>Hoy es Viernes
>Hoy es Sábado
>Hoy es Domingo

---
## Ejemplo menú
```python
print(".::Menu::.")
print("1. Hace algo")
print("2. Salir")

menuStatus = True
while menuStatus == True:
    menuSeleccion = int(input("Introduce una opcion \n > "))
    match menuSeleccion:
        case 1:
            print("Ejecutando algo")
        case 2:
            print("Adios")
            menuStatus = False
```
>[!Output]
>.::Menu::.
>1. Hacer algo
>2. Salir
>Introduce una opcion
>1
>Ejecutando algo
>2
>Adios


