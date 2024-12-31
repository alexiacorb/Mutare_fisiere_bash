#!/bin/bash 
# Corb ALexia-Gabriela

echo "Meniu interactiv. Alegeti din urmatoarele optiun: "
echo "1. Afisarea informatiilor de pe disk "
echo "2. Stergerea fisierelor temporare"
echo "3. Incheie executia "

read optiune 

case $optiune in 
	1) df -h
	   ;;
	2) sudo rm -r /tmp/*
           ls /tmp
	   ;;
	3) echo "Sesiune incheiata. La revedere!"
	   ;;
	*) ;;
esac
