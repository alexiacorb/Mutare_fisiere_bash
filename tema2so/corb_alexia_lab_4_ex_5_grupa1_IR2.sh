#!/bin/bash

#Corb Alexia-Gabriela, grupa 1 

## adaugam o variabile valumask in care stocam val umask curenta
#folosim umask pentru a primi val curenta a umask 
# afisam cu ajutorul echo valoarea retinuta in variabila 
valumask=$(umask)
echo $valumask
# verificam daca val umask e 022 
# daca nu e ii setam valoarea cu umask 022 
# in verificare comparam cu 0022 pentru ca asa este reprezentat in memorie 
# daca comparam cu simplu 022 nu vom primi niciodata adevarat
if [[ $valumask == "0022" ]]; then 
	echo "umask este deja 022 "
else
        umask 0022 && echo "umask a fost setat la 022"
fi 

##folosim umask pt a verifica valoarea curenta umask pentru a ne asigura ca modificarile au fost facute daca era necesar 
umask

## Test rulat cu succes 
## 0002
## umask a fost setat la 022
## 0022

