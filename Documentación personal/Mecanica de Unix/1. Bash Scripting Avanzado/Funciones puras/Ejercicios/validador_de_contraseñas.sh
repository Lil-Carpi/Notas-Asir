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

echo "Su contraseña es $resultado"
