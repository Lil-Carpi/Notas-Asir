**Para ver los apuntes de la teoria, ver [[Python]]**
```table-of-contents
title: # Índice
style: nestedOrderedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
include: 
exclude: 
includeLinks: true # Make headings clickable
hideWhenEmpty: false # Hide TOC if no headings are found
debugInConsole: false # Print debug info in Obsidian console
```

# RA1
## RA1 - INICIALS

```Python
"""
1-Demana per teclat una quantitat i a continuació entra 
per teclat diversos noms fins a la quantitat entrada. 
Al final mostra tots els noms per pantalla.
Exemple:
Entra quantitat: 4
nom 1 ? Mortadelo
nom 2 ? Anacleto
nom 3 ? Mortadelo
nom 4 ? Filemón
Els noms són: Mortadelo Anacleto Mortadelo Filemón
"""
quantitat=int(input("Introduce un numero: "))
lista = []
for i in range(quantitat):
    nombres = input(f"Nombre {i + 1} ? ") 
    lista.append(nombres)
    
print("Los nombres son:")
for nombre in lista:
    print(nombre, end=" ")
```
```Python
"""
2-Igual a l’exercici 1, però sense permetre noms repetits.
Exemple:
Entra quantitat: 4
nom 1 ? Mortadelo
nom 2 ? Anacleto
nom 3 ? Mortadelo
Repetit, nom 3 ? Sacarino
nom 4 ? Filemón
Els noms són: Mortadelo Anacleto Filemón Sacarino
"""
nombres = int(input("Introduce una cantidad: "))
lista=[]
    
while len(lista) < nombres:
    actual = len(lista) + 1
    nombre = input(f"Nombre {actual} ? ")
    while nombre in lista:
        nombre = input(f"Repite, nombre {actual} ? ")
    lista.append(nombre)

print(lista)
```
```Python
"""
3-Crea un diccionari, amb diverses dades d’un individu, 
seguint aquesta estructura:

{“nom”: …. , “cognom”: …. , “edat”: …. , “pes”: …. }

Demana les dades per teclat i mostra la informació al final. 
Si l’individu és major d’edat, afegeix “(major d’edat)”.
Exemple 1:
Entra nom: Bob Esponja
Entra cognom: SquarePants
Entra edat: 15
Entra pes: 0.2
Aquestes són les dades: Bob Esponja SquarePants 15 anys 0.2 Kg
Exemple 2:
Entra nom: Arenita
Entra cognom: Mejillas
Entra edat: 19
Entra pes: 1.1
Aquestes són les dades: Arenita Mejillas 19 anys 1.1 Kg (major d’edat)
"""
individuo = {"nom": "", "cognom": "", "edat": "", "pes": ""}

nom = input("Entra nom: ")
cognom = input("Entre cognom: ")
edat = int(input("Entra edat: "))
pes = float(input("Entra pes: "))

individuo["nom"] = nom
individuo["cognom"] = cognom
individuo["edat"] = edat
individuo["pes"] = pes

if individuo["edat"] < 18:
    estatEdat = "(Menor d'edat)"
else:
    estatEdat = "(Major d'edat)"
print(f"Aquestes son les dades: {individuo["nom"]} {individuo["cognom"]} {individuo["edat"]} anys {individuo["pes"]} kg {estatEdat}")
```
```Python
"""
4-Crea una llista (list) de diccionaris com els de l’exercici 3. 
No fa falta llegir les dades per teclat, es pot inicialitzar al codi.
Mostra el contingut de tota la llista segons s’indica a l’exercici 3.
Mostra la quantitat d’individus majors d’edat.
Mostra la mitjana del pes de tots els individus.
Mostra els noms què s’han repetit o el missatge “SENSE NOMS REPETITS”
"""
dades1={"nom": "Bob Esponja" , "cognom": "Squarepants", "edat": 14 , "pes": 0.3}
dades2={"nom": "Arenita" , "cognom": "Mejillas", "edat": 20 , "pes": 1.8}
dades3={"nom": "Patricio" , "cognom": "Estrella", "edat": 21 , "pes": 0.4}
dades4={"nom": "Patricio" , "cognom": "Estrella", "edat": 15 , "pes": 0.4}
dades5={"nom": "Arenita" , "cognom": "Mejillas", "edat": 13 , "pes": 1.8}
dades6={"nom": "Arenita" , "cognom": "Mejillas", "edat": 18 , "pes": 1.8}

llista =[ dades1, dades2, dades3, dades4, dades5, dades6]

mpeso = 0
mayoresEdad=0
nrepetits=set()
nvistos=set()
print("Aquestes son les dades:")
for individu in llista:
    nom = individu["nom"]
    if nom in nvistos:
        nrepetits.add(nom)
    else:
        nvistos.add(nom)

    if individu["edat"] < 18:
        estatEdat = "(Menor d'edat)"
    else:
        estatEdat = "(Major d'edat)"
        mayoresEdad += 1
    
    mpeso += individu["pes"]

    print(f'{individu["nom"]} {individu["cognom"]} {individu["edat"]} anys {individu["pes"]} kg {estatEdat}')

print(f"Totals de majors d'edat: {mayoresEdad}")


mediapeso = mpeso / len(llista)
print(f"La media de peso es de {mediapeso:.2f}")


if len(nrepetits) > 0:
    print(f"Noms repetits: {', ' .join(nrepetits)}")
else:
    print("SENSE NOMS REPETITS")
```

---
## RA1 - Bucles i llistes
```Python
"""
1-Crea una llista de valors numèrics enters, no fa falta llegir-la del teclat.
Mitjançant un bucle crea una segona llista, igual a l’anterior, però modificant tots els valors negatius per el seu valor en positiu. Mostra les dues llistes per consola.
Exemple:
Llista 1: [45, -6, 0, -32, 23, 9]
Resultat:
Llista 1: [45, -6, 0, -32, 23, 9]
Llista 2: [45, 6, 0, 32, 23, 9]
"""
llista_1 = [45, -6, 0, -32, 23, 9]
llista_2 = []

for num in llista_1:
    if num < 0:
        llista_2.append(num * -1) # També es pot utilitzar abs(num)
    else:
        llista_2.append(num)

print(f"Llista 1: {llista_1}")
print(f"Llista 2: {llista_2}")
```
```Python
"""
2-Crea una llista de valors numèrics enters, no fa falta llegir-la del teclat.
Mostra per consola els valors de la llista sense repetir cap. Fes servir un bucle i un tipus set.
Exemple:
Llista: [45, -6, 0, -32, -6, 0, 45, 45, 23, 9]
Resultat:
Llista: [45, -6, 0, -32, -6, 0, 45, 45, 23, 9]
Sense repetits: -32 -6 0 45 23 9
"""
llista = [45, -6, 0, -32, -6, 0, 45, 45, 23, 9]

# Passem la llista a un set per eliminar duplicats i ho ordenem
# per a que el resultat quadri amb l'exemple
sense_repetits = sorted(set(llista)) 

print(f"Llista: {llista}")
print("Sense repetits:", end=" ")
for num in sense_repetits:
    print(num, end=" ")
print() # Salt de línia al final
```
```Python
"""
3-Crea una llista amb contingut de tipus str, amb diverses paraules.
Mostra les paraules començant per l’inici de la llista i començant pel final.
Utilitza bucles.
Exemple:
Llista: ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
Resultat:
the quick brown fox jumps over the lazy dog
dog lazy the over jumps fox brown quick the
"""
llista = ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]

print(f"Llista: {llista}")
print("Resultat:")

# D'inici a final
for paraula in llista:
    print(paraula, end=" ")
print() # Salt de línia
# De final a inici
for paraula in reversed(llista):
    print(paraula, end=" ")
print() # Salt de línia
```
```Python
"""
4-Seguint l’exercici 3, mostra les paraules de posicions parelles i posicions senars.
Exemple:
Llista: ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
Resultat:
parelles: the brown jumps the dog
senars: quick fox over lazy
"""
llista = ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]

print(f"Llista: {llista}")
print("Resultat:")

print("parelles:", end=" ")
for i in range(len(llista)):
    if i % 2 == 0:
        print(llista[i], end=" ")
print()

print("senars:", end=" ")
for i in range(len(llista)):
    if i % 2 != 0:
        print(llista[i], end=" ")
print()
```
```Python
"""
5-Seguint l’exercici 1, mostra una tercera llista amb els enters parells de la llista 2.
Exemple:
Llista 1: [45, -6, 0, -32, 23, 9]
Resultat:
Llista 1: [45, -6, 0, -32, 23, 9]
Llista 2: [45, 6, 0, 32, 23, 9]
Llista 3: [6, 0, 32]
"""
llista_1 = [45, -6, 0, -32, 23, 9]
llista_2 = []
llista_3 = []

# Codi exercici 1
for num in llista_1:
    if num < 0:
        llista_2.append(-num)
    else:
        llista_2.append(num)

# Codi nou: cercar nombres parells de la llista 2
for num in llista_2:
    if num % 2 == 0:
        llista_3.append(num)

print(f"Llista 1: {llista_1}")
print(f"Llista 2: {llista_2}")
print(f"Llista 3: {llista_3}")
```
```Python
"""
6- Crea una list de 100 enters, omple'l amb els números de l'1 al 100 i després mostra'ls.
"""
# Creem la llista utilitzant un bucle
llista_1_a_100 = []
for i in range(1, 101):
    llista_1_a_100.append(i)

print(llista_1_a_100)
```
```Python
"""
7- Crea una list de 100 enters, omple'l amb els números del 101 al 200 i després mostra'ls.
"""
# També es pot fer de forma més directa convertint el range a llista:
llista_101_a_200 = list(range(101, 201))

print(llista_101_a_200)
```
```Python
"""
8- Mostra la taula de multiplicar d’un nombre entrat per teclat. El programa ha de validar que el valor entrat estigui entre 1 i 10. Si no ho està, repeteix la pregunta.
Sortida del programa:
---------------------------------------
Quina taula vols veure (1-10)? : 15
Quina taula vols veure (1-10)? : 0
Quina taula vols veure (1-10)? : 4

TAULA DEL 4
=============
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36
4 * 10 = 40
"""
print("-" * 39)
while True:
    try:
        numero = int(input("Quina taula vols veure (1-10)? : "))
        if 1 <= numero <= 10:
            break # Sortim del bucle si el número és vàlid
    except ValueError:
        pass # Ignorem errors si l'usuari no posa un número

print(f"\nTAULA DEL {numero}")
print("=============")
for i in range(1, 11):
    print(f"{numero} * {i} = {numero * i}")
```
```Python
"""
9- Tenim una list amb strings(str) amb noms i cognoms, com per exemple: "Angel","Cuesta","Eva","López","Pol","Castro"
on cada nom va seguit del seu cognom.
Mostra les dades per consola de manera que surti un nom i el seu cognom a cada línia.
Exemple:
Angel Cuesta
Eva López
Pol Castro
"""
llista = ["Angel", "Cuesta", "Eva", "López", "Pol", "Castro"]
# Bucle des de la posició 0 fins al final, saltant de 2 en 2
for i in range(0, len(llista), 2):
    nom = llista[i]
    cognom = llista[i + 1]
    print(f"{nom} {cognom}")
```

---
## RA1 - Diccionaris
```Python
"""
1-Calcula amb un diccionari la freqüència d'aparició de vocals en una frase (suposem que no fem servir accents).
Exemple:
Entra frase: les vocals son aeiou
Resultat:
{'e':2, 'o':3, 'a':2, 'i':1, 'u':1}
"""
# Demanem la frase i la passem a minúscules per evitar problemes amb majúscules
frase = input("Entra frase: ").lower()
vocals = "aeiou"
freq_vocals = {}

for lletra in frase:
    if lletra in vocals:
        # Si la vocal ja és al diccionari, incrementem el comptador
        if lletra in freq_vocals:
            freq_vocals[lletra] += 1
        # Si no hi és, l'afegim amb valor inicial de 1
        else:
            freq_vocals[lletra] = 1

print("Resultat:")
print(freq_vocals)
```
```Python
"""
2-Calcula amb un diccionari la freqüència d'aparició de números en una llista i les posicions a on apareixen.
Exemple:  (entra cada valor per separat) o fer servir llista=list(map(int, frase.split(" ")))
Entra llista: 1 -4 3 1 1 5 7 7
Resultat:
{1:[0,3,4], -4:[1], 3:[2], 5:[5], 7:[6,7]}
"""
entrada = input("Entra llista: ")
# Convertim l'entrada de text a una llista d'enters
llista = list(map(int, entrada.split()))

dicc_posicions = {}

for index, numero in enumerate(llista):
    # Si el número ja existeix al diccionari, afegim l'índex a la seva llista
    if numero in dicc_posicions:
        dicc_posicions[numero].append(index)
    # Si és la primera vegada que el veiem, creem una nova llista amb l'índex
    else:
        dicc_posicions[numero] = [index]

print("Resultat:")
print(dicc_posicions)
```
```Python
"""
3-De totes les possibles tirades de dos daus, agrupa-les pel mateix valor.
Resultat:
{2: [[1, 1]], 3: [[1, 2], [2, 1]], 4: [[1, 3], [2, 2], [3, 1]], ... , 12: [[6, 6]]}
"""
tirades = {}

# Bucle per al primer dau
for dau1 in range(1, 7):
    # Bucle per al segon dau
    for dau2 in range(1, 7):
        suma = dau1 + dau2
        combinacio = [dau1, dau2]
        
        # Agrupem la combinació sota la clau de la seva suma
        if suma in tirades:
            tirades[suma].append(combinacio)
        else:
            tirades[suma] = [combinacio]

print("Resultat:")
print(tirades)
```
```Python
"""
4-D'una llista de valors, crea un histograma gràfic.  
Exemple:  (entra cada valor per separat) o fer servir llista=[list](https://aulavirtual.iesthosicodina.cat/moodle/mod/url/view.php?id=206613 "list")(map(int, frase.split(" ")))  
Entra llista: 1 -4 3 1 1 5 2 2 7 7 -2 3 3 3  
Resultat:  
-4 *  
-3  
-2 *  
-1  
 0  
 1 ***  
 2 **  
 3 ****  
 4  
 5 *  
 6  
 7 **
"""
entrada = input("Entra llista: ")
llista = list(map(int, entrada.split()))

print("Resultat:")

# Utilitzem min() i max() per saber d'on a on hem de pintar l'histograma
# Sumem 1 al màxim perquè el range l'inclogui
for i in range(min(llista), max(llista) + 1):
    # Comptem quantes vegades apareix el número a la llista
    quantitat = llista.count(i)
    
    # Imprimim el número i tants asteriscs com la seva quantitat
    # El {:>2} serveix per alinear els números a la dreta ocupant 2 espais
    print(f"{i:>2} {'*' * quantitat}")
```

