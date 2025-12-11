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







