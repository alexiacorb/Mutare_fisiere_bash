#!/bin/bash

#Corb Alexia-Gabriela , grupa 1

## ne folosim de variabila de mediu USER pentru a extrage numele utilizatorului curent
nume_user=$USER

## folosim if in combinatie cu -f sa vedem daca exista fisierul executabil
## folosim ls -s pentru a crea un link simbolic 
if [[ -f "$nume_user".txt && -x "$nume_user".txt ]]; then 
	echo "Exista un fisier executabil in director cu acelasi nume "
	ln -s "$nume_user".txt "$HOME"/link_simbolic  
else 
	echo "Nu exista un astfel de fisier"
fi 

## folosim ls -l pentru a vedea toate elementele din home si a verifica crearea linkului simbolic
ls -l $HOME

## Test de rulare cu succes 
## Exista un fisier executabil in director cu acelasi nume 
#total 40
#drwxr-xr-x 6 student student 4096 Nov  6 22:30 Desktop
#drwxr-xr-x 2 student student 4096 Oct  8 05:54 Documents
#drwxr-xr-x 2 student student 4096 Nov  6 21:34 Downloads
#lrwxrwxrwx 1 student student   11 Nov  7 12:55 link_simbolic -> student.txt
#drwxr-xr-x 2 student student 4096 Oct  1 07:47 Music
#drwxr-xr-x 2 student student 4096 Oct  1 07:47 Pictures
#drwxrwxr-x 3 student student 4096 Oct  8 09:27 proiect
#drwxr-xr-x 2 student student 4096 Oct  1 07:47 Public
#drwx------ 5 student student 4096 Oct 11 13:16 snap
#drwxr-xr-x 2 student student 4096 Oct  1 07:47 Templates
#drwxr-xr-x 2 student student 4096 Oct  1 07:47 Videos