---
## RA1 - EX2
```Python
"""
1-(2,5p) Crea una list amb paraules diverses, directament al codi.
Demana per teclat una longitud de paraula (quantitat de caràcters).
Fent servir un bucle, compta les paraules de la llista que tenen la mateixa longitud, les que tenen
una longitud inferior i les que tenen una longitud superior.
Mostra el resultat.
Nota: per obtenir la longitud d’una paraula es pot fer servir len(paraula)
Exemple:
list → "Fent", "servir", "un", "bucle", "compta", "les", "paraules", "de", "la", "llista", "que", "tenen", "la", "mateixa", "longitud"
longitud 6
longitud igual a 6: 3
longitud inferior a 6: 9
longitud superior a 6: 3
"""
paraules = [
    "Fent", "servir", "un", "bucle", "compta", "les", "paraules", 
    "de", "la", "llista", "que", "tenen", "la", "mateixa", "longitud"
]

longitud = int(input("longitud "))

# Inicialitzem els comptadors
iguals = 0
inferiors = 0
superiors = 0

for paraula in paraules:
    if len(paraula) == longitud:
        iguals += 1
    elif len(paraula) < longitud:
        inferiors += 1
    else:
        superiors += 1

print(f"longitud igual a {longitud}: {iguals}")
print(f"longitud inferior a {longitud}: {inferiors}")
print(f"longitud superior a {longitud}: {superiors}")
```
```Python
"""
2-(2,5p) Realitza un joc de daus en els qual es guanyen uns punts en funció del resultat de diversos
daus tirats. Si hi ha algun dau que sigui menor que 3, aleshores la puntuació final és zero punts. En
altre cas la puntuació es calcula de la següent manera:
Es sumen tots els daus.
2 punts més si la suma és més gran de 12.
1 punt més per cada dau que marqui un 6.
Llegeix del teclat la quantitat de daus i a continuació el valor de tots els daus.
Calcula i mostra la puntuació corresponent.
Utilitza bucles.
Exemples:
3 Daus 3,6,3
Puntuació 13
3 Daus 4,3,6
Puntuació 16
5 Daus 1,1,3,6,1
Puntuació 0
4 Daus 6,6,4,3
Puntuació 23
"""
quantitat_daus = int(input("Quantitat de daus: "))

daus = []
# Demanem el valor de cada dau segons la quantitat indicada
for i in range(quantitat_daus):
    valor = int(input(f"Valor del dau {i+1}: "))
    daus.append(valor)

# Variables per calcular la puntuació
suma_daus = 0
quants_sisos = 0
dau_menor_que_3 = False

for dau in daus:
    if dau < 3:
        dau_menor_que_3 = True
    
    suma_daus += dau
    
    if dau == 6:
        quants_sisos += 1

# Càlcul de la puntuació final
if dau_menor_que_3:
    puntuacio_final = 0
else:
    puntuacio_final = suma_daus
    if suma_daus > 12:
        puntuacio_final += 2
    puntuacio_final += quants_sisos

# Format de sortida per mostrar els daus tirats com a l'exemple
daus_str = ",".join(map(str, daus))
print(f"\n{quantitat_daus} Daus {daus_str}")
print(f"Puntuació {puntuacio_final}")
```
```Python
"""
3-(2,5p) Crea una list amb valors enters, directament al codi.
Demana per teclat dos valors numèrics. Crea una nova llista amb tots els valors de la primera què es
troben entre els dos valors entrats per teclat (inclosos), sense valors repetits.
Mostra la nova llista. Utilitza bucles.
Exemple:
list → 5, 8, -32, 0, -5, 88, 20, -5, 7, 8, 9, -100, 100
Límits -10 a 20
Resultat:
5, 8, 0, -5, 20, 7, 9
"""
llista = [5, 8, -32, 0, -5, 88, 20, -5, 7, 8, 9, -100, 100]

# Demanem els límits
limit_inferior = int(input("Límit inferior: "))
limit_superior = int(input("Límit superior: "))

nova_llista = []

for num in llista:
    # Comprovem si està dins de l'interval (inclosos)
    if limit_inferior <= num <= limit_superior:
        # Comprovem que no estigui repetit a la nova llista
        if num not in nova_llista:
            nova_llista.append(num)

print("Resultat:")
# Mostrem la llista separada per comes com a l'exemple
print(", ".join(map(str, nova_llista)))
```
```Python
"""
4-(2,5p) Fent servir el següent diccionari: edats={'Jim': 16,
'Bob': 26,
'Carol': 83,
'Dave': 21,
'Flow': 38,
'Katie': 47,
'Nate': 89}. Crea un bucle que demani per teclat
diversos valors clau (key), fins que el valor sigui
'FI'. Per cada clau, si existeix al diccionari,
mostra un missatge amb el valor que li correspon. Si no existeix, demana per teclat un valor i
afegeix la clau:valor al diccionari.
Mostra el diccionari final.
Exemple:
Entra clau: Bob
Bob té 26
Entra clau: Clint
Nou valor: 99
Entra clau: Nate
Nate té 89
Entra clau: Katie
Katie té 47
Entra clau: Tom
Nou valor: 65
Entra clau: FI
Resultat:
{'Jim': 16, 'Bob': 26, 'Carol': 83, 'Dave': 21, 'Flow': 38, 'Katie': 47, 'Nate':
89, 'Clint': 99, 'Tom': 65}
"""
edats = {
    'Jim': 16,
    'Bob': 26,
    'Carol': 83,
    'Dave': 21,
    'Flow': 38,
    'Katie': 47,
    'Nate': 89
}

while True:
    clau = input("Entra clau: ")
    
    # Condició de sortida del bucle
    if clau == "FI":
        break
        
    # Comprovem si la clau ja existeix al diccionari
    if clau in edats:
        print(f"{clau} té {edats[clau]}")
    else:
        # Si no existeix, demanem el valor i l'afegim
        nou_valor = int(input("Nou valor: "))
        edats[clau] = nou_valor

print("Resultat:")
print(edats)
```

---
# RA2
## RA2 - Crea funcions
```Python
'''
Modifica l'exercici 1 de bucles i llistes per a fer servir una funció:

Crea una llista de valors numèrics enters, no fa falta llegir-la del teclat.
Mitjançant un bucle crea una segona llista, igual a l’anterior, però modificant tots els valors negatius per el seu valor en positiu. Mostra les dues llistes per consola.
Exemple:
Llista 1: [45, -6, 0, -32, 23, 9]
Resultat:
Llista 1: [45, -6, 0, -32, 23, 9]
Llista 2: [45, 6, 0, 32, 23, 9]

#Solució actual:
llista1=[45, -6, 0, -32, 23, 9]

llista2=[]
for n in llista1:
    if n<0: n=-n
    llista2.append(n)

print("Llista 1:", llista1)
print("Llista 2:", llista2)

Es tracta de fer el mateix amb una funció:

llista1=[45, -6, 0, -32, 23, 9]
llista2=senseNegatius(llista1)
print("Llista 1:", llista1)
print("Llista 2:", llista2)
'''

def senseNegatius(llista):
    llista2=[]
    for n in llista:
        if n<0: n=-n
        llista2.append(n)
    return llista2

llista1=[45, -6, 0, -32, 23, 9]
llista2=senseNegatius(llista1)
print("Llista 1:", llista1)
print("Llista 2:", llista2)
```
```Python
'''
Modifica l'exercici 3 de bucles i llistes per a fer servir una funció:

Crea una llista amb contingut de tipus str, amb diverses paraules.
Mostra les paraules començant per l’inici de la llista i començant pel final.
Utilitza bucles.
Exemple:
Llista: ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
Resultat:
the quick brown fox jumps over the lazy dog
dog lazy the over jumps fox brown quick the

#Solució actual:
llista1=["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]

for n in llista1:
    print(n, end=' ')

print()

for n in llista1[-1::-1]:
    print(n, end=' ')

Es tracta de fer el mateix amb una funció:
llista1=["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
llista2=inversa(llista1)
print(llista1)
print(llista2)
'''

def inversa(llista):
    llista2=[]
    for n in llista[-1::-1]:
        llista2.append(n)
    return llista2

def mostra(llista):
    for n in llista:
        print(n, end=' ')
    print()
    
llista1=["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
llista2=inversa(llista1)
mostra(llista1)
mostra(llista2)
```

---
## RA2 - Exercicis de funcions
```Python
"""
1- Crea una funció **longituds** que a partir d’una llista de paraules i una longitud, retorni tres valors: quantes paraules tenen la mateixa longitud,  quantes una longitud inferior i quantes una longitud superior.  
iguals, petites, grans = **longituds**(paraules, lon)
"""
def longituds(paraules, lon):
    iguals = 0
    petites = 0
    grans = 0
    
    for paraula in paraules:
        if len(paraula) == lon:
            iguals += 1
        elif len(paraula) < lon:
            petites += 1
        else:
            grans += 1
            
    return iguals, petites, grans

# Exemple d'ús:
# llista_ex = ["un", "dos", "tres", "quatre"]
# iguals, petites, grans = longituds(llista_ex, 4)
```
```Python
"""
2- Crea una funció **puntsDaus** que a partir d’una llista de valors de tirades de daus, calculi una puntuació de la següent manera:  
Si hi ha algun dau que sigui menor que 3, aleshores la puntuació final és zero punts.  
En altre cas la puntuació es calcula de la següent manera:  
Se sumen tots els daus.  
2 punts més si la suma és més gran de 12.  
1 punt més per cada dau que marqui un 6.  
  
puntuacio=**puntsDaus**(punts)
"""
def puntsDaus(punts):
    # Comprovem si algun dau és menor que 3
    for dau in punts:
        if dau < 3:
            return 0
            
    # Si arribem aquí, no hi ha cap dau menor que 3
    suma = sum(punts)
    puntuacio = suma
    
    if suma > 12:
        puntuacio += 2
        
    puntuacio += punts.count(6) # 1 punt extra per cada 6
    
    return puntuacio
```
```Python
"""
3- Crea una funció **valorsRang** que a partir d’una llista de valors, un valor mínim i un valor màxim, retorni una nova llista amb tots els valors de la primera què es troben entre els dos valors entrats per teclat (inclosos), sense valors repetits.  
  
escollits=**valorsRang**(llista, valmin, valmax)
"""
def valorsRang(llista, valmin, valmax):
    escollits = []
    
    for num in llista:
        if valmin <= num <= valmax:
            if num not in escollits:
                escollits.append(num)
                
    return escollits
```
```Python
"""
4- Crea una funció **calcula_segons** que calculi la quantitat de segons en un temps donat en hores, minuts i segons.  
segons = **calcula_segons**( hores, minuts, segons)
"""
def calcula_segons(hores, minuts, segons):
    total_segons = (hores * 3600) + (minuts * 60) + segons
    return total_segons
```
```Python
"""
5- Crea una funció **temps** que calculi la quantitat d’hores, minuts i segons d’un temps donat en segons.  
hores, minuts, segons = **temps**(segons)
"""
def temps(segons_totals):
    hores = segons_totals // 3600
    resta_segons = segons_totals % 3600
    minuts = resta_segons // 60
    segons = resta_segons % 60
    
    return hores, minuts, segons
```
```Python
"""
6- Escriu una funció **esvocal** que a partir un caràcter torni True si el caràcter és una vocal o False en cas contrari.  
if **esvocal**(caracter):  
    print(caracter, “és una vocal”)  
else:  
    print(caracter, “NO és una vocal”)
"""
def esvocal(caracter):
    # Ho passem a minúscula per no preocupar-nos de si és 'A' o 'a'
    return caracter.lower() in "aeiou"

# Exemple d'ús:
# caracter = "e"
# if esvocal(caracter):
#     print(caracter, "és una vocal")
# else:
#     print(caracter, "NO és una vocal")
```
```Python
"""
7-Crea una funció **canviaMorse** programa que sigui capaç de transformar text natural a codi morse i viceversa.  
Heu de detectar automàticament de quin tipus es tracta i realitzar la conversió.  
En morse se suporta ratlla "-", punt ".", **s'ha de fer servir un espai " " per separar lletres i dos espais "  " entre paraules.**  
L'alfabet morse suportat serà el mostrat a https://es.wikipedia.org/wiki/Código_morse.
"""
def canviaMorse(text):
    morse_dict = {
        'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.',
        'G': '--.', 'H': '....', 'I': '..', 'J': '.---', 'K': '-.-', 'L': '.-..',
        'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.',
        'S': '...', 'T': '-', 'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-',
        'Y': '-.--', 'Z': '--..', '0': '-----', '1': '.----', '2': '..---',
        '3': '...--', '4': '....-', '5': '.....', '6': '-....', '7': '--...',
        '8': '---..', '9': '----.'
    }
    # Creem el diccionari invers per traduir de morse a lletres
    invers_dict = {valor: clau for clau, valor in morse_dict.items()}

    # Verifiquem si el text és Morse (si només conté '-', '.', i espais)
    es_morse = set(text).issubset({'-', '.', ' '})

    if es_morse:
        traduccio = []
        # Dividim per paraules (2 espais)
        paraules_morse = text.split("  ")
        for paraula in paraules_morse:
            lletres_morse = paraula.split(" ")
            lletres_traduides = [invers_dict.get(l, '') for l in lletres_morse]
            traduccio.append("".join(lletres_traduides))
        return " ".join(traduccio)
    else:
        text = text.upper()
        traduccio = []
        # Dividim per paraules
        paraules_naturals = text.split(" ")
        for paraula in paraules_naturals:
            lletres_traduides = [morse_dict.get(l, '') for l in paraula if l in morse_dict]
            traduccio.append(" ".join(lletres_traduides))
        return "  ".join(traduccio) # 2 espais entre paraules
```
```Python
"""
  
8-Crea una funció **diferencies** que a partir de dues cadenes de text gairebé iguals, retorneu les diferències.  
La funció ha de trobar les diferències a la segona cadena i retornar-les en format llista.  
Les dues cadenes de text han de ser iguals en longitud.  
Exemples:  
Em dic mouredev / Em dic m**e**ured**o**v -> ["e", "o"]  
Em dic.Brais Moure / Em dic **b**rais **m**oure -> [" ", "b", "m"]
"""
def diferencies(cadena1, cadena2):
    dif = []
    for i in range(len(cadena1)):
        if cadena1[i] != cadena2[i]:
            dif.append(cadena2[i])
    return dif
```
```Python
"""
9-Crea una funció **comptaLA** que a partir d'una frase retorni la quantitat de LA trobades.  
No es diferencia entre majúscules i minúscules. No s'ha de fer servir el mètode **count**.  
Exemple:  
Ell s'ha passat la tarda cantant La, LA, lA, ...  
Retorna 4

Exemple:  
Ell s'ha passat la tarda cantant LaLAlA, ...  
Retorna 4
"""
def comptaLA(frase):
    frase = frase.lower() # Passem a minúscules per simplificar
    comptador = 0
    # Anem fins a la penúltima lletra, ja que agafem parelles (longitud 2)
    for i in range(len(frase) - 1):
        if frase[i:i+2] == "la":
            comptador += 1
    return comptador
```
```Python
"""
10-Crea una funció **comptaLES** que a partir d'una frase retorni la quantitat de LES trobades.  
No es diferencia entre majúscules i minúscules. No s'ha de fer servir el mètode **count**.  
Exemple:  
Ell es passa totes les tardes cantant LaLESlesla...  
Retorna 3
"""
def comptaLES(frase):
    frase = frase.lower()
    comptador = 0
    # Anem fins a l'avantpenúltima lletra (longitud 3)
    for i in range(len(frase) - 2):
        if frase[i:i+3] == "les":
            comptador += 1
    return comptador
```

