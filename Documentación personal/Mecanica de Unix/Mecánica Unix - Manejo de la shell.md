En este apartado, me dedico a aprender todo lo que tiene que ver con la terminal. Pondré obviamente apuntes sobre lo que ya sé y sobre lo que no. 

# Lo que voy a apuntar va a ser:

---
### 1. Bash Scripting Avanzado
Aquí no se va a tratar solo de escribir scripts, sino de:
- [[Funciones puras]]
- Patrones de diseño en bash
- Trampas (`traps`)
- Señales
- Expansión de parámetros
- Arrays asociativos
- Subshells
- Procesos hijos y paralelismo (`&`, `wait`, `coproc`)
- Seguridad en scripts (validación, sanitización, quoting correcto)
*Y esto aporta:*
	**Automatización de sistemas enteros y escritura de pipelines complejos.**

---
### 2. awk/sed/grep a nivel serio
- Parsing avanzado de logs
- Extracción de datos estructurados
- Reescritura de texto
- Creación de mini-lenguajes personalizados
- Manipulación de CSV, JSON simplificado, logs de sistemas
*Y esto aporta:*
	Con awk, puedo literalmente escribir programas completos.
	Podría hacer un analizador sintáctico, un intérprete simple o un procesador de logs en tiempo real.

---

### 3. Señales, pipes. TTYs y pseudoterminales
- Funcionamiento de una terminal
- Comunicacion entre procesos
- Que pasa por debajo de un pipe
- Funcionamiento de los PTY con `except`, `script`, `ssh`, `tmux`
- Control de procesos con señales (`SIGINT`, `SIGTERM`, `SIGHUP`)
- Capturar e interpretar señales de scripts propios
*Y esto aporta:*
	**Entendimiento de Linux desde dentro.**

---

### 4. ncurses
- Creación de interfaces interactivas
- Menús
- Ventanas
- Teclas especiales
- Actualización dinámica de pantalla sin flickering
*Y esto aporta:*
	Podría crear programas como `htop`, mini editor de texto... Hasta un navegador interactivo que imprima HTML parseado (esto es sadomasoquismo, pero lo voy a hacer igualmente).

---

### 5. Procesamiento de ficheros MUY grandes
- Streaming (line by line)
- Evitar cargar la RAM por completo
- `split`, `parallel`, `pv`
- Ordenar grandes cantidades de datos sin reventar la memoria (`sort` con flags correctos)
- Map-reduce cutre en bash
*Y esto aporta:*
	Analisis de **Big Data** chapucero, pero cumpliré con la función.

### Cuál es el objetivo de esto:
Aprender y profundizar aún más en lo que ya sé y conozco. Tengo pensado dedicarle aproximadamente entre 1 y 2 meses solo a esto.

Me deja conocimiento como la dominación de la terminal de forma completa, entender Linux desde la raíz, automatización sin dependencia de lenguajes externos, analizado, procesado y transformación de datos masivos, creación de herramientas internas de consola, depuración de sistemas con logs y pipes, creación de interfaces CLI y la construcción de una infraestructura funcional con bash.


Al final de todo, tengo pensado hacer algunos proyectos absurdos, como por ejemplo, un navegador hecho solo con Bash. Es complicado (y roza lo masoquista), pero divertido.