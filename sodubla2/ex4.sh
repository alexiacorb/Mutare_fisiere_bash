#!/bin/bash 

#Corb Alexia 

echo "Introduceti un director"

read director 

ls $director 
du -sh $director/* | sort -h > sortat.txt
cat sortat.txt
