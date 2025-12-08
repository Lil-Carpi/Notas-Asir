#Temario-BSA - Bash Scripting Avanzado

---
## ¿Qué es una "Función Pura"?
En programación, el concepto de la programación pura es aquella función que no cause efectos secundarios en el programa, cuyas funciones estén aisladas del resto del programa y no afecten a nada más que a lo que se le pide que haga.

### Un ejemplo de una "Función Impura":
```SHELL
contador=0 # Esto es un estado global

incrementar() {
	#Efecto secundario: Se esta modificando una variable externa
	contador=$((contador + 1))
}

incrementar
echo $contador # imprimirá 1
incrementar
echo $contador # imprimirá 2 (¡El resultado cambió sin cambiar imputs!)
```
Esta función depende de una variable global y la modifica. Si la ejecutas dos veces, el resultado cambia aunque no le pases argumentos.

### Un ejemplo de una "Función Pura":
```SHELL
sumar() {
	# 1. Se usa 'local' para aislar variables del resto del script
	local num1=$1
	local num2=$2
	
	local resultado=$((num1 + num2))
	
	# 2. 'Devolver' el valor por salida estándar (stdout)
	echo "$resultado"
}

# Uso: Capturamos la salida
total=$(sumar 10 5)
echo "El total es: $total"
```
Esta función es aislada. Recibe datos, calcula y "devuelve" el dato imprimiéndolo (stdout), sin tocar nada más.
