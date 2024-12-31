#!/bin/bash 

#Corb Alexia Gabriela 
if [ -d backup ]; then 
	echo "Directorul exista "
else 
	mkdir -p backup 
fi 

if [ $(ls -l backup | wc -l) -gt 0 ]; then 
	ls backup | wc -l
else
	echo "Directorul e gol"
fi 
