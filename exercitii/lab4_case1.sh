#!/bin/bash 

#Corb ALexia - Gbariela 

echo "Meniu pentru manipularea unui fisier "
echo "1) Afiseaza continutul fisierului "
echo "2) Adauga text "
echo "3) Sterge fisierul "
echo "Introduceti numele unui fisier"
read fisier 

echo "Introduceti o optiune "

read optiune 

case $optiune in
	1) cat $fisier
	   ;;
	2) echo "Introduceti textul pe care vreti sa l adaugati in fisier"
	   read text 
	   echo $text >> $fisier 
	   ;;
	3) rm $fisier
	   ;;
	*) echo "Optiune invalida "
	   ;;
esac 
