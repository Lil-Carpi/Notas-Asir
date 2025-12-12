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
    if [["$passwd" =~ [A-Z] ]]; then
        echo "MAYLETTERS"
    else
        echo "NO_MAYLETTERS"
    fi
}



read -p "Introduce una contraseña: " a

resultado=$(longitud "$a")

echo "$resultado"
