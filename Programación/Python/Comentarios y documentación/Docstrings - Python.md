#Python Programación Python
Proveniente de [[Índice - Python]]

---
Los Docstrings son strings literales especiales que sirven para la documentación de, normalmente, funciones. 

Además de la documentación, pueden indicar la forma del funcionamiento de la función, como los argumentos a pasar.

---
## Utilidad
Como he indicado antes, los docstrings sirven principalmente para documentación y como instrucciones. No son ejecutados por el intérprete, pero no se ignoran y se espera a una instrucción específica llamada [[__doc__ - Python|__doc__]], o al pedir ayuda y, como argumento, la función.

---
## Formatos
### Docstrings de funciones
Describen el propósito de una función, sus argumentos y lo que devuelve.
#### Ejemplo
Función de suma, que suma los dos argumentos que se le pase.
También está integrado la función mágica [[__main__ - Python |__main__]].

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

También es posible utilizar la función mágica [[__doc__ - Python|__doc__]] para imprimir los doctrinas de la siguiente manera:
>[!Output print(suma.__doc__)]
```python

Funcion suma.
Hace el calculo de suma con las variables que se le indique
como argumento.

Args:
        n1 (int) = primer argumento
        n2 (int) = segundo argumento

        Returns:
        Devuelve la suma de los argumentos.

```
---
### Docstrings de Módulos
Describen el módulo en general y se colocan al principio del archivo del módulo.

#### Ejemplo:
```python
"""
Módulo de operaciones matemáticas.

Este módulo proporciona funciones básicas para realizar operaciones matemáticas como suma, resta, multiplicación y división.

Funciones:
- suma(a, b): Devuelve la suma de a y b.
- resta(a, b): Devuelve la resta de b de a.
- multiplicar(a, b): Devuelve el producto de a y b.
- dividir(a, b): Devuelve la división de a entre b.
"""

def suma(a, b):
## ...
## aqui el resto del código del módulo
```
---
#### Docstrings de Clases
Describen el proposito de una clase, sus metodos y atributos.
```python
class Coche:
    """
    Representa un coche.
    
    Atributos:
    marca (str): La marca del coche.
    modelo (str): El modelo del coche.
    """

## ...
## aqui el resto del código de la clase
```

---
## Generar documentación a partir de Docstrings
Existen herramientas como Sphinx y Doxygen que pueden generar documentación HTML y otros formatos a partir de docstrings, lo que facilita hacer los documentos de documentación.

Para más información, véase [[Sphinx y Doxygen - Python]]
![[Sphinx y Doxygen - Python]]