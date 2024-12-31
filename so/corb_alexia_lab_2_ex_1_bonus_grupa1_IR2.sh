#!/usr/bin/bash

## Corb Alexia-Gabriela, grupa 1 

## cod pe mai multe linii 
#mkdir -p backup/
#cd .
#cp *.txt backup
#cd backup/
#echo  "Au fost create urmatorul numar de fisiere: "; ls | wc -l 


## pentru inceput am realizat fiecare cerinta pe o linie separata 
## crearea directorului backup cu ajutorul functiei mkdir si -p pentru a ne asigura ca nu se genereaza o eroare daca exista deja 
# ne intoarcem in directorul parinte cu ajutorul comenzii cd .
## gasim toate fisierele de tip txt folosind patern ul *.txt.backup
## copiem toate fisierele care sunt de tip txt in directorul backup 
## ne pozitionam in directorul backup/ cu ajutorul cd 
## afisam cate fisiere au fost create in backup/ cu un mesja corespunzator
## folosim pipe ul | pentru a folosi ca input output ul oferit de ls 

## intrebare suplimentara- restrangere pe o singura linie
## putem restrange totul pe un rand cu ajutorul operatorului ; 
mkdir -p backup/ ; cd .; cp *.txt backup ; cd backup/; echo "Au fost create urmatorul numar de fisiere: "; ls | wc -l

## exemple de rulare cu succes 

## am testat pentru cazul in care am in directorul principal directorul backup si 3 fisiere de tip .txt 
## raspunsul primit a fost 
## Au fost create urmatorul numar de fisiere: 
## 3

## am testat pentru cazul in care nu am in directorul principal directorul backup si contine 2 fisiere txt 
## raspunsul primit a fost 
## Au fost create urmatorul numar de fisiere: 
## 2 
# in plus a fost creat si directorul 

