#Python Programación Python
Proveniente de [[Índice - Python]]

---
En Python, siempre que ejecutemos algo, tendremos un dunder escondido llamado `__name__`.
Python asigna un valor a ese dunder dependiendo de como se ejecute o importe el fichero:

- ***Ejecucion directa***: (python3 programa.py). En este caso, se asigna `__name__ = "__main__"`, ya que es el que se esta ejecutando directamente
- ***Importar un fichero***: (`import programa`). En este caso, Python detecta que es una herramienta de otro lado y que no es el programa principal. En este caso se asigna `__name__ = "programa"`.

---
## Ejemplo
Tenemos esta calculadora de otros ejemplos anteriores:
```python
def suma(n1, n2):
    """
        Funcion suma.
        Hace el calculo de suma con las variables que se le indique
        como argumento.

        Args:
	        n1 (int) = primer argumento
	        n2 (int) = segundo argumento

		Returns:
	        Devuelve la suma de los argumentos.
        """
    suma = n1 + n2
    print(f"Resultado: {suma}")


if __name__ == "__main__": # Aqui usamos el __main__
    n1 = int(input("introduce el primer numero: "))
    n2 = int(input("introduce el segundo numero: "))
    suma(n1, n2)
else:
    print("Importado correctamente")
    print("Funciones disponibles:")
    print("- suma()")
    print("Para mas info, ejecute help(funcion)")
```

En este caso, si el fichero se ejecuta directamente (`python3 suma.py`):
>[!output (__main__)]
```python
introduce el primer numero: 3 # Al ser main, pide numeros
introduce el segundo numero: 3
Resultado: 6
```

En caso de que sea importado:
>[!Output (import)]
```python
>>> import suma
Importado correctamente
Funciones disponibles:
- suma()
Para mas info, ejecute help(funcion)
```
>[!Attention]
>Normalmente queremos que las importaciones sean silenciosas, asi que muchas veces es innecesario incluso contraproducente poner un mensaje de aviso de importacion correcta.