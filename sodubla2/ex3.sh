#!/bin/bash 

#Corb Alexia 

echo "Introduceti numele unui director "

read director 
cd $director
for fisier in *.txt; do 
	nume_fisier=$(echo $fisier | cut -d  '.' -f 1)
	mv $fisier $nume_fisier.bak
done

cd ..
ls $director