---
## RA2 - Altres exercicis
```Python
"""
1- Fes una funció _**marc**_ que dibuixi un marc amb asteriscos.  
La funció tindrà dos paràmetres: base i alçada.  
Exemple:  
base 8, alçada 4  
********  
*      *  
*      *  
********
"""
def marc(base, alcada):
    # Si l'alçada és més gran que 0, imprimim la base superior
    if alcada > 0:
        print("*" * base)
        
    # Imprimim les línies del mig (alçada - 2 línies)
    for _ in range(alcada - 2):
        print("*" + " " * (base - 2) + "*")
        
    # Si l'alçada és més gran que 1, imprimim la base inferior
    if alcada > 1:
        print("*" * base)

# Exemple d'ús:
# marc(8, 4)

```
```Python
"""
2- Fes una funció _**fletxa**_ que dibuixi una fletxa de la mida indicada.   
La funció tindrà un paramètre amb el sentit de la fletxa (esquerra 'E' o dreta 'D') i una longitud,   
dibuixarà la fletxa amb guions ‘-’ i la punta amb ‘<’ o ‘>’.   
La punta és part de la longitud.  
Exemples:  
Sentit E, Longitud 9  
<--------  
Sentit D, Longitud 12  
----------->
"""
def fletxa(sentit, longitud):
    if sentit.upper() == 'E':
        print('<' + '-' * (longitud - 1))
    elif sentit.upper() == 'D':
        print('-' * (longitud - 1) + '>')

# Exemples d'ús:
# fletxa('E', 9)
# fletxa('D', 12)
```
```Python
"""
3- Crea una funció _**correcteNIF**_ que validi un NIF.   
Un NIF se considera vàlid si té 8 dígits i una lletra a l'última posició.  
La lletra ha de correspondre amb la part numèrica segons el càlcul de la funció lletraNIF.  
#Aquesta funció calcula la lletra corresponent a un número.  
Exemple:  lletraNIF(11111111) --> 'H'  
def lletraNIF(numNIF):  
    codigo = "TRWAGMYFPDXBNJZSQVHLCKE"  
    pos = numNIF%23  
    return codigo[pos]  
      
Exemples:  
11111111A   --> False  
11111111H   --> True
"""
def lletraNIF(numNIF):
    codigo = "TRWAGMYFPDXBNJZSQVHLCKE"
    pos = numNIF % 23
    return codigo[pos]

def correcteNIF(nif):
    # Comprovem que la longitud sigui exactament 9
    if len(nif) != 9:
        return False
        
    part_numerica = nif[:8]
    lletra = nif[8].upper()
    
    # Comprovem que els 8 primers caràcters siguin números
    if not part_numerica.isdigit():
        return False
        
    # Calculem la lletra i la comparem
    lletra_calculada = lletraNIF(int(part_numerica))
    return lletra == lletra_calculada

# Exemples d'ús:
# print(correcteNIF("11111111A")) # False
# print(correcteNIF("11111111H")) # True
```
```Python
"""
4- Crea un programa que permeti fer conversions entre les escales de graus de Celsius i Fahrenheit.  
L'usuari decideix primer el sentit de la conversió, i després entra el valor a convertir.  
Fórmules de conversió:  
Fahrenheit a Celsius C = (F - 32) x 5/9  
Celsius a Fahrenheit F = (C x 9/5) + 32  
  
Crea les [funcions](https://aulavirtual.iesthosicodina.cat/moodle/mod/url/view.php?id=202294 "Funcions") següents:  
- una funció que mostri un menú d'opcions  
- una funció per validar l'entrada de l'usuari  
- una funció per passar de Celsius a Fahrenheit  
- una funció per passar de Fahrenheit a Celsius  
  
Exemple:  
CONVERTIDOR DE TEMPERATURES  
===========================  
1. Fahrenheit a Celsius.  
2. Celsius a Fahrenheit.  
3. Sortir.  
  
Tria una opció : 4  
Valor incorrecte.  
Tria una opció : 2  
  
Entra la temperatura en Celsius : 24  
Resultat en Fahrenheit : 75.20
"""
def menu():
    print("\nCONVERTIDOR DE TEMPERATURES")
    print("===========================")
    print("1. Fahrenheit a Celsius.")
    print("2. Celsius a Fahrenheit.")
    print("3. Sortir.\n")

def validar_entrada():
    while True:
        opcio = input("Tria una opció : ")
        if opcio in ['1', '2', '3']:
            return opcio
        print("Valor incorrecte.")

def fahrenheit_a_celsius(f):
    return (f - 32) * 5 / 9

def celsius_a_fahrenheit(c):
    return (c * 9 / 5) + 32

def main():
    while True:
        menu()
        opcio = validar_entrada()
        
        if opcio == '3':
            break
            
        elif opcio == '1':
            f = float(input("\nEntra la temperatura en Fahrenheit : "))
            c = fahrenheit_a_celsius(f)
            # Format .2f per mostrar 2 decimals
            print(f"Resultat en Celsius : {c:.2f}")
            
        elif opcio == '2':
            c = float(input("\nEntra la temperatura en Celsius : "))
            f = celsius_a_fahrenheit(c)
            print(f"Resultat en Fahrenheit : {f:.2f}")

# Per executar el programa, cridaríem la funció main():
# main()
```
```Python
"""
5- Fes una funció _**esborra**_ que, a partir d'una llista de frases i un caràcter, esborri el   
caràcter indicat de totes les frases.   
Retorna la llista modificada i la quantitat de caràcters esborrats.  
Exemple:  
Llista de frases:   
["El talento, gana partidos, pero el trabajo en equipo y la inteligencia, gana campeonatos.",  
"A veces, cuando, se, pierde, se, gana.",  
"No se puede ganar, una guerra como, tampoco se, puede, ganar un terremoto.",  
"La pérdida, de, unos, es la, ganancia, de otros."]  
Caràcter: ','  
Resultat:   
["El talento gana partidos pero el trabajo en equipo y la inteligencia gana campeonatos.",  
"A veces cuando se pierde se gana.",  
"No se puede ganar una guerra como tampoco se puede ganar un terremoto.",  
"La pérdida de unos es la ganancia de otros."]   
17
"""
def esborra(frases, caracter):
    nova_llista = []
    caracters_esborrats = 0
    
    for frase in frases:
        # Comptem quantes vegades hi és el caràcter a la frase actual
        caracters_esborrats += frase.count(caracter)
        
        # Substituïm el caràcter per buit i afegim a la nova llista
        nova_frase = frase.replace(caracter, "")
        nova_llista.append(nova_frase)
        
    return nova_llista, caracters_esborrats

# Exemple d'ús:
# frases = [
#     "El talento, gana partidos, pero el trabajo en equipo y la inteligencia, gana campeonatos.",
#     "A veces, cuando, se, pierde, se, gana."
# ]
# llista_modificada, esborrats = esborra(frases, ',')
```
---
## RA2 - Exercicis amb mòduls
```Python
"""
1- Crea un script per realitzar còpia de seguretat de diversos orígens.

Farà falta una funció per a fer la còpia d'un origen a un destí.

def copiaDades(origen, desti): # Còpia l'origen amb tot el seu contingut a destí.

L'script tindrà una variable amb la llista d'orígens que s'han de copiar i una altra variable amb el destí de les còpies.

origens=['/home/usuari/', '/root/', '/etc/', '/dades/']  # Fan falta drets de lectura

desti='/copies/'  # Fan falta drets d'escriptura

S'ha de fer un bucle per recorrer la llista origens i fer la còpia de cada un.

Funcions útils:
os.path.join(path, path2, ...)  EX:  nom=os.path.join("/info/",  desti)
shutil.copytree(src, dst,  dirs_exist_ok=True)
shutil.copy2(src, dst)
os.makedirs(os.path.dirname(desti), exist_ok=True)
os.path.isdir(path)
"""
import os
import shutil

def copiaDades(origen, desti):
    os.makedirs(desti, exist_ok=True)
    
    # Extraiem el nom final de l'origen per crear la subcarpeta
    nom_base = os.path.basename(os.path.normpath(origen))
    desti_final = os.path.join(desti, nom_base)

    try:
        if os.path.isdir(origen):
            shutil.copytree(origen, desti_final, dirs_exist_ok=True)
        else:
            shutil.copy2(origen, desti_final)
        print(f"Copiat: {origen} -> {desti_final}")
    except Exception as e:
        print(f"Error copiant {origen}: {e}")

origens = ['/home/usuari/', '/root/', '/etc/', '/dades/']
desti = '/copies/'

for orig in origens:
    if os.path.exists(orig):
        copiaDades(orig, desti)
    else:
        print(f"L'origen {orig} no existeix. Es salta.")
```
```Python
"""
2- Crea un script per realitzar la restauració de la còpia de seguretat anterior.

L'script tindrà dues variables: origen de les còpies i destí de restauració.

copies='/copies/'  # Fan falta drets de lectura

desti='/proves/'  # Fan falta drets d'escriptura

Funcions útils:

os.listdir(path)  Ex:  llista=os.listdir('/copies')
"""
import os
import shutil

copies = '/copies/'
desti = '/proves/'

os.makedirs(desti, exist_ok=True)

if os.path.exists(copies):
    llista = os.listdir(copies)
    for element in llista:
        ruta_origen = os.path.join(copies, element)
        ruta_desti = os.path.join(desti, element)
        
        try:
            if os.path.isdir(ruta_origen):
                shutil.copytree(ruta_origen, ruta_desti, dirs_exist_ok=True)
            else:
                shutil.copy2(ruta_origen, ruta_desti)
            print(f"Restaurat: {element} a {desti}")
        except Exception as e:
            print(f"Error restaurant {element}: {e}")
else:
    print(f"El directori de còpies {copies} no existeix.")
```
```Python
"""
3- Modifica els scripts per permetre tenir diverses còpies. Es tracta d'afegir una variable amb la quantitat de còpies a conservar. S'hauran de crear diversos directoris amb les còpies.
S'han de conservar la quantitat de còpies indicades, sempre les últimes n còpies fetes. En fer la restauració farà falta saber quina és la còpia que volem restaurar.
Exemple:
desti='/home/dades/copies/'
ncopies=5

Això crearia:

/home
  |
  --dades
     |
     --copies
        |
        --1
        |
        --2
        |
        --3
        |
        --4
        |
        --5
 

Si ja hem completat totes les possibles còpies i en volem fer una més, s'haurà de sobreescriure la més antiga.

Funcions útils:
os.path.getmtime(path)
os.path.isdir(path)
"""
import os
import shutil

origens = ['/home/usuari/', '/root/', '/etc/', '/dades/']
desti_base = '/home/dades/copies/'
ncopies = 5

os.makedirs(desti_base, exist_ok=True)

# Llistem només directoris que siguin números
carpetes = [d for d in os.listdir(desti_base) if os.path.isdir(os.path.join(desti_base, d)) and d.isdigit()]

if len(carpetes) < ncopies:
    # Creem el següent número de carpeta
    num_carpeta = str(len(carpetes) + 1)
else:
    # Busquem la carpeta més antiga i la sobreescrivim
    carpeta_antiga = min(carpetes, key=lambda x: os.path.getmtime(os.path.join(desti_base, x)))
    num_carpeta = carpeta_antiga
    shutil.rmtree(os.path.join(desti_base, num_carpeta))

desti_final = os.path.join(desti_base, num_carpeta)
os.makedirs(desti_final, exist_ok=True)

print(f"Còpia {num_carpeta} desant-se a: {desti_final}")

for orig in origens:
    if os.path.exists(orig):
        nom_base = os.path.basename(os.path.normpath(orig))
        ruta_guardar = os.path.join(desti_final, nom_base)
        if os.path.isdir(orig):
            shutil.copytree(orig, ruta_guardar, dirs_exist_ok=True)
        else:
            shutil.copy2(orig, ruta_guardar)
```
```Python
"""
4- Unifica els scripts i selecciona la tasca a realitzar segons els paràmetres que rebi.
Nom script: filesadm.py

Paràmetres:
-h --help                   Missatge informatiu del funcionament.
-b --backup              Fa la còpia de seguretat.
-r --restore               Recupera l'última còpia guardada.
-R num --restn num Recupera la còpia amb número num.
-d path --dest path   Destí de les còpies de seguretat.
-n num                     Quantitat de còpies de seguretat guardades.
-o --overwrite           Permet sobreescriure les dades guardades o recuperades.
"""
import sys
import os

def usage():
    print("Ús: filesadm.py [opcions]")
    print("-h --help             Missatge informatiu del funcionament.")
    print("-b --backup           Fa la còpia de seguretat.")
    print("-r --restore          Recupera l'última còpia guardada.")
    print("-R num --restn num    Recupera la còpia amb número num.")
    print("-d path --dest path   Destí de les còpies de seguretat.")
    print("-n num                Quantitat de còpies de seguretat guardades.")
    print("-o --overwrite        Permet sobreescriure les dades guardades o recuperades.")

args = sys.argv[1:]

if not args:
    usage()
    sys.exit()

argval = 0
backup = False
restore = False
restn = None
dest = None
n_copies = None
overwrite = False

while argval < len(args):
    arg = args[argval]
    
    if arg in ("-h", "--help"):
        usage()
        sys.exit()
        
    elif arg in ("-b", "--backup"):
        backup = True
        argval += 1
        
    elif arg in ("-r", "--restore"):
        restore = True
        argval += 1
        
    elif arg in ("-R", "--restn"):
        if argval + 1 < len(args):
            restn = int(args[argval + 1])
            argval += 2
        else:
            print("Error: Falta especificar el número de còpia.")
            sys.exit(1)
            
    elif arg in ("-d", "--dest"):
        if argval + 1 < len(args):
            dest = str(args[argval + 1])
            argval += 2
        else:
            print("Error: Falta especificar la ruta de destí.")
            sys.exit(1)
            
    elif arg == "-n":
        if argval + 1 < len(args):
            n_copies = int(args[argval + 1])
            argval += 2
        else:
            print("Error: Falta especificar la quantitat de còpies.")
            sys.exit(1)
            
    elif arg in ("-o", "--overwrite"):
        overwrite = True
        argval += 1
        
    else:
        print(f"Valor {arg} no existeix.")
        usage()
        sys.exit(1)

# Simulem l'execució amb els paràmetres recollits
print("=== CONFIGURACIÓ CARREGADA ===")
if backup: print("- Mode: BACKUP")
if restore: print("- Mode: RESTORE (última còpia)")
if restn is not None: print(f"- Mode: RESTORE (Còpia núm. {restn})")
if dest: print(f"- Destí: {dest}")
if n_copies is not None: print(f"- Quantitat a retenir: {n_copies}")
if overwrite: print("- Sobreescriptura: ACTIVADA")
```
```Python
"""
5- Crea un script que accepti els següents paràmetres:  
-m --missatge          Mostra el text "Missatge de prova"  
-f text --frase text     Mostra "FRASE: " i el text passat per paràmetre  
-h --help                   Mostra informació sobre com fer servir aquest script
"""
import sys

def usage():
    print("Ús del script:")
    print("-m --missatge      Mostra el text 'Missatge de prova'")
    print("-f text --frase    Mostra 'FRASE: ' i el text passat per paràmetre")
    print("-h --help          Mostra informació sobre com fer servir aquest script")

args = sys.argv[1:]

if not args:
    usage()
    sys.exit()

argval = 0

while argval < len(args):
    arg = args[argval]
    
    if arg in ("-h", "--help"):
        usage()
        sys.exit()
        
    elif arg in ("-m", "--missatge"):
        print("Missatge de prova")
        argval += 1
        
    elif arg in ("-f", "--frase"):
        if argval + 1 < len(args):
            frase = args[argval + 1]
            print(f"FRASE: {frase}")
            argval += 2
        else:
            print("Error: Falta el text de la frase.")
            sys.exit(1)
            
    else:
        print(f"Paràmetre desconegut: {arg}")
        usage()
        sys.exit(1)
```
```Python
"""
6- Crea un script que mostri el contingut d'un directori passat per paràmetre.
"""
import sys
import os

if len(sys.argv) < 2:
    print("Error: Has de passar la ruta d'un directori per paràmetre.")
    sys.exit(1)

directori = sys.argv[1]

if os.path.isdir(directori):
    print(f"Contingut de {directori}:")
    for element in os.listdir(directori):
        print(f" - {element}")
else:
    print(f"Error: {directori} no és un directori vàlid.")
```
```Python
"""
7- Crea un script que faci la creació d'un directori amb el nom passat per paràmetre.
"""
import sys
import os

if len(sys.argv) < 2:
    print("Error: Has d'indicar el nom o ruta del directori a crear.")
    sys.exit(1)

nou_directori = sys.argv[1]

try:
    os.makedirs(nou_directori)
    print(f"Directori '{nou_directori}' creat correctament.")
except FileExistsError:
    print(f"Error: El directori '{nou_directori}' ja existeix.")
except PermissionError:
    print("Error: No tens els permisos adequats per crear el directori.")
```
```Python
"""
8- Crea un script que mostri la data de creació d'un fitxer o directori passat per paràmetre.
"""
import sys
import os
import time

if len(sys.argv) < 2:
    print("Error: Has de passar un fitxer o directori per paràmetre.")
    sys.exit(1)

ruta = sys.argv[1]

if os.path.exists(ruta):
    # Obtenim la data en segons
    segons_ctime = os.path.getctime(ruta)
    
    # Transformem a format llegible
    data_formatada = time.ctime(segons_ctime)
    
    tipus = "El directori" if os.path.isdir(ruta) else "El fitxer"
    print(f"{tipus} '{ruta}' té data de creació/metadades: {data_formatada}")
else:
    print(f"Error: La ruta '{ruta}' no existeix.")
```

