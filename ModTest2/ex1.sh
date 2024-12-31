#!/bin/bash
#Cerinta - Primeste un director ca arg , vf daca e director , gaseste fisiere mai vechi de 30 de zile , salveaza numele lot intr un fisier 'old_files.txt'  
## stocam numele directorului in variabila nume_director
## folosim $1 pentru a extrage primul argument de pe linia de comanda 
nume_director=$1
## verificam daca e director cel specificat 
if [ ! -d $nume_director ]; then 
	## afisam un mesaj daca nu e director 
	echo "Argumentul specificat nu e director"
	exit 1 
fi 
##folosim find pentru a gasi in directorul specificat 
## folosim optiunea -type pentru a specifica tipul , f de la fisier 
## folosim optiunea -mtime ca sa specificam timpul de modificare
## +30 ca sa fie mai vechi de 30 de zile 
## folosim redirectionarea > pentru a pastra in fisier 
## folosim cut -d pentru a evita afisarea intregii caii si doar a numelui de fisier si cu -f specificam ca luam a 3 a coloana adica numele fisierului 
find $director -type f -mtime +30 | tr -s ' ' | cut -d '/' -f3 > old_files.txt 
