#Temario-BSA - Bash Scripting Avanzado
Proveniente de [[Mecánica Unix - Manejo de la shell]]

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