---
## RA2 - EX1
```Python
"""
1- (1p) Crear una funcio menu amb match. (OBLIGATORI fer el menu)
En acabar una opcio cal tornar a mostar el menu.
El menu conté  les següents opcions:
1. Millor Oferta
2. Romans
3. Pacte
4. Correcte
5. Sortir.

per exemple:
.:: MENU ::.
1. Millor Oferta
2. Romans
3. Pacte
4. Correcte
5. Sortir.

Quina opció vols fer? 

2-(2p) Crea una funció millorOferta que a partir d’un diccionari amb ofertes per a la compra de l’illa de Groenlàndia, 
ens retorni quina és la millor o millors.
La funció tindrà un paràmetre que consistirà en un diccionari amb les diverses ofertes,
 la clau serà el nom de qui fa l’oferta i el valor serà el preu que s’ofereix:
Exemple:
{'Trump': 0, 'Musk': 99000000000, 'Catalunya': 99000000000, 'Canadà': 123456789,
'Aràbia Saudí': 98999999999, 'Rússia': 222222222}
La funció retornarà un altre diccionari amb l’oferta més alta, si hi ha empat ha de retornar totes les que siguin iguals a la més alta.
Amb l’exemple anterior, el resultat seria: {'Musk':99000000000,'Catalunya':99000000000}

3-(2p) Els nombres romans es componen dels caràcters I, V, X, L, C, D, M. Crea una funció
romans que ens informi de si un string és un nombre romà o no.
Exemples:
'III' True
'MCMXCIX' True
'78CVX' False
'MCSFT' False

4-(2,5p) Crea una funció amb identificador pacte que retorni cert o fals indicant si un pacte concret pot ser suficient 
per aprovar els pressupostos generals del país dels Barrufets. La funció tindrà dos paràmetres, el primer serà un 
diccionari amb les dades dels diferents grups parlamentaris que formen el pacte, la clau és el nom del grup i el 
valor és la quantitat d’escons. 
El segon paràmetre serà la quantitat necessària per obtenir majoria absoluta.
La funció ha de fer la suma dels escons i retornar True si és més gran o igual a la majoria absoluta, en altre cas ha de retornar False.
Exemples:
El diccionari conté:
{'Per Pebrots': 137, 'Volem Objectius Xupis': 33}
Majoria: 176
Retorna False
El diccionari conté:
{'Preferim Sistemes Operatius Embedded': 121, 'BARRUFAR': 31, 'Esperem Resposta
Concreta': 7, 'Jumanji': 7, 'Eso Ha Barrufado': 6, 'Podríem No Votar': 5}
Majoria: 176
Retorna True

5-(2,5p) Volem fer servir strings amb la característica que siguin una combinació alternada dels caràcters @@ i &. 
Per exemple : '@@&@@&@@&@@&@@' o '&@@&@@'.
Però resulta que ens proporcionen alguns casos defectuosos que no compleixen aquest requisit, per
exemple : '&@&@&@&@&@' o '&@@@@@'.
Necessitem una funció correcte per detectar aquest casos, la funció tindrà un paràmetre amb l’string que volem verificar i 
retornarà un boolean indicant True si l’string és correcte o False si és incorrecte.
Exemples:
'@@&@@&@@&@@&@@' ha de retornar True
'&@@&@@' ha de retornar True
'&@@&@@&@@&@@&' ha de retornar True
'&@@@@@' ha de retornar False
'@@&@&&@@&@@&@@' ha de retornar False
'&@&@&@&@&@' ha de retornar False
"""
import sys

# ==========================================
# FUNCIONS DELS EXERCICIS
# ==========================================

def millorOferta(ofertes):
    """Retorna un diccionari amb les ofertes més altes."""
    if not ofertes:
        return {}
    max_preu = max(ofertes.values())
    return {clau: valor for clau, valor in ofertes.items() if valor == max_preu}

def romans(text):
    """Comprova si l'string està format exclusivament per nombres romans."""
    if not text:
        return False
    caracters_valids = "IVXLCDM"
    for char in text:
        if char not in caracters_valids:
            return False
    return True

def pacte(grups, majoria):
    """Suma els escons dels grups i retorna True si assoleix o supera la majoria."""
    suma_escons = sum(grups.values())
    return suma_escons >= majoria

def correcte(cadena):
    """Comprova que l'string sigui una combinació alternada de '@@' i '&'."""
    # Substituïm les combinacions correctes '@@' per una lletra clau (ex: 'X')
    modificada = cadena.replace("@@", "X")
    
    # Si encara queden '@' solts, és invàlid. 
    # Tampoc poden haver-hi dos 'XX' (@@@@) ni '&&' de costat.
    if "@" in modificada or "XX" in modificada or "&&" in modificada:
        return False
        
    return True

# ==========================================
# MENÚ AMB MATCH (Ex. 1)
# ==========================================

def menu():
    while True:
        print("\n.:: MENU ::.")
        print("1. Millor Oferta")
        print("2. Romans")
        print("3. Pacte")
        print("4. Correcte")
        print("5. Sortir.")
        
        opcio = input("\nQuina opció vols fer? ")
        
        match opcio:
            case '1':
                ofertes_ex = {'Trump': 0, 'Musk': 99000000000, 'Catalunya': 99000000000, 'Canadà': 123456789, 'Aràbia Saudí': 98999999999, 'Rússia': 222222222}
                print(f"\nOfertes rebudes: {ofertes_ex}")
                print(f"Millor oferta: {millorOferta(ofertes_ex)}")
                
            case '2':
                text = input("\nIntrodueix el suposat nombre romà: ").upper()
                print(f"Resultat: {romans(text)}")
                
            case '3':
                grups_ex = {'Preferim Sistemes Operatius Embedded': 121, 'BARRUFAR': 31, 'Esperem Resposta Concreta': 7, 'Jumanji': 7, 'Eso Ha Barrufado': 6, 'Podríem No Votar': 5}
                majoria = 176
                print(f"\nGrups: {grups_ex}")
                print(f"S'arriba a la majoria de {majoria}? {pacte(grups_ex, majoria)}")
                
            case '4':
                cadena = input("\nIntrodueix la cadena a verificar: ")
                print(f"És correcte? {correcte(cadena)}")
                
            case '5':
                print("\nSortint del programa...")
                break
                
            case _:
                print("\nOpció invàlida. Si us plau, tria una opció del 1 al 5.")

# ==========================================
# CONTROL D'ARGUMENTS PRINCIPAL
# ==========================================

def usage():
    print("Ús: python script.py [-h]")
    print("-h, --help    Mostra informació d'ús del programa i surt.")

def main():
    args = sys.argv[1:]
    
    # Comprovem si han passat paràmetres manuals. Si no n'hi ha cap, obrim el menú directament.
    if args:
        argval = 0
        while argval < len(args):
            arg = args[argval]
            
            if arg in ("-h", "--help"):
                usage()
                return
            else:
                print(f"Valor {arg} no existeix.")
                usage()
                return
    
    # Si arribem aquí (no hi ha arguments d'ajuda), llançem el menú obligatori
    menu()

if __name__ == "__main__":
    main()
```

