#Temario-BSA - Bash Scripting Avanzado
Proveniente de [[Mecánica Unix - Manejo de la shell]]

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

### Ejemplo avanzado:
Procesamiento de texto puro
```Shell
trim_string() {
	local input="$1"
	# Elimina espacios al inicio y al final
	sed 's/^[[:space:]]*//;s/[[:space:]]*$//' <<< "$input"
	# Sed modifica streams, pero no toca el sistema, por ende, es válido.
	# Es válido porque opera sobre datos y no modifica el sistema.
	# En Bash, un comando externo sigue siendo "puro" mientras:
	# - "No escriba en ficheros"
	# - "No cambie el entorno"
	# - "No tenga efectos secundarios"
	
	# Usar comandos externos != impuro
}

texto_sucio="    Hola Mundo    "
texto_limpio=$(trim_string "$texto_sucio")

echo "'$texto_sucio' -> '$texto_limpio'"
```
Aquí una función que limpia un string (quita espacios extra). Nota cómo no toca ningún archivo ni variable externa.


---
# El problema de BASH:
Es posible aplicar funciones puras a bash, pero el problema es que bash está pensado para tener efectos secundarios, como la modificación de ficheros y directorios (I/O). Así que es imposible tener un script de bash que tenga solo funciones puras, a no ser que su propósito no sea modificar ningún fichero ni directorio. Es decir, si tienes una función que se llama `crear_carpeta_local()`, ten por seguro de que será una función impura.

En Bash, es muy fácil romper la pureza, porque está orientado a efectos secundarios.
El motivo:
- Usa subshells
- Depende del entorno
- Depende del estado del sistema
- Incluso `echo`, en algunos casos mal utilizados, puede dar impureza al código por dar un valor que la función base no debe devolver. `echo` es aceptable en funciones puras siempre que imprima **únicamente** el valor que la función devuelve. Cualquier salida extra rompe la pureza.

>*Una "Función Pura" es solo un modelo conceptual: Una función que **se comporta como pura**, aunque en la práctica nunca es 100% pura.*



Es innecesario e incluso contraproducente intentar que *todo* sea puro en Bash. Hay que aplicar pureza **solo a funciones que procesan datos**.

---
# Reglas de purificación
Esto empieza a sonar como culto religioso. 

Si quieres hacer funciones puras en bash, asegúrate de seguir estas reglas:
1. Usa siempre `local`.
	Por defecto, todas las variables son globales. Si defines `i=1` dentro de una función, estás cambiando `i` en todo el script.
	- **Regla**: Declara cada variable interna con local (o `declare -n` para referencias).

2. **Entradas solo por argumentos (`$1`, `$2`...)**
	 Nunca, NUNCA leas una variable global dentro de una función.
	  Si la función necesita un dato, pásalo como parámetro.
	 - *Mal*: `echo $USUARIO_GLOBAL`
	 - *Bien*: `local usuario=$1`
	 

3. **Salidas por `stdout` (echo/printf)**
	 No asignes el resultado a una variable global. Imprímelo. Quien llame a la función va a capturar ese valor usando *command substitution* `var=$(mi_funcion).
	 - *Nota*: Usa `return` solo para indicar éxito (0) o error (no-0), no para devolver data.

4. **No escribas en stdout si la función se usa como "función pura interna"**.
	 Me explico; Si la función forma parte de un pipeline complejo, imprimir cosas rompe la composición.

	 Ejemplo de lo que NO se debe hacer:
	 ```Shell
	 sumar() {
		 echo "$(( $1 + $2 ))"
		 echo "Suma completada" # Esto lo caga todo.
	 }
	 ```
	 El problema no es imprimir como tal.
	 El problema es imprimir *cualquier cosa que no sea el valor* que la función debe devolver.

	 Es decir:
	 - **Pura**: Imprime SOLO el resultado.
	 - **Impura**: Imprime logs, mensajes, basura, colores, etc.

---
# El porqué de todo esto
Tal vez pienses que es más trabajo, pero los beneficios son enormes:
1. **La depuración es más sencilla**: Si algo, por alguna razón, falla, sabes que el error está *dentro* de ella o en los argumentos que recibió. No tienes que rastrear variables globales por todo el fichero.
2. **Reutilización**: Puedes hacer *copy-paste* de una función pura en otro script y funcionará inmediatamente sin romper nada (en la gran mayoría de casos).
3. **Seguridad**: Evita las colisiones de nombres de variables (el típico error donde dos bucles usan la variable `i` y uno rompe al otro).
