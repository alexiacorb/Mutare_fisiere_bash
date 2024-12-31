#!/bin/bash 

#Corb Alexia-Gabriela , grupa 1

## verificam daca variabilele sunt definite folosind comanda -z (daca nu sunt goale) 
## daca nu sunt le oferim un mesaj cu valoare implicita 
## pe langa asignarea unei valori utilizam si comanda export pentru a o face vizibila pe toata sesiunea 
# daca sunt afisam un mesaj care confirma ca sunt setate 
## la final folosim comanda echo pentru afisarea celor 3 variabile

if [ -z "$PATH" ]; then 
	export PATH="Valoare implicita a lui path "
else
	echo "Variabila PATH e deja setata"
fi 

if [ -z "$HOME" ]; then 
        export HOME="Valoare implicita a lui home"
else
        echo "Variabila HOME e deja setata"
fi 

if [ -z "$USER" ]; then 
        export USER="Valoare implicita a lui user"
else
        echo "Variabila USER e deja setata"
fi 

echo $PATH
echo $HOME
echo $USER

#Test rulat cu succes 
##Variabila PATH e deja setata
##Variabila HOME e deja setata
##Variabila USER e deja setata
##/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin
##/home/student
##student


