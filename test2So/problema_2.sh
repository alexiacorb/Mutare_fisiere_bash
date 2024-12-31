# #!/bin/bash
# Varianta 13 - Problema 2
# Scriptul va efectua prelucrări asupra unui fișier dat ca și argument (verificati numar corect argumente si existenta, cat si permisiunile!).
# Acesta va:
# 
# inlocui toate liniile care incep si se termina cu aceeasi litera cu șirul @@@
# sterge toate liniile care contin doar caractere numerice urmate de litere
# adauga, inaintea liniilor care contin doar spații, o linie mentionand timestamp-ul curent de pe sistem
# adauga, dupa liniile care contin cel puțin un cuvânt scris invers, o linie mentionand directorul curent al utilizatorului.
# De exemplu, pentru fisierul cu continutul urmator:
# 
# ana
# 123abc
# racecar
#       
# Continutul, dupa prelucrarile efectuate, va deveni:
# 
# @@@
# <output comanda date>
#       
# racecar
# current directory: <output comanda pwd>
# 
# Indicatie: nu e necesara parcurgerea linie cu linie a fisierului dat.


### verificam daca numarul de argumente este 1 (am introdus un director)

if [ $# -ne 1 ]; then 
	echo "Numar incorect de argumente"
	exit 1 
fi 

## pastram argumentul 1 numele directorului in variabila dir 
dir=$1

## verificam daca numele introdus reprezinta un director 
if [ ! -d $dir ]; then 
	echo "Nu exista directorul "
	exit 1
fi 

## verificam permisiunile 
if [ ! -r $dir ] || [ ! -w $dir]; then 
	echo "Nu exista permisiuni"
	exit 1

fi 

## folosim awk pentru a nu fi necesara parcurgrea intr un while a tuturor liniilor 
awk -v timestamp="$(date '+%Y-%m-%d %H:%M:%S')" -v user=$USER '{
	if ($0 ~ /^[a-zA-Z]*[a-zA-Z]$/){
		print "@@@"
		next;
	}
	if ($0 ~ /[a-zA-Z]*[0-9]*/){
		next;
	}
	print $0;
}' "$fisier" > tmpfile && mv tmpfile "$fisier"
