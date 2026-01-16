#Python Programación Python
Proveniente de [[Python]]

---
Los Docstrings son strings literales especiales que sirven para la documentación de, normalmente, funciones. 

Además de la documentación, pueden indicar la forma del funcionamiento de la función, como los argumentos a pasar.

---
## Utilidad
Como he indicado antes, los docstrings sirven principalmente para documentación y como instrucciones. No son ejecutados por el intérprete, pero no se ignoran y se espera a una instrucción específica llamada `__doc__`, o al pedir ayuda y, como argumento, la función.

---
## Formatos







---
### Ejemplo
Función de suma, que suma los dos argumentos que se le pase.

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


if __name__ == "__main__":
    n1 = int(input("introduce el primer numero: "))
    n2 = int(input("introduce el segundo numero: "))
    suma(n1, n2)
else:
    print("Importado correctamente")
    print("Funciones disponibles:")
    print("- suma()")
    print("Para mas info, ejecute help(funcion)")
```

>[!output (__main__)]
```python
introduce el primer numero: 3
introduce el segundo numero: 3
Resultado: 6
```

>[!Output (import)]
```python
>>> import suma
Importado correctamente
Funciones disponibles:
- suma()
Para mas info, ejecute help(funcion)
```

>[!output (help(suma))]
``` Python
Help on module suma:

NAME
    suma

FUNCTIONS
    suma(n1, n2)
        Funcion suma.
        Hace el calculo de suma con las variables que se le indique
        como argumento.

        Args:
	        n1 (int) = primer argumento
	        n2 (int) = segundo argumento

		Returns:
			Devuelve la suma de los argumentos.

FILE
    /home/carpi/suma.py

```