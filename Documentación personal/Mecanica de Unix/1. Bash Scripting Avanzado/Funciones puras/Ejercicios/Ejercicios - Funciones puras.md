#Temario-BSA - Bash Scripting Avanzado
Proveniente de [[Funciones puras]]

---

# 1. Calculadora modular
Objetivo: Separación de lógica (pura) del I/O (impuro).

```Shell
#!/bin/bash
#Funciones Puras
suma() {
local num1=$1
local num2=$2
echo $(( $num1 + $num2 ))
}

resta() {
local num1=$1
local num2=$2
echo $(( $num1 - $num2 ))
}

multiplicacion() {
local num1=$1
local num2=$2
echo $(( $num1 * $num2 ))
}

division() {
local num1=$1
local num2=$2
if [[ "$num2" -eq 0 ]]; then
	echo "ERROR_DIV_0"
	return 1
fi
echo $(( $num1 / $num2 ))
}

#Menu

echo "Opciones posibles:"
echo "1. Sumar"
echo "2. Restar"
echo "3. Multiplicacion"
echo "4. Division"
read input
read -p "Introduce el primer numero: " a
read -p "Introduce el segundo numero: " b

case $input in
1) resultado=$(suma "$a" "$b");;
2) resultado=$(resta "$a" "$b");;
3) resultado=$(multiplicacion "$a" "$b");;
4) resultado=$(division "$a" "$b")
if [[ $b -eq 0 ]]; then
	echo "No se puede dividir entre 0"
	exit 1
fi;;
*)
	echo "no valido"
	exit 1;;
esac

echo "Resultado = $resultado"
```

