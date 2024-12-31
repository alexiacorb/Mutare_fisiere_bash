#!/bin/bash

#Corb Alexia-Gabriela , grupa 1 

#folosim mkdir pentru a crea directoare
mkdir -p project 

## eliminam toate permisiunile cu formatul octal 000 in combinatie cu chmod 
## adaugam permisiunile cerute 
chmod 000 project
chmod 750  project
ls -ld project

cd project 
## cream cu touch fisierul Makefile
touch Makefile

mkdir -p docs
chmod u-rwx,g-rwx,o-rwx docs
chmod u+rwx,g+rx,o+rx docs

## ls -ld pentru a afisa permisiunile de la director
ls -ld docs
mkdir -p src
chmod u-rwx,g-rwx,o-rwx src 
chmod u+rwx src

ls -ld src 

mkdir -p build 
chmod 000 build 
chmod 755 build 

ls -ld build

cd docs 
touch report.txt
chmod 000 report.txt
chmod 644 report.txt 
ls -l report.txt

cd ..
cd src
touch main.c 
chmod 000 main.c
chmod 640 main.c

ls -l main.c

cd ..
cd .. 
## folosim tree pentru afisarea structurii 
tree project

## Test rulat cu succes 
## drwxr-x--- 5 student student 4096 Nov  5 14:07 project
##drwxr-xr-x 2 student student 4096 Nov  5 13:54 docs
##drwx------ 2 student student 4096 Nov  5 13:54 src
##drwxr-xr-x 2 student student 4096 Nov  5 13:34 build
##-rw-r--r-- 1 student student 0 Nov  7 12:27 report.txt
##-rw-r----- 1 student student 0 Nov  7 12:27 main.c
##project
##├── build
##├── docs
##│   ├── main.c
##│   └── report.txt
##├── Makefile
##└── src
##    └── main.c

#4 directories, 4 files
 
