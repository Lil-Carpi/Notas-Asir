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
- 