#!/bin/bash
# Varianta 13 - Problema 6
# Scrieți un script care compară dimensiunile tuturor fișierelor din PATH, afișează doar fișierele care sunt mai mari decât 100 KB și creează un link simbolic pentru fiecare într-un director numit large_files.

#Corb Alexia-Gabriela , grupa 1 
## folosim for pentru a parcurge fisierele din PATH
## dimensiunea o extragem cu du -sh 
## folosim cut -d delimitator K pentru a extrage doar valoarea numerica -f specifica care parte 
## in if folosi  gt pentru a verifica daca e mai mare 
## folosim ln -s pentru a crea un link simbolic
for fisier in "$PATH"/*.txt; do 
	dimensiune=$(du -sh | cut -d "K" -f 1) 
	echo $dimensiune
	if [[ $dimensiune -gt 100 ]]; then 
		echo $fisier
		ln -s $fisier "large_files"/soft_link.txt
	fi

done 

ls large_files
