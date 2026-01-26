#Python Programación Python
Proveniente de [[Índice - Python]]

---
Los bucles FOR se utilizan únicamente cuando sepamos la cantidad de veces que queramos repetir el bucle.

---
## Bucle con lista
Por ejemplo, imaginemos que tenemos una lista y queremos mostrar su contenido:
```python
lista = [21, 234, 123, 34]
```

Para hacerlo con el bucle FOR:
```python
for n in lista:
	print(n)
```
>[!output]
>21
>234
>123
>34

---
## Bucle con diccionarios
Podemos hacer bucles en los diccionarios tanto por su valor como por su ítem.
#### Por valor
```python
valores = {'primero':1, 'segundo':2, 'tercero':3}

for i in valores:
	print(i)
```
>[!Output]
>primero
>segundo
>tercero

#### Por ítem
```python
for i in valores.values():
	print(i)
```
>[!Output]
>1
>2
>3

---
También podemos hacer bucles que saque tanto los valores como los ítems a la vez:
```python
for i, k in valores.items():
	print(i, k)
```
>[!Output]
>primero 1
>segundo 2
>tercero 3

Se le puede dar formato al output así:
```python
for i, k in valores.items():
	print('string =', i, ', numero = ', k)
```
>[!Output]
>string = primero , numero = 1
>string = segundo , numero = 2
>string = tercero , numero = 3

---
## Clase Range
La clase range nos sirve para imprimir una cierta cantidad de números que le indiquemos. Podemos indicarle entre paréntesis el número máximo que debería imprimir, el número mínimo y los saltos que queremos que haga.

---
#### Números individuales
```python
for i in range(10):
	print(i)
```
>[!Output]
>0
>1
>2
>3
>4
>5
>6
>7
>8
>9

>[!Attention]
>Python empieza contando desde el `0`. Es decir, si le ponemos `10`, contará desde el `0` hasta el `9`

---
#### Desde, hasta
```python
for i in range(1, 11):
	print(i)
```
>[!Output]
>1
>2
>3
>4
>5
>6
>7
>8
>9
>10

---
#### Desde, hasta y saltos
```python
for i in range(1, 11, 2):
	print(i)
```
>[!Output]
>1
>3
>5
>7
>9

---
### Buscar un número en lista
Podemos utilizar el bucle for para encontrar contenidos en una lista:
```python
coleccion = [1, 2, 3, 4, 5, 6, 7, 8, 9]

for e in coleccion:
	if e == 3:
		print(e)
		print("found")
```
>[!Output]
>3
>found

Podemos hacer lo mismo para buscar números pares:
```python
for e in coleccion:
	if e % 2 != 1:
		print(e)
```
>[!Output]
>2
>4
>6
>8

O con números impares (Solo cambia el `!= 1` por `!= 0`)

---
## for...else
Podemos también utilizar excepciones en caso de que no exista el valor en la lista que buscamos (en este caso. También sirve para otras cosas) con el complemento `else`:
```python
numeros = [1, 2, 3, 4, 5, 6, 7]
for i in numeros:
	if i == 5:
	print(i)
	print("found")
	break
else:
	print("not found")
```
>[!Output]
>5
>found
