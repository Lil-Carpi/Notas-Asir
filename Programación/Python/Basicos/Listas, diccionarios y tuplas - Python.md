#Python Programación Python
Proveniente de [[Índice - Python]]

---
### 1. Listas (`[]`)

Las listas son un tipo de dato que permite almacenar varios elementos en una variable. Es **mutable** (puedes cambiar, añadir o borrar sus elementos en caliente) y **dinámica** (crece o encoge según lo necesites). Se definen con **corchetes**.

- **Cómo se crea:**
    Python
    ```
    personajes = ["Gandalf", "Gimli", "Legolas"]
    ```
    
- **Acceso por índice (Posición):** El primer elemento siempre es el `0`.
    
    Python
    
    ```
    print(personajes[0])  # Salida: Gandalf
    ```
    
- **Operaciones críticas para el examen:**
    
    - `.append(elemento)`: Añade un objeto al final de la lista.
        
        Python
        
        ```
        personajes.append("Aragorn")  # ["Gandalf", "Gimli", "Legolas", "Aragorn"]
        ```
        
    - `len(lista)`: Te dice cuántos elementos tiene. Es vital para saber si tu consulta SQL ha devuelto filas.
        
        Python
        
        ```
        if len(personajes) > 0:
            print("Hay personajes en la lista")
        ```
        
- **Relación con la Base de Datos:** Cuando ejecutas un `cursor.fetchall()`, lo que te devuelve Python es **una lista** llena de tuplas.
    

---

### 2. Tuplas (`()`)

Las tuplas permiten almacenar varios elementos, pero son **inmutables**. Una vez que la creas, **no puedes** añadir, borrar ni modificar ningún elemento. Son mucho más rápidas de procesar en memoria que las listas. Se definen con **paréntesis**.

- **Cómo se crea:**
    
    Python
    
    ```
    atleta = (1, "Asafa Powell", "AsafaPowell@atleta.net")
    ```
    
- **La trampa de un solo elemento (Obligatoria para SQLite/MySQL):** Si quieres crear una tupla con un único dato, tienes que poner una coma al final; de lo contrario, Python piensa que es un simple paréntesis matemático.
    
    Python
    
    ```
    mi_tupla = ("Gimli",)  # BIEN: Es una tupla
    no_es_tupla = ("Gimli")  # MAL: Es un string común
    ```
    
- **Acceso por índice:** Igual que las listas.
    
    Python
    
    ```
    print(atleta[1])  # Salida: Asafa Powell
    ```
    
- **Relación con la Base de Datos:** Cada **fila** individual que recuperas con un `fetchone()` o cada elemento dentro del bucle de un `fetchall()` es **una tupla**. Representa un registro estático del disco.
    

---

### 3. Diccionarios (`{}`)

Los diccionarios almacenan información en parejas de **Clave: Valor** (_Key: Value_). No tienen un orden por posición (índice numérico); para buscar un dato, usas su clave directamente. Son mutables. Se definen con **llaves**.

- **Cómo se crea:**
    
    Python
    
    ```
    reunio = {
        "codireunio": 1,
        "nomreunio": "Miting d'Atletisme Ciutat de Barcelona",
        "lloc": "Barcelona"
    }
    ```
    
- **Acceso por Clave:** En lugar de poner un número `[0]`, pones el nombre de la clave en formato string.
    
    Python
    
    ```
    print(reunio["lloc"])  # Salida: Barcelona
    ```
    
- **Modificar o Añadir datos:**
    
    Python
    
    ```
    reunio["lloc"] = "Madrid"  # Modifica el valor existente
    reunio["pais"] = "Espanya"  # Añade una nueva pareja Clave:Valor
    ```
    
- **Relación con la Base de Datos:** Por defecto, los cursores de SQLite y MySQL devuelven tuplas. Sin embargo, puedes configurar los cursores en modo diccionario para que en vez de devolverte una fila como `(1, 'Gandalf')`, te devuelvan un objeto cómodo como `{"id": 1, "name": "Gandalf"}`.
    

---

|**Estructura**|**Sintaxis**|**¿Se puede modificar? (Mutable)**|**¿Cómo se accede a sus datos?**|**Equivalencia en Base de Datos**|
|---|---|---|---|---|
|**Lista**|`[a, b, c]`|**SÍ**|Por posición: `lista[0]`|El conjunto total de filas (`fetchall()`).|
|**Tupla**|`(a, b, c)`|**NO**|Por posición: `tupla[0]`|Una fila única o registro (`fetchone()`).|
|**Diccionario**|`{"id": 1}`|**SÍ**|Por su clave: `dicc["id"]`|Un registro mapeado por los nombres de sus columnas.|
