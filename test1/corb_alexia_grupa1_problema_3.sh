#!/bin/bash
# Varianta 13 - Problema 3
# Scrieți un script care afișează ultimele 5 linii dintr-un fișier jurnal din /var/log.
#Corb Alexia-Gabriela , grupa 1 


## folosim cat pentru a accesa continutul fisierului specificat prin calea absoluta pentru ca incepe cu /
## folosum pipe ul pentru a trimite iesirea comenzii cat ca intrare pentru urm comanda 
## folosim tail -n pentru a afisa de la coada ultimele linii specificate
## in cazul de fata 5 linii 
cat /var/log/jurnal | tail -n 5 