---
## RA2 - EX2
```Python
"""
1-(2p) Crea un script A02.2._Nom_Cognom.py que admeti els següents paràmetres:
--llista num (num és un enter)
-s nom (nom és un string)
--help o -h (amb diferents opcions help o h per la ajuda general,
--help llista o -h lista, per mostrar ajuda de la funció llista,  
--help snom o -h snom, per la funcio snom )
Hi haurà també les següents funcions (aquestes funcions no fan res de moment):
def llista(num):
return
def snom(nom):
return
def ajuda(funcio=None,completa=True):
return
Per cada cas, ha de fer la crida a la funció corresponent:
Per --llista num s’ha de fer la crida a llista(num).
Per -s nom s’ha de fer la crida a snom(nom).
Per --help o -h ha de mostrar la documentacio de general o part concreta de la funcio (en funcio dels parametres passats)
Si hi ha varis paràmetres, els ha de gestionar tots.

2-(2p) Substitueix la funció llista(num) per mostrar per consola els primers num elements del directori actual ("."). 
Si no hi ha prou elements, ha de mostrar-ne els que hi hagi. 
Si no n’hi ha cap, haurà de mostrar el missatge "DIRECTORI BUIT". El paràmetre num és un valor enter >=1.


3-(2p) Substitueix la funció snom(nom) per mostrar per consola si l’element nom és un fitxer, 
un directori o si no existeix. Hi ha tres possibilitats: "FITXER", "DIRECTORI", "NO EXISTEIX". 
El paràmetre nom és un path del sistema d’arxius.


4-(2p) Substitueix la funció ajuda(funcio,completa) per a mostrar per pantalla l'ajuda del programa. 
El paràmetre funció és el nom d'una funció (llista, snom,...) i el parametre completa és un booleà. Si es cert, mostrarà
tota la ajuda, sino nomes la ajuda de la funció enviada per paràmetre.
"""
import sys
import os

# ==========================================
# EXERCICI 2: Funció llista
# ==========================================
def llista(num):
    try:
        # Obtenim els elements del directori actual
        elements = os.listdir('.')
        
        if not elements:
            print("DIRECTORI BUIT")
        else:
            # Utilitzem slicing per agafar fins a 'num' elements
            # Si 'num' és més gran que la llista, no dóna error, mostra el que hi ha
            for element in elements[:num]:
                print(element)
    except Exception as e:
        print(f"Error en llegir el directori: {e}")

# ==========================================
# EXERCICI 3: Funció snom
# ==========================================
def snom(nom):
    if not os.path.exists(nom):
        print("NO EXISTEIX")
    elif os.path.isfile(nom):
        print("FITXER")
    elif os.path.isdir(nom):
        print("DIRECTORI")

# ==========================================
# EXERCICI 4: Funció ajuda
# ==========================================
def ajuda(funcio=None, completa=True):
    if completa:
        print("AJUDA GENERAL:")
        print(" Ús: python A02.2._Nom_Cognom.py [paràmetres]")
        print("   --llista num : Mostra els primers 'num' elements del directori actual.")
        print("   -s nom       : Indica si 'nom' és un fitxer, directori o no existeix.")
        print("   -h, --help   : Mostra aquesta ajuda general.")
        print("                  Per ajuda específica, afegeix 'llista' o 'snom' (Ex: -h llista)")
    else:
        if funcio == "llista":
            print("AJUDA ESPECÍFICA - FUNCIÓ LLISTA:")
            print("  --llista num")
            print("  Mostra per consola els primers 'num' elements del directori actual ('.').")
            print("  El valor de 'num' ha de ser un enter superior o igual a 1.")
        elif funcio == "snom":
            print("AJUDA ESPECÍFICA - FUNCIÓ SNOM:")
            print("  -s nom")
            print("  Comprova el path indicat per 'nom' i mostra per pantalla:")
            print("  'FITXER', 'DIRECTORI' o 'NO EXISTEIX'.")

# ==========================================
# EXERCICI 1: Control d'arguments principal
# ==========================================
def main():
    args = sys.argv[1:]
    
    # Si no hi ha arguments, cridem l'ajuda completa
    if not args:
        ajuda(completa=True)
        return

    argval = 0

    while argval < len(args):
        arg = args[argval]
        
        # Gestió del paràmetre d'ajuda
        if arg in ("-h", "--help"):
            # Mirem si hi ha un argument següent per donar ajuda específica
            if argval + 1 < len(args) and args[argval + 1] in ("llista", "snom"):
                funcio_especifica = args[argval + 1]
                ajuda(funcio=funcio_especifica, completa=False)
                argval += 2
            else:
                ajuda(completa=True)
                argval += 1
                
        # Gestió del paràmetre --llista
        elif arg == "--llista":
            if argval + 1 < len(args):
                try:
                    num = int(args[argval + 1])
                    if num >= 1:
                        llista(num)
                    else:
                        print("Error: El paràmetre de --llista ha de ser >= 1.")
                except ValueError:
                    print("Error: El paràmetre num de --llista ha de ser numèric (enter).")
                argval += 2
            else:
                print("Error: Falta especificar el número per a --llista.")
                argval += 1
                
        # Gestió del paràmetre -s
        elif arg == "-s":
            if argval + 1 < len(args):
                nom = str(args[argval + 1])
                snom(nom)
                argval += 2
            else:
                print("Error: Falta especificar el nom de l'element per a -s.")
                argval += 1
                
        # Gestió de paràmetres invàlids
        else:
            print(f"Valor o paràmetre '{arg}' no reconegut.")
            argval += 1

if __name__ == "__main__":
    main()
```
---
## RA2 - EX3
```Python
"""
1-(2,5p) Crea un script practica3.py que admeti els següents paràmetres:
-p o --path necessita un paràmetre string
-i o --inicial necessita un paràmetre string
-l o --limit necessita un paràmetre int
--igual
--noigual
--help o -h
Ha de detectar correctament les opcions i paràmetres i mostrar-ne un missatge si n’hi ha cap
dada errònia.
Hi haurà també les següents funcions (aquestes funcions no fan res de moment):
def compta(path):
return 0, 0
def trobaPerInicial(path, inicial):
return []
def trobaNoInicial(path, inicial, limit):
return []
Per cada cas, ha de fer la crida a la funció corresponent:
--igual crida a la funció trobaPerInicial(path, inicial)
--noigual crida a la funció trobaNoInicial(path, inicial, limit)
--help o -h ha de mostrar un missatge informatiu dels paràmetres vàlids.
Si hi ha varis paràmetres, els ha de gestionar tots.
S’ha de fer print dels resultats retornats per les funcions.

2-(2,5p) Crea la funció compta(path). Aquesta funció ha de retornar la quantitat de fitxers i
directoris que hi ha en un path.
Exemple:
qfitxers, qdirec = compta("/home/user/proves")

3-(2,5p) Crea la funció trobaPerInicial(path, lletra). Aquesta funció ha de retornar una llista amb
tots els elements del path que tinguin un nom que comenci per la lletra indicada.
Exemple:
llista = trobaPerInicial("/home/user/proves", "X")
print(llista)
['Xarxa.txt', 'Xemeneia.txt', 'Xocolata.ods']

4-(2,5p) Crea la funció trobaNoInicial(path, lletra, limit). Aquesta funció ha de retornar una llista
amb els elements del path que tinguin un nom que NO comenci per la lletra indicada, però sense
superar la quantitat que indiqui el paràmere limit.
Exemple:
llista = trobaPerInicial("/home/user/proves", "X", 4)
print(llista)
['Backups.txt', 'Bases-de-dades.cnf', 'configs.conf', 'www.sites.d']

"""
import sys
import os

# ==========================================
# EXERCICI 2: Funció compta
# ==========================================
def compta(path):
    qfitxers = 0
    qdirec = 0
    
    if not os.path.exists(path):
        return 0, 0
        
    for element in os.listdir(path):
        ruta_completa = os.path.join(path, element)
        if os.path.isfile(ruta_completa):
            qfitxers += 1
        elif os.path.isdir(ruta_completa):
            qdirec += 1
            
    return qfitxers, qdirec

# ==========================================
# EXERCICI 3: Funció trobaPerInicial
# ==========================================
def trobaPerInicial(path, inicial):
    if not os.path.exists(path):
        return []
        
    # Retorna llista amb elements que comencen per la inicial indicada
    return [f for f in os.listdir(path) if f.startswith(inicial)]

# ==========================================
# EXERCICI 4: Funció trobaNoInicial
# ==========================================
def trobaNoInicial(path, inicial, limit):
    if not os.path.exists(path):
        return []
        
    resultat = []
    for f in os.listdir(path):
        # Si NO comença per la inicial, l'afegim
        if not f.startswith(inicial):
            resultat.append(f)
            # Comprovem si hem arribat al límit
            if len(resultat) >= limit:
                break
                
    return resultat

# ==========================================
# EXERCICI 1: Control d'arguments principal
# ==========================================
def main():
    args = sys.argv[1:]
    
    if not args:
        print("Error: Falten paràmetres. Utilitza -h o --help per veure l'ajuda.")
        return

    argval = 0
    path = None
    inicial = None
    limit = None
    crida_igual = False
    crida_noigual = False

    while argval < len(args):
        arg = args[argval]
        
        # Ajuda
        if arg in ("-h", "--help"):
            print("Ús: python practica3.py [opcions]")
            print("  -p, --path <string>    Ruta del directori a analitzar.")
            print("  -i, --inicial <string> Text inicial a buscar.")
            print("  -l, --limit <int>      Límit d'elements a mostrar.")
            print("  --igual                Busca els elements que comencin per l'inicial.")
            print("  --noigual              Busca els elements que NO comencin per l'inicial.")
            print("  -h, --help             Mostra aquesta ajuda.")
            return
            
        # Paràmetre path
        elif arg in ("-p", "--path"):
            if argval + 1 < len(args):
                path = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar la ruta del directori per a -p/--path.")
                return
                
        # Paràmetre inicial
        elif arg in ("-i", "--inicial"):
            if argval + 1 < len(args):
                inicial = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar l'string per a -i/--inicial.")
                return
                
        # Paràmetre limit
        elif arg in ("-l", "--limit"):
            if argval + 1 < len(args):
                try:
                    limit = int(args[argval + 1])
                    argval += 2
                except ValueError:
                    print("Error: El valor per a -l/--limit ha de ser un enter numèric.")
                    return
            else:
                print("Error: Falta especificar la quantitat per a -l/--limit.")
                return
                
        # Paràmetres d'execució
        elif arg == "--igual":
            crida_igual = True
            argval += 1
            
        elif arg == "--noigual":
            crida_noigual = True
            argval += 1
            
        # Error genèric
        else:
            print(f"Error: Paràmetre '{arg}' no reconegut.")
            return

    # --- Execució de les funcions segons els paràmetres ---

    # Sempre que tinguem un path, podem mostrar el recompte de fitxers/directoris
    if path:
        qfitxers, qdirec = compta(path)
        print(f"[*] Anàlisi del directori '{path}': {qfitxers} fitxers i {qdirec} directoris.")

    # Opció --igual
    if crida_igual:
        if path is not None and inicial is not None:
            llista_igual = trobaPerInicial(path, inicial)
            print(f"\n[+] Resultat '--igual' (comencen per '{inicial}'):")
            print(llista_igual)
        else:
            print("\nError: Per utilitzar --igual calen els paràmetres -p/--path i -i/--inicial.")

    # Opció --noigual
    if crida_noigual:
        if path is not None and inicial is not None and limit is not None:
            llista_noigual = trobaNoInicial(path, inicial, limit)
            print(f"\n[-] Resultat '--noigual' (NO comencen per '{inicial}', límit {limit}):")
            print(llista_noigual)
        else:
            print("\nError: Per utilitzar --noigual calen els paràmetres -p/--path, -i/--inicial i -l/--limit.")

if __name__ == "__main__":
    main()
```
---
# RA3
## RA3 - Fitxers de text
```Python
"""
1- Crea un mètode **mostra**, que a partir d'un nom de fitxer, mostri el seu contingut per consola. Si el fitxer no és vàlid, ha de mostrar un missatge informatiu.
"""
def mostra(nom_fitxer):
    try:
        with open(nom_fitxer, 'r', encoding='utf-8') as f:
            contingut = f.read()
            print(contingut)
    except FileNotFoundError:
        print(f"Error: El fitxer '{nom_fitxer}' no existeix o no és vàlid.")
    except Exception as e:
        print(f"S'ha produït un error inesperat: {e}")
```
```Python
"""
2- Crea un mètode _**concatena**_, que a partir de dos fitxers, afegeixi el contingut del segon fitxer al primer fitxer. Si el segon fitxer no és vàlid, ha de mostrar un missatge informatiu.
"""
def concatena(fitxer1, fitxer2):
    # Validem primer el segon fitxer
    try:
        with open(fitxer2, 'r', encoding='utf-8') as f2:
            contingut_f2 = f2.read()
    except FileNotFoundError:
        print(f"Error: El segon fitxer '{fitxer2}' no és vàlid o no s'ha trobat.")
        return # Sortim de la funció si el fitxer 2 falla

    # Afegim el contingut al primer fitxer
    try:
        with open(fitxer1, 'a', encoding='utf-8') as f1:
            # Afegim un salt de línia previ per evitar que s'enganxi a l'última paraula
            f1.write("\n" + contingut_f2)
        print("S'ha concatenat el contingut correctament.")
    except Exception as e:
        print(f"Error en escriure al fitxer '{fitxer1}': {e}")
```
```Python
"""
3- Crea un mètode _**afegir**_, que escrigui el contingut d'una llista en un fitxer. S'ha de fer append, el contingut original del fitxer no s'ha d'esborrar.
"""
def afegir(llista, nom_fitxer):
    try:
        with open(nom_fitxer, 'a', encoding='utf-8') as f:
            for element in llista:
                f.write(str(element) + "\n")
        print("Contingut de la llista afegit correctament.")
    except Exception as e:
        print(f"S'ha produït un error: {e}")
```
```Python
"""
4- Crea un mètode _**escriuPos**_, que escrigui una frase en un fitxer, a una posició concreta. Si la posició és incorrecta, ha de mostrar un missatge informatiu.
"""
import os

def escriuPos(nom_fitxer, frase, posicio):
    # Validació bàsica de la posició numèrica
    if posicio < 0:
        print("Error: La posició no pot ser un número negatiu.")
        return

    # Validem que el fitxer existeixi per poder-ne llegir la mida
    if not os.path.exists(nom_fitxer):
        print(f"Error: El fitxer '{nom_fitxer}' no existeix.")
        return

    mida_fitxer = os.path.getsize(nom_fitxer)
    
    # Validem que la posició no estigui fora dels límits del fitxer
    if posicio > mida_fitxer:
        print(f"Error: La posició {posicio} és incorrecta. El fitxer només té {mida_fitxer} bytes.")
        return

    try:
        with open(nom_fitxer, 'r+', encoding='utf-8') as f:
            f.seek(posicio) # Ens movem a la posició indicada
            f.write(frase)  # Escrivim la frase sobreescrivint el que hi hagi en aquell punt
        print(f"Frase escrita a la posició {posicio}.")
    except Exception as e:
        print(f"S'ha produït un error: {e}")
```

