#!/bin/bash 

#Corb Alexia - Gabriela , grupa 1 

#folosim comanda id - u pentru a obtine UID ul 
# retinem valoarea UID ului in variabila uid 
## id -g ne ajuta sa obtinem GID ul si l stocam in variabila gid 
uid=$(id -u)
gid=$(id -g)

## afisam cu echo un mesaj prin care ii cerem utilizatorului numele unui director
echo "Introduceti numele unui director"
## citim directorul 
read director 
## ne deplasam cu cd in director
cd $director 
# parcurgem cu un for fisierele din director 
# pentru a obtine fisierele folosim ls care listeaza si * pentru a specifica tot 
for fisier in $(ls *); do 
	# verificam cu -f daca e fisier 
	if [ -f $fisier ]; then
		## extragem in uidf si gidf UID ul si GID ul fisierului curent
		## folosim stat  -c "%u" respectiv "%g" pentru a determina id ul 
		## am incercat initial sa folosesc U si G mare ca in laborator insa compara cu numele si era gresit pentru ca mi compara student cu 1000 
		uidf=$(stat -c "%u" $fisier)
		gidf=$(stat -c "%g" $fisier)
		## comparam UID ul si GID ul fisierului cu cel determinat la inceput 
		if [[ $uid == $uidf ]]; then
		     if [[ $gidf == $gid ]]; then
			chmod u+rwx, g+rwx $fisier
			echo "Aveti permisiunea de a accesa fisierul $fisier "
		     fi 
		else
			echo "Nu aveti acces la acest fisier !" >&2
		fi
	fi
done  

## Test rulat cu succes 
## Introduceti numele unui director
## testso
##Aveti permisiunea de a accesa fisierul f1 
##Aveti permisiunea de a accesa fisierul f2 
##Aveti permisiunea de a accesa fisierul f3 
##Aveti permisiunea de a accesa fisierul f4 
##Aveti permisiunea de a accesa fisierul f5 

