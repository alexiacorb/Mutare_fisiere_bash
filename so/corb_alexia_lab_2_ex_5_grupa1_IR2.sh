#!/usr/bin/bash

## Corb Alexia-Gabriela, grupa 1

## cream directorul de baza project
mkdir -p project
## ne pozitionam in directorul project
cd project
## cream 3 subdirectoare in directorul project
mkdir -p src
mkdir -p bin
mkdir -p obj 
## cream fisierul README.md in directorul project
touch README.md
## ne pozitionam in directorul src 
cd src
## cream fisierele cu ajutotul comenzii touch si a wildcard-urilor 
touch main.c
touch utils.c
touch utils.h

cd ..
tree 

## test rulat cu succes 
## rezultat obtinut 

## .
##├── bin
##├── obj
##├── README.md
##└── src
  #  ├── main.c
  #  ├── utils.c
  #  └── utils.h

#4 directories, 4 files
