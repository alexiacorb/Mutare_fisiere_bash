#!/bin/bash

#Corb ALexia-Gabriela , grupa 1 

# Varianta 13 - Problema 1
# Cum puteți adăuga conținut la un fișier existent fără a-l suprascrie?

#Pentru a adauga continut la un fisier existent fara al suprascrie putem folosi redirectionarea iesirii standard STDOUT in fisierul respectiv folosind >>. Spre deosebire de > care suprascrie continutul existent initial >> face append astfel incat continutul nou este adaugat celui vechi.

## exemplu 
## daca avem fisierul file.txt care contine Buna 
## daca folosim > pentru a redirectiona mesajul "Este marti " ar fi comanda echo 
## echo "Este marti" > file.txt -> rezultatul din file.txt ar fi doar "Este marti "
## daca folosim >>
## echo "Este marti" >> file.txt -> rezultatul din file.txt ar fi "Buna " urmat de noul mesaj  "Este marti "

