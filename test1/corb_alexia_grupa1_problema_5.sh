#!/bin/bash
# Varianta 13 - Problema 5
# Creați următoarea structură de directoare și fișiere, jumatate din permisiuni folosind notatia in octal, in timp ce celelalte vor folosi notatia simbolica:
#project/ [rwxr-x---]
# ├── docs/ [rwxr-xr-x] 
# │ └── report.txt [rw-r--r--]
# ├── src/ [rwx------] 
# │ └── main.c [rw-r-----]
#   └── build/ [rwxr-xr-x]
#    └── Makefile [rw-r--r--]


#Corb Alexia - Gabriela
# folosim mkdir pentru a crea directoare -p pentru a nu da eroare daca exista deja
#folosim chmod pentru a schimba permisiunile in format octal sau cu simboluri 
# cu cd ne deplasam in directorul dorit 
# cu tree afisam structura arborescenta ca si in exemplu  
mkdir -p project/
chmod 750 project/
cd project/
mkdir -p docs/
chmod 755 docs/
mkdir -p src/
chmod 700 src/
cd docs/
touch report.txt
chmod u=rw,g=r,o=r report.txt
cd ..
cd src
touch main.c
chmod u=rw,g=r main.c
mkdir -p build/
cd build/ 
chmod u=rwx,g=rx,o=rx build/
touch Makefile
chmod u=rw,g=r,o=r Makefile


cd ..
cd ..
cd ..

tree project/

