#!/bin/bash

#Corb ALexia -Gabriela

mkdir -p project
chmod 750 project
ls -ld project

cd project 
mkdir -p docs
chmod 755 docs
ls -ld docs  

mkdir -p src
chmod 700 src
ls -ld src 

mkdir -p build
chmod 755 build 
ls -ld build  

touch Makefile

cd docs 
touch report.txt
ls -l report.txt
cd ..


cd src 
touch main.c
cd .. 

cd ..
tree project
