#!/bin/bash

#Corb ALexia -Gabriela , grupa 1 

## folosim echo pentru a afisa un mesaj prin care ii cerem numele unui utilizator 
echo "Introduceti numele directorului"
## citim numele directorului si il stocam in director
read director 
# ne deplasam cu cd in directorul specificat 
cd $director 
## cream un hard link la fisierul specificat folosind ln 
## verificam daca exista deja pentru a nu primi eroare la rulari consecutive
if [ -f hard_link.txt ]; then 
	echo "Hard link ul exista deja "
else
	echo "Hard link creat "
	ln original.txt hard_link.txt
fi 
## cream un soft link folosind comanda ln -s 
if [ -f hard_link.txt ]; then 
        echo "Soft link ul exista deja "
else 
        echo "Soft link creat "
	ln -s original.txt soft_link.txt 

fi 

ln -s original.txt soft_link.txt 
## afisam inod ul pentru fisierul original folosind ls -i 
ls -i original.txt
## afisam inod ul pentru hard link folosind ls -i 
ls -i hard_link.txt 
## afisam inod ul pentru soft link 
ls -i soft_link.txt
### putem observa ca hard link ul si fisierul original au acelasi inode 
### putem observa de asemenea ca inode ul soft link ului este diferit de cel al fisierului original si al haard_link ului 

echo "Modificare pentru fisier" >original.txt 
## folosim cat pentru afisarea continutului fisierelor 
echo "Continutul fisierului original"
cat original.txt
echo "Continutul hard link ului "
cat hard_link.txt 
echo "Continutul soft link ului"
cat soft_link.txt

## prin rulare observam ca daca modificam continutul fisierului original se observa modificarile si in restul fisierelor 

## stergem fisierul original folsoind comanda rm 
echo "Stergem fisierul original"
rm original.txt
## afisam continutul hard linkului pentru a observa ca acesta ramane si dupa stergerea fisierului original
echo "Afisam continutul hard link ului dupa stergerea fisierului de baza precum si inod ul "
## folosim comanda cat pentru afisarea continutului 
cat hard_link.txt
# folosim ls -i pentru afisarea inod ului 
ls -i hard_link.txt 
## verificam daca mai exista soft_link ul ceea ce va fi fals 
## dupa steregerea fisierului original dispare si soft link ul 
## pe ramura else afisam un mesaj de eroare la STDERR cu comanda >&2
if [ -f soft_link.txt ]; then 
	cat soft_link.txt 
else
	 echo "Se genereaza o eroare daca incercam sa folosim cat pentru soft link , deoarece soft link ul nu mai exista dupa stergerea fisierului original" >&2
fi 

## Test de rulare cu succes 
## Introduceti numele directorului
## ex8
## Hard link creat 
## Soft link ul exista deja 
## 131184 original.txt
## 131184 hard_link.txt
##131185 soft_link.txt
##Continutul fisierului original
##Modificare pentru fisier
##Continutul hard link ului 
##Modificare pentru fisier
##Continutul soft link ului
##Modificare pentru fisier
##Stergem fisierul original
##Afisam continutul hard link ului dupa stergerea fisierului de baza precum si inod ul 
##Modificare pentru fisier
##131184 hard_link.txt
##Se genereaza o eroare daca incercam sa folosim cat pentru soft link , deoarece soft link ul nu mai exista dupa stergerea fisierului original

