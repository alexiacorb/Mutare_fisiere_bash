#!/bin/bash
#Corb Alexia-Gabriela

#folosim mkdir pentru crearea directoarelor
#folosim cd pentru a ne deplasa in directorul dorit 
mkdir -p project

cd project 

mkdir -p src
mkdir -p bin

cd src 
# folosim touch pentru crearea fisierului 
touch main.sh 

#pentru inceput eliminam toate permisiunile 
# folosim varianta octala 000 pentru a mentiona 0 permisiuni pt fiecare grup de utilizatori : user , group , other
# adaugam permisiuni pentru fisier in varianta octala 

chmod 000 main.sh
chmod 754 main.sh

## afisam permisiunile pentru fisier pentru a verifica daca s a salvat 
ls -l main.sh

cd ..
cd bin

touch output.log

## folosim varianta simbolica de acordare a permisiunilor 
## stergem toate permisiunile pentru a ne asigura ca nu raman in plus 
# folosim denumirea grupului urmat de - si apoi ce permisiune stergem 
# pt a adauga permisiuni numele grupului + permisiune 
chmod u-rwx,g-rwx,o-rwx output.log
chmod u+rw,g+r,o+r output.log

ls -l output.log

## Exemplu rulat cu succes 
## -rwxr-xr-- 1 student student 0 Oct 31 16:27 main.sh
## -rw-r--r-- 1 student student 0 Oct 31 16:27 output.log

