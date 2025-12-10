#SQL-ASIX - Structure Query Language
Proveniente de [[SQL]]

---
SQL maneja varios tipos de datos. Estos tipos de datos se diferencian para la introduccion de datos en especifico, datos con cierta cantidad de letras o numeros, o un numero especifico de caracteres.

Algunos de los tipos de datos basicos de SQL son:

## Numeros enteros:
- **TINYINT(Tamaño)**: -128 a 127 normal. 0 a 255 sin signo. La cantidad maxima de digitos se puede especificar entre parentesis.
- **SMALLINT(Tamaño)**: -32768 a 32767 normal. 0 a 65535 sin signo. La cantidad maxima de digitos se pueden especificar entre parentesis.
- **MEDIUMINT(Tamaño)**: -8388608 a 8388607 normal. 0 a 16777215 sin signo. La cantidad maxima de digitos se pueden especificar entre parentesis.
- **INT(Tamaño)**: -2147483648 a 2147483647 normal. 0 a 4294967295 sin signo. La cantidad maxima de digitos se pueden especificar entre parentesis.
- **BIGINT(Tamaño)**: -9223372036854775808 a 9223372036854775807 normal. 0 a 18446744073709551615 sin signo. La cantidad maxima de digitos se pueden especificar entre parentesis.

## Numeros en punto flotante
- **FLOAT(tamaño, d)**: Un pequeño numero con un punto decimal flotante. La cantidad maxima de digitos puede especificar en el parametro de tamaño. El numero maximo de digitos a la derecha del punto decimal se especifica en el parametro d.
- **DECIMAL(tamaño, d)**: Un DOBLE almacenado como una cadena, lo que permite un punto decimal fijo. La cantidad maxima de digitos se puede especificar en el parametro de tamaño. El numero maximo de digitos a la derecha del punto decimal se especifica en el parametro d.

## Fechas y tiempos
- **DATE ()**: Una fecha. Formato: AAAA-MM-DD. 
- **DATETIME ()**: Una combinacion de fecha y hora. Formato: AAAA-MM-DD HH:MI:SS.
- **TIMESTAMP ()**: Una marca de tiempo. Los valores de TIMESTAMP se almacenan como el numero de segundos desde la epoca de UNIX ('1970-01-01 00:00:00' UTC). Formato: AAAA-MM-DD HH:MI:SS.
- **TIME ()**: Un tiempo. Formato: HH:MI:SS.
- **YEAR ()**: Un año en formato de dos o cuatro digitos. 

> [!bug] Nota
> Para DATE, El rango admitido es de '1000-01-01' a '9999-12-31'.
> Para DATETIME, el rango admitido es de '1000-01-01 00:00:00' a '9999-12-31 23:59:59'
> Para TIMESTAMP, el rango admitido es de '1970-01-01 00:00:01' UTC a '2038-01-09 03:14:07' UTC.
> Para TIME, el rango admitido es de '-838:59:59' a '838:59:59'
> Para YEAR, los valores permitidos van en 4 digitos: de 1901 a 2155. Valores permitidos en formato de dos digitos: 70 a 69, que representan los años de 1970 a 2069.


## Cadena de caracteres:
- **CHAR (Tamaño)**: Cadena de longitud fija (puede contener letras, numeros y caracteres especiales), El tamaño fijo se especifica entre parentesis. Puede almacenar hasta 255 caracteres.
- **VARCHAR(Tamaño)**: Tiene una cadena de longitud variable (puede contener letras, numeros y caracteres especiales). El tamaño maximo se especifica entre parentesis. Puede almacenar hasta 255 caracteres.
- **TINYTEXT**: Tiene una cadena con una longitud maxima de 255 caracteres
- **TEXTO**: Tiene una cadena con una longitud maxima de 65535 caracteres.
- **BLOB**: Para BLOB (Objetos grandes binarios). Almacena hasta 65535 bytes de datos.
- **MEDIUMTEXT**: Tiene una cadena con una longitud maxima de 16777215 caracteres.
- **MEDIUMBLOB**: Para BLOB (Objetos grandes binarios). Puede almacenar 16777215 bytes de datos.
- **LONGTEXT**: Tiene una cadena con una longitud maxima de 4294967295 caracteres.
- **LONGBLOB**: Para BLOB (Objetos grandes binarios). Tiene una capacidad para 4294967295 bytes de datos.

>[!bug]
> Nota: Si, en VARCHAR, agregas un valor mas grande que 255, este se convertira en tipo TEXTO.

## ENUM y SET
- **Enum (x, y, z, etc.)**: Permite ingresar una lista de valores posibles. Puede enumerar hasta 65535 valores en una lista ENUM. Si se inserta un valor que no esta en la lista, se insertará un valor en blanco.
- **Set**: Similar a Enum, excepto que SET puede contener hasta 64 elementos de una lista y puede almacenar mas de opcion

## Binarios:
- **bit** Entero que puede ser 0, 1 o NULL.

