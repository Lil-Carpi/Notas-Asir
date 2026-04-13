#Python Programación Python
Proveniente de [[Índice - Python]]

---
El ***Procesamiento Secuencial de Estado*** (también conocido como "Gestión de estado" en programación imperativa) es un modelo mental para resolver problemas en donde la información va cambiando con el tiempo.
Para explicarlo mejor, lo dividiré en dos palabras clave: "Estado" y "Secuencial".

## 1. "Estado"
En programación, el estado es la memoria o fotografía del programa que estás haciendo en un milisegundo exacto. Son los valores que tienen todas las variables en un momento dado.
Imagina tu programa como si fuera una persona. Si yo pregunto: "*¿Cuál es tu estado ahora mismo?*", probablemente me dirías:
`hambre = True`, `dineroEnBolsillo = 20`, `ropa = "pijama"`. 
Ese es tu estado actual. Si te comes una manzana, tu estado cambia a `hambre = False`.

## 2. "Secuencial"
Significa que el programa lee las instrucciones de arriba hacia abajo, paso por paso, una tras otra. El tiempo avanza hacia adelante, y a medida que el programa avanza, va leyendo nueva información y usando esa información para modificar el estado.

---
Cuando juntas ambos conceptos, el procesamiento secuencial de estado significa: **Empezar con estado en blanco, analizar una serie de datos paso a paso y modificar el estado interno hasta llegar a una conclusión final**.

Más ejemplos, para que quede claro:

### Máquina expendedora
Las máquinas expendedoras son, a mi parecer, la mejor manera de explicar este concepto. Porque la máquina no puede saber que es lo que quieres desde un principio, no te leen la mente (al menos no por el momento, a excepción de un algoritmo que te conozca), sino que tú vas pasándole información de manera secuencial.

Inicialización:
- `saldo = 0.0`
- `productoSeleccionado = None`
- `listoParaEntregar = False`

Lectura secuencial:
- 1.º: Metes la moneda de 1 €. El programa detecta la moneda
	- `saldo` pasa a ser `1.0`.
- 2.º: Metes una moneda de 0.50 €.
	- `saldo` pasa a ser `1.50`.
- 3.º: Pulsas el botón "A1" (una bebida que cueste 1.50 €)
	- `productoSeleccionado` Pasa a ser `bebidaX`.

Validación:
El programa compara el estado actual con las reglas:
- *¿Tenemos producto? Sí*
- *¿El saldo (1.50) es mayor o igual al precio (1.50)? Sí*
- `listoParaEntregar = True`

Ejecución
Como `listoParaEntregar` es `True`, el motor de la máquina gira, la bebida cae y el estado se reinicia a cero para el próximo cliente.

---
Vamos a poner un ejemplo de código. Imagina que te doy un texto largo y te pido que cuentes cuántas vocales hay. Tu cerebro no puede contar 3.000 letras de un vistazo. Lo hace secuencialmente, llevando la cuenta (el estado) en tu memoria (siempre que `interrupcion = False`, si no, el estado se pierde. Hay que hablar con el desarrollador para que solucionen este bug de más de 21 siglos de antigüedad... se están tardando en la upate).

Este sería un código teniendo esto en cuenta:
```python
def contarVocales(texto):
	# 1.º Inicialización
	# preparamos estado fijo
	totalVocales = 0
	
	# 2.º Procesamiento secuencial
	# Vamos letra por letra
	for letra in texto:
		
		# 3.º Validación
		if letra in 'aeiouAEIOU':
		
			# Cambio de estado
			# Si es vocal, actualizamos la memória
			totalVocales += 1
	
	# 4.º Ejecucion/retorno
	# Se devuelve el estado final despúes de procesarlo todo
	return totalVocales

# Ejecutamos el programa
resultado = contarVocales("Hola Mundo!")
print(resultado)
```

*Obviamente, todo esto se puede complicar una barbaridad (que lo hace, porque esto son reglas aplicables a **Backend**, como APIs REST, WebSockets o Bases de Datos), pero es solo un ejemplo teórico para que se entienda bien.*