---
## RA3 - Scripts i fitxers de text
```Python
"""
1- Crea un script que busqui una paraula dins d'un fitxer de text. Ha de mostrar la quantitat de vegades que ha trobat la paraula.
Ha d'admetre les següents opcions:
-f o --fitxer amb el nom del fitxer.
-p o --paraula amb la paraula que volem trobar.
--help o -h mostra un missatge informatiu del funcionament.
Ha de detectar correctament les opcions i paràmetres i mostrar-ne un missatge en cas de dades errònies. Si hi ha diverses opcions, les ha de gestionar totes.
S’ha de fer print, des del main, dels resultats retornats per les funcions.
"""
import sys
import os

def cercar_paraula(fitxer, paraula):
    try:
        with open(fitxer, 'r', encoding='utf-8') as f:
            contingut = f.read()
            ocurrencies = contingut.count(paraula)
            return ocurrencies
    except FileNotFoundError:
        return -1 # Retornem -1 per indicar que hi ha hagut un error

def usage():
    print("Ús: script1.py [opcions]")
    print("  -f, --fitxer <ruta>     Nom o ruta del fitxer de text on buscar.")
    print("  -p, --paraula <text>    Paraula que volem cercar.")
    print("  -h, --help              Mostra aquest missatge d'ajuda.")

def main():
    args = sys.argv[1:]
    
    if not args:
        print("Error: Falten paràmetres.")
        usage()
        return

    argval = 0
    fitxer = None
    paraula = None

    while argval < len(args):
        arg = args[argval]
        
        if arg in ("-h", "--help"):
            usage()
            return
            
        elif arg in ("-f", "--fitxer"):
            if argval + 1 < len(args):
                fitxer = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el nom del fitxer.")
                return
                
        elif arg in ("-p", "--paraula"):
            if argval + 1 < len(args):
                paraula = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar la paraula a cercar.")
                return
                
        else:
            print(f"Error: Paràmetre '{arg}' no reconegut.")
            usage()
            return

    # Validem que tenim totes les dades necessàries
    if fitxer is not None and paraula is not None:
        resultat = cercar_paraula(fitxer, paraula)
        if resultat == -1:
            print(f"Error: El fitxer '{fitxer}' no s'ha trobat.")
        else:
            print(f"La paraula '{paraula}' apareix {resultat} vegada/es al fitxer.")
    else:
        print("Error: Cal especificar tant el fitxer com la paraula.")

if __name__ == "__main__":
    main()
```
```Python
"""
2- Crea un script que insereixi una frase en un número de fila d'un fitxer de text. No ha de sobreescriure, ha de inserir a la fila indicada i conservar la resta de dades del fitxer.
Ha d'admetre les següents opcions:
-f o --fitxer amb el nom del fitxer.
-t o --text amb la frase que volem inserir.
-p o --pos amb el número de fila a on fer l'insert.
--help o -h mostra un missatge informatiu del funcionament.
Ha de detectar correctament les opcions i paràmetres i mostrar-ne un missatge en cas de dades errònies. Si hi ha diverses opcions, les ha de gestionar totes.
S’ha de fer print, des del main, dels resultats retornats per les funcions.
Exemple:
Si posició=0 i text="Con diez cañones por banda,"
Fitxer original:
viento en popa a toda vela,
no corta el mar, sino vuela
un velero bergantín;
Fitxer final:
Con diez cañones por banda,
viento en popa a toda vela,
no corta el mar, sino vuela
un velero bergantín;
"""
import sys
import os

def inserir_frase(fitxer, text, pos):
    try:
        # Llegim el contingut existent
        with open(fitxer, 'r', encoding='utf-8') as f:
            linies = f.readlines()
            
        # Assegurem que el text inserit tingui un salt de línia al final
        text_inserir = text + "\n"
        
        # Inserim a la llista (pos 0 és la primera línia)
        linies.insert(pos, text_inserir)
        
        # Sobreescrivim el fitxer amb la nova llista de línies
        with open(fitxer, 'w', encoding='utf-8') as f:
            f.writelines(linies)
            
        return True
    except FileNotFoundError:
        return False

def usage():
    print("Ús: script2.py [opcions]")
    print("  -f, --fitxer <ruta>   Nom del fitxer de text.")
    print("  -t, --text <text>     Frase que volem inserir.")
    print("  -p, --pos <int>       Número de fila a on fer l'inserció (0 = primera línia).")
    print("  -h, --help            Mostra aquest missatge d'ajuda.")

def main():
    args = sys.argv[1:]
    
    if not args:
        print("Error: Falten paràmetres.")
        usage()
        return

    argval = 0
    fitxer = None
    text = None
    pos = None

    while argval < len(args):
        arg = args[argval]
        
        if arg in ("-h", "--help"):
            usage()
            return
            
        elif arg in ("-f", "--fitxer"):
            if argval + 1 < len(args):
                fitxer = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el nom del fitxer.")
                return
                
        elif arg in ("-t", "--text"):
            if argval + 1 < len(args):
                text = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar la frase a inserir.")
                return
                
        elif arg in ("-p", "--pos"):
            if argval + 1 < len(args):
                try:
                    pos = int(args[argval + 1])
                    argval += 2
                except ValueError:
                    print("Error: La posició ha de ser un número enter.")
                    return
            else:
                print("Error: Falta especificar la posició.")
                return
                
        else:
            print(f"Error: Paràmetre '{arg}' no reconegut.")
            usage()
            return

    if fitxer is not None and text is not None and pos is not None:
        exit_status = inserir_frase(fitxer, text, pos)
        if exit_status:
            print(f"S'ha inserit la frase a la posició {pos} correctament.")
        else:
            print(f"Error: No s'ha pogut trobar o obrir el fitxer '{fitxer}'.")
    else:
        print("Error: Cal especificar el fitxer, el text i la posició.")

if __name__ == "__main__":
    main()
```
```Python
"""
3- Programa un script que creï un nou fitxer de text amb contingut de part d'un altre fitxer.
Ha d'admetre les següents opcions:
-o o --origen amb el nom del fitxer origen.
-d o --desti amb el nom del fitxer nou.
--liniai amb la primera línia que volem guardar, comptant des d'1.
--liniaf amb l'última línia que volem guardar, comptant des d'1.
--help o -h mostra un missatge informatiu del funcionament.
Ha de detectar correctament les opcions i paràmetres i mostrar-ne un missatge en cas de dades errònies. Si hi ha diverses opcions, les ha de gestionar totes.
S’ha de fer print, des del main, dels resultats retornats per les funcions.
Exemple:
Si liniai=2 i liniaf=3
Fitxer origen:
Con diez cañones por banda,
viento en popa a toda vela,
no corta el mar, sino vuela
un velero bergantín;
Fitxer nou:
viento en popa a toda vela,
no corta el mar, sino vuela
"""
import sys
import os

def guardar_tram_linies(origen, desti, liniai, liniaf):
    try:
        with open(origen, 'r', encoding='utf-8') as f_in:
            linies = f_in.readlines()
            
        # Adaptem els índexs naturals (1, 2, 3) a índexs de llista (0, 1, 2)
        linies_escollides = linies[liniai - 1 : liniaf]
        
        with open(desti, 'w', encoding='utf-8') as f_out:
            f_out.writelines(linies_escollides)
            
        return True
    except FileNotFoundError:
        return False

def usage():
    print("Ús: script3.py [opcions]")
    print("  -o, --origen <ruta>   Nom del fitxer origen.")
    print("  -d, --desti <ruta>    Nom del fitxer destí (nou).")
    print("  --liniai <int>        Primera línia a guardar (comptant des d'1).")
    print("  --liniaf <int>        Última línia a guardar (comptant des d'1).")
    print("  -h, --help            Mostra aquest missatge d'ajuda.")

def main():
    args = sys.argv[1:]
    
    if not args:
        print("Error: Falten paràmetres.")
        usage()
        return

    argval = 0
    origen = None
    desti = None
    liniai = None
    liniaf = None

    while argval < len(args):
        arg = args[argval]
        
        if arg in ("-h", "--help"):
            usage()
            return
            
        elif arg in ("-o", "--origen"):
            if argval + 1 < len(args):
                origen = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar l'origen.")
                return
                
        elif arg in ("-d", "--desti"):
            if argval + 1 < len(args):
                desti = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el destí.")
                return
                
        elif arg == "--liniai":
            if argval + 1 < len(args):
                try:
                    liniai = int(args[argval + 1])
                    if liniai < 1:
                        print("Error: La línia inicial ha de ser com a mínim 1.")
                        return
                    argval += 2
                except ValueError:
                    print("Error: La línia inicial ha de ser un número.")
                    return
            else:
                print("Error: Falta especificar --liniai.")
                return
                
        elif arg == "--liniaf":
            if argval + 1 < len(args):
                try:
                    liniaf = int(args[argval + 1])
                    argval += 2
                except ValueError:
                    print("Error: La línia final ha de ser un número.")
                    return
            else:
                print("Error: Falta especificar --liniaf.")
                return
                
        else:
            print(f"Error: Paràmetre '{arg}' no reconegut.")
            usage()
            return

    # Validem l'execució si hi ha totes les dades
    if origen is not None and desti is not None and liniai is not None and liniaf is not None:
        if liniai > liniaf:
            print("Error: La línia inicial no pot ser més gran que la final.")
            return
            
        exit_status = guardar_tram_linies(origen, desti, liniai, liniaf)
        if exit_status:
            print(f"Fitxer '{desti}' creat amb èxit amb les línies de la {liniai} a la {liniaf}.")
        else:
            print(f"Error: No s'ha trobat el fitxer d'origen '{origen}'.")
    else:
        print("Error: Cal especificar l'origen, el destí, la línia inicial i la final.")

if __name__ == "__main__":
    main()
```

