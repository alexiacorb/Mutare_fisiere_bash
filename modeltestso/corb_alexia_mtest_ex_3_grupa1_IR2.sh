#!/bin/bash 

#Corb Alexia-Gabriela , grupa 1 

## citim in variabila director numele directorului introdus de utilizator 
read director

## ne deplasam cu cd in directorul specificat 
cd "$director"

# parcurgem cu ajutorul for ului toate elementele de tip txt din folder 
# pentru a obtine fisierele .txt cu comanda ls *.txt
# extragem in nume_fisier doar numele fisierului fara extensie 
# atribuim numelui fisierului fisierul din care extragem cu ajutorul -f prima coloana si cu ajutorul -d alegem delimitatorul .
# cu ajutorul mv transformam numele fisierului in nume fara extensie.bak
for fisier in $(ls *.txt); do 
	nume_fisier=$(echo "$fisier" | cut -d '.' -f 1)
	mv "$fisier" "$nume_fisier.bak"
done 

cd ..
ls "$director"


### Test de rulare cu sucees
##folder
##f1.bak f2.bak	f3.bak	f4.bak

