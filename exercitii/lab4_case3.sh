#!/bin/bash

#Corb Alexia - Gabriela 

echo "Meniu. Alegeti optiunea dorita"
echo "1. Afisarea fisierelor ascunse din directorul dat "
echo "2. Numara fisierele ascunse din directorul dat"
echo "3. Sterge un fisier ascuns "

echo "Alegeti o optiune"
read optiune 

case $optiune in 
	1) echo "Introduceti numele unui director"
	   read director 
	   ls -a $director
	   ;;
	2) echo "Introduceti numele directorului"
	   read director 
	   ls -a $director | wc -l
	   ;;
	3) echo "Introduceti numele fisierului "
	   read fisier_ascuns
	   rm $fisier_ascuns
	   ;;
	*) ;;
esac
