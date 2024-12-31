#!/bin/bash 

#Corb ALexia - Gabriela 

test -f myfile.txt && echo "Fisierul exista" || (touch myfile.txt && echo "Fisierul a fost creat ");echo "Acesta este un fisier nou ">myfile.txt ;cat myfile.txt
