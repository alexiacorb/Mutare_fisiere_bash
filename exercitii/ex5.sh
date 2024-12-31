#!/bin/bash 

#Corb Alexia - Gabriela 

mkdir -p project 
cd project 
mkdir -p src 
mkdir -p bin
mkdir -p obj 
touch README.md 
cd src 
touch {main.c,utils.c,utils.h}
cd ..
cd .. 
tree project 