---
## RA3 - Scripts i mysql
```Python
"""
1- Crea un script que donat un atleta ens mostri les seves marques:  
Ha d'admetre les següents opcions:  
-a o --atleta amb el nom de l'atleta  
--help o -h mostra un missatge informatiu del funcionament.  
Ha de detectar correctament les opcions i paràmetres i mostrar-ne un missatge en cas de dades errònies. Si hi ha diverses opcions, les ha de gestionar totes.
"""
import sys
import mysql.connector

def connectar_bd():
    # Adapta els paràmetres a la teva configuració de mariadb-server
    return mysql.connector.connect(
        host="localhost",
        user="el_teu_usuari",
        password="la_teva_password",
        database="atletisme"
    )

def obtenir_marques(nom_atleta):
    try:
        conn = connectar_bd()
        cursor = conn.cursor()
        # Consulta d'exemple. Adapta els noms de les taules i camps a la teva BD.
        sql = """SELECT m.prova, m.marca, m.data 
                 FROM marques m 
                 JOIN atletes a ON m.id_atleta = a.id 
                 WHERE a.nom = %s"""
        cursor.execute(sql, (nom_atleta,))
        resultats = cursor.fetchall()
        
        if resultats:
            print(f"\n--- Marques de {nom_atleta} ---")
            for fila in resultats:
                print(f"Prova: {fila[0]} | Marca: {fila[1]} | Data: {fila[2]}")
        else:
            print(f"No s'han trobat marques per a l'atleta '{nom_atleta}'.")
            
    except mysql.connector.Error as err:
        print(f"Error de base de dades: {err}")
    finally:
        if 'conn' in locals() and conn.is_connected():
            cursor.close()
            conn.close()

def usage():
    print("Ús: script_marques.py [opcions]")
    print("  -a, --atleta <nom>    Nom de l'atleta a consultar.")
    print("  -h, --help            Mostra aquest missatge d'ajuda.")

def main():
    args = sys.argv[1:]
    if not args:
        print("Error: Falten paràmetres.")
        usage()
        return

    argval = 0
    atleta = None

    while argval < len(args):
        arg = args[argval]
        
        if arg in ("-h", "--help"):
            usage()
            return
            
        elif arg in ("-a", "--atleta"):
            if argval + 1 < len(args):
                atleta = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el nom de l'atleta.")
                return
        else:
            print(f"Error: Paràmetre '{arg}' no reconegut.")
            usage()
            return

    if atleta is not None:
        obtenir_marques(atleta)
    else:
        print("Error: És obligatori especificar un atleta amb -a o --atleta.")

if __name__ == "__main__":
    main()
```
```Python
"""
2- Crea un script que inserti un nou atleta a la base de dades.
Ha d'admetre les següents opcions:
-n amb el num. llicencia
-a amb el nom de l'atleta
-e amb l'email de l'atleta
-t amb el telèfon de l'atleta
--help o -h mostra un missatge informatiu del funcionament.
Ha de detectar correctament les opcions i paràmetres i mostrar-ne un missatge en cas de dades errònies. Si hi ha diverses opcions, les ha de gestionar totes.
"""
import sys
import mysql.connector

def connectar_bd():
    return mysql.connector.connect(
        host="localhost",
        user="el_teu_usuari",
        password="la_teva_password",
        database="atletisme"
    )

def inserir_atleta(llicencia, nom, email, telefon):
    try:
        conn = connectar_bd()
        cursor = conn.cursor()
        sql = "INSERT INTO atletes (llicencia, nom, email, telefon) VALUES (%s, %s, %s, %s)"
        valors = (llicencia, nom, email, telefon)
        
        cursor.execute(sql, valors)
        conn.commit() # Molt important per confirmar l'escriptura
        
        print(f"Atleta inserit correctament. ID generat: {cursor.lastrowid}")
            
    except mysql.connector.Error as err:
        print(f"Error en inserir l'atleta: {err}")
    finally:
        if 'conn' in locals() and conn.is_connected():
            cursor.close()
            conn.close()

def usage():
    print("Ús: script_inserir.py [opcions]")
    print("  -n <num>      Número de llicència de l'atleta.")
    print("  -a <nom>      Nom de l'atleta.")
    print("  -e <email>    Correu electrònic.")
    print("  -t <tel>      Telèfon de contacte.")
    print("  -h, --help    Mostra aquest missatge.")

def main():
    args = sys.argv[1:]
    if not args:
        print("Error: Falten paràmetres.")
        usage()
        return

    argval = 0
    llicencia, nom, email, telefon = None, None, None, None

    while argval < len(args):
        arg = args[argval]
        
        if arg in ("-h", "--help"):
            usage()
            return
        elif arg == "-n":
            if argval + 1 < len(args):
                llicencia = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar la llicència.")
                return
        elif arg == "-a":
            if argval + 1 < len(args):
                nom = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el nom.")
                return
        elif arg == "-e":
            if argval + 1 < len(args):
                email = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar l'email.")
                return
        elif arg == "-t":
            if argval + 1 < len(args):
                telefon = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el telèfon.")
                return
        else:
            print(f"Error: Paràmetre '{arg}' no reconegut.")
            usage()
            return

    if all([llicencia, nom, email, telefon]):
        inserir_atleta(llicencia, nom, email, telefon)
    else:
        print("Error: Has d'especificar tots els camps (-n, -a, -e, -t).")

if __name__ == "__main__":
    main()
```
```Python
"""
3- Demana per teclat el nom d'una ciutat i executa la sentència "SELECT * FROM reunio WHERE lloc=%s". Mostra la quantitat de files obtingudes.
"""
import mysql.connector

def consultar_reunions_ciutat():
    ciutat = input("Introdueix el nom d'una ciutat: ")
    
    try:
        conn = mysql.connector.connect(
            host="localhost", user="el_teu_usuari", password="la_teva_password", database="atletisme"
        )
        cursor = conn.cursor()
        
        sql = "SELECT * FROM reunio WHERE lloc=%s"
        cursor.execute(sql, (ciutat,))
        
        # Obtenim totes les dades per poder-les comptar amb seguretat
        resultats = cursor.fetchall()
        quantitat_files = len(resultats)
        
        print(f"\nS'han trobat {quantitat_files} files per a la ciutat '{ciutat}'.")
        
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        if 'conn' in locals() and conn.is_connected():
            cursor.close()
            conn.close()

if __name__ == "__main__":
    consultar_reunions_ciutat()
```
```Python
"""
4- Modifica l'exercici 3, en cas de obtenir una quantitat de files > 0 mostra totes les dades amb un bucle.
"""
import mysql.connector

def consultar_i_mostrar_reunions():
    ciutat = input("Introdueix el nom d'una ciutat: ")
    
    try:
        conn = mysql.connector.connect(
            host="localhost", user="el_teu_usuari", password="la_teva_password", database="atletisme"
        )
        cursor = conn.cursor()
        
        sql = "SELECT * FROM reunio WHERE lloc=%s"
        cursor.execute(sql, (ciutat,))
        
        resultats = cursor.fetchall()
        quantitat_files = len(resultats)
        
        print(f"\nS'han trobat {quantitat_files} files per a la ciutat '{ciutat}'.")
        
        # Si la quantitat és més gran que 0, imprimim les dades
        if quantitat_files > 0:
            print("-" * 40)
            for fila in resultats:
                # Com que "SELECT *" retorna una tupla, la podem imprimir directament 
                # o formatejar segons com estigui dissenyada la taula
                print(fila)
            print("-" * 40)
            
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        if 'conn' in locals() and conn.is_connected():
            cursor.close()
            conn.close()

if __name__ == "__main__":
    consultar_i_mostrar_reunions()
```
---
## RA3 - Scripts i Sqlite

```Python
"""
1- Crea un script que donat un personatge ens mostri les seves batalles guanyades. 
Ha d'admetre les següents opcions: 
-c o --character amb el nom del personatge 
--help o -h mostra un missatge informatiu del funcionament. 
Ha de detectar correctament les opcions i paràmetres i mostrar-ne un missatge en cas de dades errònies. 
Si hi ha diverses opcions, les ha de gestionar totes.
"""
import sys
import sqlite3

def consultar_batalles(nom_personatge):
    try:
        conn = sqlite3.connect("dnd.db")
        cursor = conn.cursor()
        
        # Fem un JOIN per relacionar el nom del personatge amb l'ID del guanyador
        sql = """SELECT b.location, b.enemy 
                 FROM battles b 
                 JOIN characters c ON b.winner_id = c.id 
                 WHERE c.name = ?"""
        
        cursor.execute(sql, (nom_personatge,))
        resultats = cursor.fetchall()
        
        if resultats:
            print(f"\n--- Batalles guanyades per {nom_personatge} ---")
            for fila in resultats:
                print(f"Lloc: {fila[0]} | Enemic derrotat: {fila[1]}")
        else:
            print(f"No s'han trobat batalles guanyades per al personatge '{nom_personatge}'.")
            
    except sqlite3.Error as err:
        print(f"Error de base de dades: {err}")
    finally:
        if 'conn' in locals():
            conn.close()

def usage():
    print("Ús: script_batalles.py [opcions]")
    print("  -c, --character <nom>   Nom del personatge a consultar.")
    print("  -h, --help              Mostra aquest missatge d'ajuda.")

def main():
    args = sys.argv[1:]
    if not args:
        print("Error: Falten paràmetres.")
        usage()
        return

    argval = 0
    character = None

    while argval < len(args):
        arg = args[argval]
        
        if arg in ("-h", "--help"):
            usage()
            return
            
        elif arg in ("-c", "--character"):
            if argval + 1 < len(args):
                character = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el nom del personatge.")
                return
        else:
            print(f"Error: Paràmetre '{arg}' no reconegut.")
            usage()
            return

    if character is not None:
        consultar_batalles(character)

if __name__ == "__main__":
    main()
```
```Python
"""
2- Crea un script que insereixi un nou personatge a la [base de dades](https://aulavirtual.iesthosicodina.cat/moodle/mod/resource/view.php?id=218094 "Base de dades").
Ha d'admetre les següents opcions:
-i amb l’id del personatge
-c amb el nom del personatge
--help o -h mostra un missatge informatiu del funcionament.
Ha de detectar correctament les opcions i paràmetres i mostrar-ne un missatge en cas de dades errònies.
Si hi ha diverses opcions, les ha de gestionar totes.
"""
import sys
import sqlite3

def inserir_personatge(id_personatge, nom_personatge):
    try:
        conn = sqlite3.connect("dnd.db")
        cursor = conn.cursor()
        
        sql = "INSERT INTO characters (id, name) VALUES (?, ?)"
        cursor.execute(sql, (id_personatge, nom_personatge))
        conn.commit() 
        
        print(f"S'ha inserit correctament el personatge '{nom_personatge}' amb l'ID {id_personatge}.")
            
    except sqlite3.Error as err:
        print(f"Error en inserir el personatge: {err}")
    finally:
        if 'conn' in locals():
            conn.close()

def usage():
    print("Ús: script_inserir.py [opcions]")
    print("  -i <id>       Identificador (número) del personatge.")
    print("  -c <nom>      Nom del personatge.")
    print("  -h, --help    Mostra aquest missatge.")

def main():
    args = sys.argv[1:]
    if not args:
        print("Error: Falten paràmetres.")
        usage()
        return

    argval = 0
    id_personatge = None
    nom_personatge = None

    while argval < len(args):
        arg = args[argval]
        
        if arg in ("-h", "--help"):
            usage()
            return
            
        elif arg == "-i":
            if argval + 1 < len(args):
                try:
                    id_personatge = int(args[argval + 1])
                    argval += 2
                except ValueError:
                    print("Error: L'ID ha de ser un número.")
                    return
            else:
                print("Error: Falta especificar l'ID.")
                return
                
        elif arg == "-c":
            if argval + 1 < len(args):
                nom_personatge = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el nom del personatge.")
                return
                
        else:
            print(f"Error: Paràmetre '{arg}' no reconegut.")
            usage()
            return

    if id_personatge is not None and nom_personatge is not None:
        inserir_personatge(id_personatge, nom_personatge)
    else:
        print("Error: Has d'especificar tant l'ID (-i) com el nom (-c).")

if __name__ == "__main__":
    main()
```
```Python
"""
3- Demana per teclat un nivell de dificultat i executa la sentència:
"SELECT * FROM quests WHERE difficulty=?"
Mostra la quantitat de files obtingudes.
"""
import sqlite3

def consultar_quests():
    try:
        dificultat = int(input("Introdueix el nivell de dificultat numèric: "))
        
        conn = sqlite3.connect("dnd.db")
        cursor = conn.cursor()
        
        sql = "SELECT * FROM quests WHERE difficulty=?"
        cursor.execute(sql, (dificultat,))
        
        # Recuperem totes les files
        resultats = cursor.fetchall()
        
        print(f"\nS'han obtingut {len(resultats)} files amb dificultat {dificultat}.")
        
    except ValueError:
        print("Error: Has d'introduir un número enter.")
    except sqlite3.Error as err:
        print(f"Error de base de dades: {err}")
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    consultar_quests()
```
```Python
"""
4- Modifica l’exercici 3, en cas d’obtenir una quantitat de files > 0 mostra totes les dades amb un bucle.
"""
import sqlite3

def consultar_i_mostrar_quests():
    try:
        dificultat = int(input("Introdueix el nivell de dificultat numèric: "))
        
        conn = sqlite3.connect("dnd.db")
        cursor = conn.cursor()
        
        sql = "SELECT * FROM quests WHERE difficulty=?"
        cursor.execute(sql, (dificultat,))
        
        resultats = cursor.fetchall()
        quantitat_files = len(resultats)
        
        print(f"\nS'han obtingut {quantitat_files} files amb dificultat {dificultat}.")
        
        if quantitat_files > 0:
            print("-" * 50)
            print("ID | Nom Missió | Dificultat | ID Guanyador")
            print("-" * 50)
            for fila in resultats:
                # Al fer un "SELECT *", ens retorna la tupla sencera per cada registre
                # L'estructura de 'quests' és: id, name, difficulty, winner_id
                print(f"{fila[0]} | {fila[1]} | {fila[2]} | {fila[3]}")
            print("-" * 50)
            
    except ValueError:
        print("Error: Has d'introduir un número enter.")
    except sqlite3.Error as err:
        print(f"Error de base de dades: {err}")
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    consultar_i_mostrar_quests()
```
---
## RA3 - EX1
### Fitxer 1
```Python
"""
1-(2,5p) Crea un script practica1_1.py que admeti els següents paràmetres:
-p o --path necessita un paràmetre string amb un nom de fitxer
-i o --inicial necessita un paràmetre string amb una lletra
-c
-h o --help
Ha de detectar correctament les opcions i paràmetres i mostrar-ne un missatge si n’hi ha cap
dada errònia.
Hi haurà també les següents funcions (aquestes funcions no fan res de moment):
def trobaPerInicial(nomfitxer, inicial):
return []
def compta(nomfitxer):
return 0
Per cada cas, ha de fer la crida a la funció corresponent:
-i o --inicial crida a la funció trobaPerInicial(nomfitxer, inicial)
-c crida a la funció compta(nomfitxer)
-h o --help ha de mostrar un missatge informatiu dels paràmetres vàlids.
Si hi ha diversos paràmetres, els ha de gestionar tots.
S’ha de fer print dels resultats retornats per les funcions.

2-(2,5p) Crea la funció compta(nomfitxer). Aquesta funció ha de retornar la quantitat de línies de
text que té un fitxer.
Exemple:
qlinies = compta("/home/user/proves.txt")

3-(2,5p) Crea la funció trobaPerInicial(nomfitxer, inicial). Aquesta funció ha de retornar una llista
amb totes les paraules del fitxer què comencin per la lletra indicada.
Exemple:
llista = trobaPerInicial("/home/user/proves.txt", "X")
print(llista)
['Xarxa', 'Xemeneia', 'Xocolata']

4-(2,5p) Crea un script practica1_2.py que admeti els següents paràmetres:
-o o --origen necessita un paràmetre string amb un nom de fitxer
-d o --desti necessita un paràmetre string amb un nom de fitxer
-h o --help
Ha de detectar correctament les opcions i paràmetres i mostrar-ne un missatge si n’hi ha cap
dada errònia.
Comportament:
-h o --help ha de mostrar un missatge informatiu dels paràmetres vàlids.
Amb paràmetres origen i desti, ha de fer una còpia del fitxer origen en el fitxer destí. La còpia s’ha
de fer línia a línia. NO s’ha de fer servir la biblioteca shutil.
Ha de mostrar un missatge informatiu sobre el resultat de la còpia.
"""
import sys
import os

# ==========================================
# EXERCICI 2: Funció compta
# ==========================================
def compta(nomfitxer):
    try:
        quantitat_linies = 0
        with open(nomfitxer, 'r', encoding='utf-8') as f:
            for linia in f:
                quantitat_linies += 1
        return quantitat_linies
    except FileNotFoundError:
        print(f"Error: El fitxer '{nomfitxer}' no existeix.")
        return 0
    except Exception as e:
        print(f"Error inesperat llegint el fitxer: {e}")
        return 0

# ==========================================
# EXERCICI 3: Funció trobaPerInicial
# ==========================================
def trobaPerInicial(nomfitxer, inicial):
    llista_paraules = []
    try:
        with open(nomfitxer, 'r', encoding='utf-8') as f:
            for linia in f:
                # Separem la línia per espais per obtenir les paraules
                paraules = linia.split()
                for paraula in paraules:
                    # Comprovem si comença per la lletra indicada (distingeix maj/min)
                    if paraula.startswith(inicial):
                        llista_paraules.append(paraula)
        return llista_paraules
    except FileNotFoundError:
        print(f"Error: El fitxer '{nomfitxer}' no existeix.")
        return []
    except Exception as e:
        print(f"Error inesperat llegint el fitxer: {e}")
        return []

# ==========================================
# EXERCICI 1: Control d'arguments principal
# ==========================================
def usage():
    print("Ús: python practica1_1.py [opcions]")
    print("  -p, --path <string>     Nom del fitxer de text (obligatori per a les funcions).")
    print("  -i, --inicial <lletra>  Busca les paraules que comencin per aquesta lletra.")
    print("  -c                      Compta la quantitat de línies del fitxer.")
    print("  -h, --help              Mostra aquest missatge d'ajuda.")

def main():
    args = sys.argv[1:]
    
    if not args:
        print("Error: Falten paràmetres.")
        usage()
        return

    argval = 0
    path = None
    inicial = None
    crida_c = False

    while argval < len(args):
        arg = args[argval]
        
        if arg in ("-h", "--help"):
            usage()
            return
            
        elif arg in ("-p", "--path"):
            if argval + 1 < len(args):
                path = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el nom del fitxer (-p/--path).")
                return
                
        elif arg in ("-i", "--inicial"):
            if argval + 1 < len(args):
                inicial = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar la lletra inicial (-i/--inicial).")
                return
                
        elif arg == "-c":
            crida_c = True
            argval += 1
            
        else:
            print(f"Error: Paràmetre '{arg}' no reconegut.")
            usage()
            return

    # Execució de funcions basades en els paràmetres
    
    if path is None and (crida_c or inicial is not None):
        print("Error: Has d'especificar un fitxer amb -p o --path per poder executar -c o -i.")
        return

    # Crida a la funció compta
    if crida_c:
        qlinies = compta(path)
        print(f"El fitxer '{path}' té {qlinies} línies.")

    # Crida a la funció trobaPerInicial
    if inicial is not None:
        llista_inicials = trobaPerInicial(path, inicial)
        print(f"Paraules que comencen per '{inicial}':")
        print(llista_inicials)

if __name__ == "__main__":
    main()
```
### Fitxer 2
```Python
import sys

def usage():
    print("Ús: python practica1_2.py [opcions]")
    print("  -o, --origen <string>  Nom del fitxer d'origen.")
    print("  -d, --desti <string>   Nom del fitxer de destí.")
    print("  -h, --help             Mostra aquest missatge d'ajuda.")

def main():
    args = sys.argv[1:]
    
    if not args:
        print("Error: Falten paràmetres.")
        usage()
        return

    argval = 0
    origen = None
    desti = None

    while argval < len(args):
        arg = args[argval]
        
        if arg in ("-h", "--help"):
            usage()
            return
            
        elif arg in ("-o", "--origen"):
            if argval + 1 < len(args):
                origen = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el fitxer d'origen.")
                return
                
        elif arg in ("-d", "--desti"):
            if argval + 1 < len(args):
                desti = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el fitxer de destí.")
                return
                
        else:
            print(f"Error: Paràmetre '{arg}' no reconegut.")
            usage()
            return

    # Validació de dades necessàries
    if origen is None or desti is None:
        print("Error: És obligatori especificar tant el fitxer d'origen com el de destí.")
        return

    # Procés de còpia línia a línia
    try:
        with open(origen, 'r', encoding='utf-8') as f_in:
            with open(desti, 'w', encoding='utf-8') as f_out:
                for linia in f_in:
                    f_out.write(linia)
                    
        print(f"Èxit: S'ha copiat el contingut de '{origen}' a '{desti}' correctament.")
        
    except FileNotFoundError:
        print(f"Error: El fitxer d'origen '{origen}' no s'ha trobat.")
    except Exception as e:
        print(f"S'ha produït un error durant la còpia: {e}")

if __name__ == "__main__":
    main()
```

