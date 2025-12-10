#!/bin/bash

echo "Opciones posibles:"
echo "1. Sumar"
echo "2. Restar"
echo "3. Multiplicacion"
echo "4. Division"
read input
case $input in
    1) $suma;;
    2) $resta;;
    3) $multiplicacion;;
    4) $division;;
esac


suma() {
    local num1=$1
    local num2=$2
    echo $(( $1 + $2))
}

resta() {
    local num1=$1
    local num2=$2
    echo $(( $1 - $2))
}

multiplicacion() {
    local num1=$1
    local num2=$2
    echo $(( $1 * $2))
}

division() {
    local num1=$1
    local num2=$2
    if [[ "$2" -eq 0 ]]; then
        echo "ERROR_DIV_0"
        return 1
    fi
    echo $(( $1 / $2))
}

