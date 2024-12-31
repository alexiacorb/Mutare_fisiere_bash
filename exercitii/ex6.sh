#!/bin/bash
#Corb Alexia-Gabriela 

test -f data.txt && echo "Fisierul exista " || echo "Fisierul nu exista "
echo "Introduceti un numar"
read numar

test $numar -gt 10 && echo "Numarul e mai mare decat 10 " || echo "Numarul e mai mic ca 10 "

test -f data.txt && test $numar -gt 10 && echo "Ambele adevarate" || echo "una e falsa " 
