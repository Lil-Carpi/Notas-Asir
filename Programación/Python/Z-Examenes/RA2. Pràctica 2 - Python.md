
RA2. Pràctica 2

Agrupa tots els exercicis en un únic fitxer A02.2_Nom_Cogmon.py.

Els exercicis han de funcionar amb qualsevol conjunt de dades de prova
  

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