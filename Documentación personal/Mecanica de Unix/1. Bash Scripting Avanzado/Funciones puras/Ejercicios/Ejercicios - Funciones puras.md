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
```

Bibliografía Web:
- [Conversión de mayúsculas a minúsculas](https://es.stackoverflow.com/questions/346567/cómo-convierto-un-texto-a-mayúsculas-o-minúsculas-en-bash-zsh-o-osx)
- 