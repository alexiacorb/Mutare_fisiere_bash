#!/bin/bash

#Corb Alexia - Gabriela 

test -d test_dir && echo "Directorul exista"  || (mkdir -p test_dir && echo "Directorul a fost creat")
cd test_dir
test -f log.txt && echo "Fisierul exista in directorul dat " || (touch log.txt && echo "Fisierul log.txt a fost creat")
