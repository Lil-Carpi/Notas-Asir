#!/bin/bash
suma() {
    local num1=$1
    local num2=$2
    local resultado=$(( $num1 + $num2))
    echo $(( $1 + $2))
}

resta() {
    local num1=$1
    local num2=$2
    local resultado=$(( $num1 - $num2))
    echo $(( $1 - $2))
}

multiplicacion() {
    local num1=$1
    local num2=$2
    local resultado=$(( $num1 * $num2))
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