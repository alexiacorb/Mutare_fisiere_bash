#!/bin/bash

#Corb Alexia-Gabriela, grupa 1 

## folosim comenzi succesive echo pentru a afisa comenzile meniului interactiv

echo "--------------Meniu interactiv de gestionare a permisiunilor ---------"
echo "Alegeti o optiune: "
echo "1. Verificarea permisiunilor actuale "
echo "2. Setarea permisiunilor la rwxr-xr-x"
echo "3. Setarea permisiunilor la rw-r--r--"
echo "4. Iesire"

#ii cerem cu echo utilizatorului sa introduca o alegere
echo "Introduceti o optiune"

#citim si stocam in variabila alegere optiunea aleasa 
read alegere

echo "Introduceti numele fisierului sau al directorului dorit"

read nume

#folosim case pentru construirea meniului interactiv
#in functie de val introdusa de utilizator in var nume se intra pe o ramura 
# cazul default este *
case $alegere in 
	1)  ## verificam daca exista fisierul cu comanda -f
	    ## afisam cu ls -l permisiunile fisierului 
	    if [ -f $nume ]; then
		echo "Numele introdus apartine unui fisier si are permisiunile: " 
		ls -l $nume
		fisier=1
	    else 
		## verificam daca exista directorul cu numele introdus cu comanda -d 
		## afisam cu ls -ld permisiunile directorului 
		if [ -d $nume ]; then
			echo "Numele apartine unui director si are permisiunile: "
			ls -ld $nume
			director=1   
	    	else 
			echo "Numele introdus nu apartine unui fisier sau director existent"
		fi
	    fi
	    ;;
	2)  ## modificam permisiunile fisierului sau directorului folosind chmod 
	    ## vom folosi permisiunile in format octal 
	    ## stergem permisiunile existente folosind codul 000 
	    ## adaugam permisiunile cerute 
	    chmod 000 $nume
	    chmod 755 $nume
	    if [[ "$fisier" -eq 1 ]]; then 
	    	echo "Permisiunile au fost adaugate" && ls -l $nume 
	    else
		echo "Permisiunile au fost adaugate" && ls -ld $nume 
	    fi  
	    ;;
	 3)  ## modificam permisiunile fisierului sau directorului folosind chmod 
            ## vom folosi permisiunile in format octal 
            ## stergem permisiunile existente folosind codul 000 
            ## adaugam permisiunile cerute 
            chmod 000 $nume
            chmod 644 $nume
      	    if [[ "fisier" -eq 1 ]]; then 
                echo "Permisiunile au fost adaugate" && ls -l $nume 
            else
                echo "Permisiunile au fost adaugate" && ls -ld $nume 
            fi  
            ;;
	4)  echo "Ati ajuns la iesire, la revedere!"
            ;;
	*)  echo "Alegere invalida"	
	    ;;

esac

#Teste rulate cu succes 
# exemplu comanda 1 - fisier

#--------------Meniu interactiv de gestionare a permisiunilor ---------
#Alegeti o optiune: 
#1. Verificarea permisiunilor actuale 
#2. Setarea permisiunilor la rwxr-xr-x
#3. Setarea permisiunilor la rw-r--r--
#4. Iesire
#Introduceti o optiune
#1
#Introduceti numele fisierului sau al directorului dorit
#test.txt
#Numele introdus apartine unui fisier si are permisiunile: 
#-rw-r--r-- 1 student student 0 Oct 30 19:15 test.txt

#exemplu comanda 2 director 

#--------------Meniu interactiv de gestionare a permisiunilor ---------
#Alegeti o optiune: 
#1. Verificarea permisiunilor actuale 
#2. Setarea permisiunilor la rwxr-xr-x
#3. Setarea permisiunilor la rw-r--r--
#4. Iesire
#Introduceti o optiune
#2
#Introduceti numele fisierului sau al directorului dorit
#testso
#Permisiunile au fost adaugate
#drwxr-xr-x 2 student student 4096 Oct 31 13:12 testso

#--------------Meniu interactiv de gestionare a permisiunilor ---------
#Alegeti o optiune: 
#1. Verificarea permisiunilor actuale 
#2. Setarea permisiunilor la rwxr-xr-x
#3. Setarea permisiunilor la rw-r--r--
#4. Iesire
#Introduceti o optiune
#3
#Introduceti numele fisierului sau al directorului dorit
#test.txt
#Permisiunile au fost adaugate
#-rw-r--r-- 1 student student 0 Oct 30 19:15 test.txt

#--------------Meniu interactiv de gestionare a permisiunilor ---------
#Alegeti o optiune: 
#1. Verificarea permisiunilor actuale 
#2. Setarea permisiunilor la rwxr-xr-x
#3. Setarea permisiunilor la rw-r--r--
#4. Iesire
#Introduceti o optiune
#4
#Introduceti numele fisierului sau al directorului dorit
#test.txt
#Ati ajuns la iesire, la revedere!
