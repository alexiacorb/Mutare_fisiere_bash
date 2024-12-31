#!/bin/bash
# Varianta 13 - Problema 4
# Scrieți un script care listează toate fișierele dintr-un director și redirecționează ieșirea într-un fișier, apoi numără câte linii sunt în acest fișier.

#Corb Alexia-Gabriela 

## folosim echo pentru a cere numele unui director 
## citim directorul cu read si stocam in variabila director 
echo "Introduceti numele unui director "
read director 

## folosim ls pentru a lista elementele din director 
## pentru a ne asigura ca preia doar fisierele din director dupa acetsa specificam *.txt adica tot ce se termina in txt 
## folosim > ca sa redirectionam spre fisier iesirea comenzii ls  
## folosim cat pentru a extrage continutul fisierului creat 
## folosim pipe ul | pentru a redirectiona elementele din fisier spre urmatoarea comanda 
# folosim wc -l pentru a numara cate fisiere avem in stocate in fisier (numara numarul de linii)
ls $director/*.txt >fisier.txt
cat fisier.txt | wc -l 
