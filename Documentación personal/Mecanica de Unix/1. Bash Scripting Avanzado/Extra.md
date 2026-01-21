#Temario-BSA - Bash Scripting Avanzado
Proveniente de [[Índice - Mecánica Unix]]

---
## Control de flujo
---
### Condicionales `if`, `elif`, `else` y `fi`
```Shell
if [[ "$num" -gt 10 ]]; then
	echo "Mayor que 10"
elif [[ "$num" -eq 10 ]]; then
	echo "Es 10"
else
	echo "Es menor que 10"
fi
```

---

### `[[ . . . ]]`
```Shell
if [[ "$x" == "hola" && -n "$x" ]]; then
	echo "coincide"
fi
```

---

### `!` (negación)
``` Shell
if ! grep -q "hola" archivos.txt; then
	echo "no existe hola"
fi
```

---

## `case...in...esac`
```Shell
case $option in
	start) echo "iniciando";;
	stop) echo "Finalizando";;
	*) echo "Opción no válida";;
esac
```

---

## `for, in, do, done` (Bucles)
```Shell
for i in 1 2 3; do
	echo "numero $i"
done
``` 

---

## `while, until` (Bucles condicionales)
```Shell
while [[ "$x" -lt 5 ]]; do
	echo $x
	((x++))
done
```

```Shell
until [[ "$x" -eq 5 ]]; do
	echo $x
	((x++))
done
```

---

## `select` (Menú interactivo)
```Shell
select opcion in Start Stop Exit; do
	echo "Elegiste la opcion $opcion"
done
```




---
## Contador de longitud
```Shell
validador() {
	local passwd=$1
	local long=${#passwd} # Para leer longitud de un dato, se usa ${#variable}
	if [[ "$long" -gt 8 ]]; then
		echo "PWD_GT_8"
	else
		echo "PWD_LT_8"
	fi
}
```


---
### Verificación de mayúsculas, minúsculas, números y caracteres especiales

Se utiliza el comparador de valores regex (`=~`) en conjunto con los valores regex:

#### ¿Minúscula?
```Shell
[[ "Hola123" =~ [a-z] ]] # true
```

##### ¿Mayúscula?
```Shell
[[ "Hola123" =~ [A-Z] ]] # true
```

##### ¿Números?
```Shell
[[ "abc123def" =~ [0-9] ]] # true
```

###### ¿Caracteres especiales?
```Shell
[[ "asd1!213das" =~ [^a-zA-Z0-9] ]] # true
```