---
## RA3 - EX2
```Python
"""
1-(2,5p) Prepara un script per tal que admeti les següents opcions:
-u o --usuari usuari d’accés
-p o --passwd contrasenya d’accés
-c o --character nom del personatge a trobar

Ha de connectar-se a la base de dades dnd, fent servir l’usuari i contrasenya indicats a les opcions.

Haurà de mostrar les batalles guanyades pel personatge indicat. Executarà la sentència següent:

"SELECT location, enemy FROM battles INNER JOIN characters ON characters.id=battles.winner_id WHERE name=%s"

Ha de mostrar tots els resultats obtinguts en línies separades. Si no n’hi ha cap resultat haurà de mostrar el
missatge «Sense dades disponibles».

Exemple: si el personatge és ‘Aragorn’
Minas Tirith, Orc Captain
Helm’s Deep, Uruk-hai
Mordor, Nazgul


2-(2,5p) Crea una funció quests, que trobi les missions que ha completat un personatge, aquesta funció
tindrà dos paràmetres: bd amb la connexió de la base de dades i un nom de personatge.

Executarà la sentència:

"SELECT quests.name, difficulty FROM quests INNER JOIN characters ON characters.id=quests.winner_id WHERE characters.name=%s"

Si falla la connexió haurà de retornar False, si no hi ha dades ha de retornar None, en altre cas retornarà
una llista amb les dades obtingudes.


3-(2,5p) Crea una funció items, que trobi els objectes diferents que té un personatge, aquesta funció
tindrà dos paràmetres: bd amb la connexió de la base de dades i un nom de personatge.

Executarà la sentència:

"SELECT DISTINCT items.name FROM items INNER JOIN inventory ON items.id=inventory.item_id INNER JOIN characters ON characters.id=inventory.character_id WHERE characters.name=%s"

Si falla la connexió o no hi ha cap objecte, haurà de mostrar un missatge «Sense dades disponibles», en altre
cas mostrarà tots els resultats obtinguts en línies separades. Aquesta funció no retorna res.


4-(2,5p) Afegeix dues opcions noves a l’script:

--quests mostra les missions completades pel personatge
--items mostra els objectes del personatge

Amb l’opció quests s’ha de fer una crida a la funció quests i mostrar per consola les dades de la llista
obtinguda o un missatge indicant si hi ha hagut algun error.

Amb l’opció items, s’ha de fer una crida a la funció items, aquesta funció ja s’encarrega de visualitzar el
resultat.
"""
import sys
import mysql.connector

# ==========================================
# EXERCICI 2: Funció quests
# ==========================================
def quests(bd, personatge):
    try:
        # Comprovem si la connexió és vàlida
        if not bd or not bd.is_connected():
            return False
            
        cursor = bd.cursor()
        sql = "SELECT quests.name, difficulty FROM quests INNER JOIN characters ON characters.id=quests.winner_id WHERE characters.name=%s"
        cursor.execute(sql, (personatge,))
        resultats = cursor.fetchall()
        cursor.close()
        
        # Si no hi ha dades, retornem None
        if len(resultats) == 0:
            return None
            
        # Si hi ha dades, retornem la llista
        return resultats
        
    except Exception:
        # Qualsevol error (de connexió o d'execució SQL) retorna False
        return False

# ==========================================
# EXERCICI 3: Funció items
# ==========================================
def items(bd, personatge):
    try:
        if not bd or not bd.is_connected():
            print("Sense dades disponibles")
            return
            
        cursor = bd.cursor()
        sql = "SELECT DISTINCT items.name FROM items INNER JOIN inventory ON items.id=inventory.item_id INNER JOIN characters ON characters.id=inventory.character_id WHERE characters.name=%s"
        cursor.execute(sql, (personatge,))
        resultats = cursor.fetchall()
        cursor.close()
        
        if len(resultats) == 0:
            print("Sense dades disponibles")
        else:
            # Imprimim cada resultat en una línia separada
            for fila in resultats:
                print(fila[0])
                
    except Exception:
        print("Sense dades disponibles")

# ==========================================
# EXERCICI 1 i 4: Control d'arguments i Main
# ==========================================
def usage():
    print("Ús: python script_dnd.py [opcions]")
    print("  -u, --usuari <nom>      Usuari d'accés a la BD.")
    print("  -p, --passwd <clau>     Contrasenya d'accés.")
    print("  -c, --character <nom>   Nom del personatge a trobar.")
    print("  --quests                Mostra les missions completades pel personatge.")
    print("  --items                 Mostra els objectes del personatge.")
    print("  -h, --help              Mostra aquest missatge d'ajuda.")

def main():
    args = sys.argv[1:]
    
    if not args:
        usage()
        return

    argval = 0
    user = None
    passwd = None
    char = None
    show_quests = False
    show_items = False

    # Procés de lectura manual d'arguments
    while argval < len(args):
        arg = args[argval]
        
        if arg in ("-h", "--help"):
            usage()
            return
            
        elif arg in ("-u", "--usuari"):
            if argval + 1 < len(args):
                user = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar l'usuari.")
                return
                
        elif arg in ("-p", "--passwd"):
            if argval + 1 < len(args):
                passwd = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar la contrasenya.")
                return
                
        elif arg in ("-c", "--character"):
            if argval + 1 < len(args):
                char = str(args[argval + 1])
                argval += 2
            else:
                print("Error: Falta especificar el personatge.")
                return
        elif arg == "--quests":
            show_quests = True
            argval += 1
        elif arg == "--items":
            show_items = True
            argval += 1
        else:
            print(f"Valor {arg} no existeix.")
            usage()
            return

    # Si tenim les credencials i el personatge, establim la connexió
    if user is not None and passwd is not None and char is not None:
        bd = None
        try:
            bd = mysql.connector.connect(
                host="localhost",
                user=user,
                password=passwd,
                database="dnd"
            )
            # --- Execució Exercici 1 (Batalles) ---
            print(f"\n--- Batalles de {char} ---")
            cursor = bd.cursor()
            sql_battles = "SELECT location, enemy FROM battles INNER JOIN characters ON characters.id=battles.winner_id WHERE name=%s"
            cursor.execute(sql_battles, (char,))
            batalles = cursor.fetchall()
            cursor.close()
            if not batalles:
                print("Sense dades disponibles")
            else:
                for b in batalles:
                    print(f"{b[0]}, {b[1]}")
            
            # --- Execució Exercici 4 (Opcions Extres) ---
            if show_quests:
                print(f"\n--- Missions completades per {char} ---")
                res_quests = quests(bd, char)
                if res_quests is False:
                    print("Hi ha hagut algun error amb la connexió o la consulta.")
                elif res_quests is None:
                    print("Sense dades disponibles")
                else:
                    for q in res_quests:
                        print(f"{q[0]} (Dificultat: {q[1]})")   
            if show_items:
                print(f"\n--- Objectes de {char} ---")
                # La funció ja s'encarrega d'imprimir el resultat directament
                items(bd, char)
                
        except mysql.connector.Error as err:
            print(f"Error connectant a la base de dades: {err}")
        finally:
            if bd is not None and bd.is_connected():
                bd.close()
    else:
        print("Error: Has d'indicar l'usuari (-u), la contrasenya (-p) i el personatge (-c).")

if __name__ == "__main__":
    main()
```
