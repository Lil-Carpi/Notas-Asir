#PHP - Programación PHP
Proveniente de [[Índice - PHP]]

---
La sintaxis en PHP es simple, pero algo extensa. Empecemos por lo básico.

Para escribir código PHP, podemos hacerlo en 2 ficheros, o en los ficheros HTML o en los ficheros PHP. En ambos casos, el código siempre irá dentro de unas etiquetas especiales. Todo lo que este dentro de esa etiqueta será procesado como programación, y lo que está fuera va a ser ignorado por el motor de PHP, normalmente se interpreta como HTML normal:
```PHP
<?php
// El codigo va aqui dentro.
?>
```

### Tipos de datos
En PHP se soportan varios tipos de datos:
```PHP
<?php
$numero = 1;
$decimal = 3.14;
$cadena = "esto es una cadena";
$Falsedades = false;
$vacio = null;
?>
```
PHP es un lenguaje de tipado debil, es decir, que podemos cambiar el tipo de dato con el cual fue creado una variable. Basicamente, si creo una variable que contiene un string, puedo cambiarlo por un booleano:
```PHP
<?php
$numero = 1;
$decimal = 3.14;
$cadena = "esto es una cadena";
$Falsedades = false;
$vacio = null;

$numero = "1";
echo gettype($numero); 
// Output: string
?>
```
>[!note]
>`gettype` permite saber que tipo de datos se encuentra en la variable que se le pase.

También, podemos obligar a comportamientos de otro tipo de dato al que ya es. Por ejemplo:

```PHP
<?php
$numero = 1;
$decimal = 3.14;
$cadena = "esto es una cadena";
$Falsedades = false;
$vacio = null;

$numero = "1";
echo gettype($numero); 
// Output: integer
?>
```

## "Hola mundo"
La instruccion mas comun para mostrar texto, numeros o codigo HTML en la pantalla es `echo`.
```PHP
<?php
echo "Hola, mundo!";
?>
```
>[!Attention]
>Ves el `;` que se encuentra al final del `echo`? En PHP, todas las uinstrucciones logicas deben terminar con punto y coma.   


### Concatenaciones
Para hacer las concatenaciones en PHP, se utiliza el `.`:
```PHP
<?php
$edad = 30;
$nombre = "Ana";
echo "Mi nombre es". $nombre ."y tengo". $edad ."años";
?>
```

También, podemos simplemente no utilizar el punto para la concatenación utilizando `echo`:
```PHP
<?php
$edad = 30;
$nombre = "Ana";
echo "Mi nombre es $nombre y tengo $edad años";
?>
```