Bibliografía Web:
- [Manejo de errores en Bash Scripting](https://adictosalinux.com/manejo-errores-scripts-bash/)
- [Comparator operators](https://www.tutorialkart.com/bash-shell-scripting/bash-comparison-operators/)
- [Funciones Bash](https://itsfoss.com/es/funciones-bash/)

---

# 2. Validador de contraseñas
Entrada: Una contraseña.
Objetivo: Que detecte la longitud y cantidad de caracteres especiales y dará el diagnóstico `weak`, `mid` y `strong`.

```Shell
#!/bin/bash
# Funciones Puras
# En caso de muchos condicionales
# Recurrir a negaciones
longitud() {
    local passwd=$1
    local long=${#passwd}
    if [[ "$long" -gt 8 ]]; then
        echo "PWD_GT_8"
    else
        echo "PWD_LT_8"
    fi
}
minusculas() {
    local passwd=$1
    if [[ "$passwd" =~ [a-z] ]]; then
        echo "MINLETTERS"
    else
        echo "NO_MINLETTERS"
    fi
}
mayusculas () {
    local passwd=$1
    if [[ "$passwd" =~ [A-Z] ]]; then
        echo "MAYLETTERS"
    else
        echo "NO_MAYLETTERS"
    fi
}
numeros () {
    local passwd=$1
    if [[ "$passwd" =~ [0-9] ]]; then
	echo "NUMBERS"
    else
	echo "NO_NUMBERS"
    fi
}
caracteresE () {
    local passwd=$1
    if [[ "$passwd" =~ [^a-zA-Z0-9] ]]; then #Caso curioso: Se recurre a la negacion, ya que si existe un
	    				    #caracter especial, este no estará en las tablas de mayuscula, minuscula ni numeros.
	  echo "ECARACTERS"
    else
	  echo "NO_ECARACTERS"
    fi
}
validador () {
    local passwd=$1
    local long=$(longitud "$passwd") 
    local min=$(minusculas "$passwd")
    local may=$(mayusculas "$passwd")
    local num=$(numeros "$passwd")
    local carE=$(caracteresE "$passwd")
    res=("$long" "$min" "$may" "$num" "$carE")
    local puntuacion=0
    local totcriterios=5

    for i in "${res[@]}"; do
	  if [[ $i = "PWD_GT_8" || $i = "MINLETTERS" || $i = "MAYLETTERS" || $i = "NUMBERS" || $i = "ECARACTERS" ]]; then
		  ((puntuacion++)) # Esto tiene un error de sintaxis aritmetica: Se esperaba un operando (el elemento de error es "+"). El error sale cuando no se introduce uno de los valores anteriores, como por ejemplo, no poner ningun simbolo.
		  #Update: EUREKA! Al poner $, bash expande el valor antes de la operacion aritmetica.
		  #Si la puntuacion vale 0, bash intenta ejecutar ((0++)).
	  fi
    done    
    ((porcentaje=puntuacion * 100 / totcriterios))
    if [[ "$porcentaje" -lt 41 ]]; then 
	echo "Weak"
    elif [[ "$porcentaje" -lt 71 ]]; then
	echo "Mid"
    else
	echo "Strong"
    fi
}

read -p "Introduce una contraseña: " a
resultado=$(validador "$a" )

```

Bibliografía Web:
- [Conversión de mayúsculas a minúsculas](https://es.stackoverflow.com/questions/346567/cómo-convierto-un-texto-a-mayúsculas-o-minúsculas-en-bash-zsh-o-osx)
- [Using && and || in bash](https://kyleshevlin.com/using-and-and-or-in-bash-scripts/)
- [Bash operators](https://www.w3schools.com/bash/bash_operators.php)


# 3. Normalizador de nombres de archivos
---
Objetivo: Tener un nombre de archivo asqueroso y limpiarlo.
##### Ejemplo de entradas:
```Shell
"   Hola   Mundo.txt"
"Mi fichero (copia) (1).png"
```

- `normalizar_nombre` - Elimina espacios extra, pasa a minúsculas, reemplazo de espacios con `_`.

# 4. Parser de configuración estilo .ini
---
Objetivo: Procesar una línea. No se toca ficheros en la función pura.
##### Funciones puras:
- `es_comentario`
- `es_seccion`
- `obtener_clave`
- `obtener_valor`
##### Parte impura:
- Leer el archivo línea por línea
- Imprimir errores o configuraciones

Se entrena el patron: *la funcion pura opera en una linea, la impura itera por el fichero*.

# 5. Mini motor de templates
---
Objetivo: Reemplazo de variables del estilo:
```Shell
Hola {{NOMBRE}}
```
##### Funcion pura
- `renderizar_template "$template" "$nombre"`
Debe sustituir `{{NOMBRE}}` por el valor que le pasas.
##### Parte impura:
- Leer `.template`
- Guardar la salida en un fichero final.

Es composicion pura de texto, sin tocar nada externo.

# 6. Filtro de logs
---
Objetivo: Se procesa cada linea para extraer informacion util
##### Funciones puras
- `es_error`
- `extraer_fecha`
- `extraer_mensaje`
- `formato_limpio`
##### Parte impura
- Leer fichero de log gigante
- Guardar resultados filtrados

Procesamiento funcional de toda la vida. Muy util.

# 7. Comparador de versiones
---
Ejemplo:
```Shell
compare_versions "1.2.10" "1.3.1"
```
##### Salida pura:
- `-1` si v1 < `v2`
- `0` si iguales
- `1` si `v1` > `v2`
##### Parte impura
- Nada mas que capturar valores y mostrar los resultados.

Perfecto para practicar manejo de arrays y logica sin tocar sistema.

# 8. Generador de checksums "puro"
---
No se calcula archivos, solo texto.
##### Funciones puras
- `checksum_simple "$texto"` - Ejemplo: suma ASCII mod 10000
- `hash_basico "$texto"`
##### Parte impura
- Leer ficheros desde disco
- Pasar su contenido a la parte pura

Obliga a pensar que es pureza y que no.

# 9. Conversor de fecha
---
Convierte formatos
Entrada:
```shell
2025-12-10
```
Salida de funcion pura:
```shell
10/12/2025
```
##### Impuro
Nada fuera de imprimir resultados

Es un ejemplo simple para disciplina.


# 10. Mini-linter para Bash
---
Suena más grande de lo que es.
##### Funcion pura
- `analizar_linea "$linea"` - Devuelve etiquetas como `"echo esta mal"`, `"mal identado"`, `"ok"`.
###### Funcion impura
- Leer archivo `.sh`
- Contar errores
- Mostrar resumen

Mola detectar mierda en los scripts. Tambien fuerza a separar analisis puro de acciones impuras.