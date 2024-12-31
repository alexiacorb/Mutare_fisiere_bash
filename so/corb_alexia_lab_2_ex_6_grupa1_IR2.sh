#!/usr/bin/bash

## Corb Alexia-Gabriela 

## verificam daca fisierul data.txt exista folosind comanda test -f
test -f data.txt && echo "Fisierul exista in directorul curent" || echo "Fisierul nu exista in directorul curent"
## in cazul in care exista afisam primul mesaj altfel cel de-al doilea
## ii cerem utilizatorului sa introduca un numar 
echo "Introduceti un numar"
## citim numarul introdus si l stocam in variabila numar
read -r numar

# verificam daca numarul e mai mare ca 10 
test $numar -gt 10 && echo "Numarul e mai mare ca 10" || echo "Numarul nu e mai mare ca 10"

## verificam daca ambele conditii sunt adevarate 
test $numar -gt 10 && test -f data.txt && echo "Ambele conditii sunt adevarate" 

## teste rulate cu succes 
## caz 1 exista fisierul data.txt si numarul e mai mare ca 10 (12) 
## rezultatul obtinut
## Fisierul exista in directorul curent
## Introduceti un numar
## 12
## Numarul e mai mare ca 10
## Ambele conditii sunt adevarate

## caz 2 fisierul nu exista , numarul e mai mare  
## Fisierul nu exista in directorul curent
## Introduceti un numar
## 12
## Numarul e mai mare ca 10

