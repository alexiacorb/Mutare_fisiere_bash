#!/bin/bash

#Corb Alexia-Gabriela , grupa 1

PS3="Introduceti o optiune"
# folosim select pentru a crea un meniu interactiv 
# folosim case pentru a merge pe o ramura in functie de valoarea optiunii 
# folosim loop uri de tio while 
# conditia din while folosita este true ceea ce va genera un ciclu infinit
# folosim ps -o %mem pentru a monitoriza memoria si %cppu pentru monitorizarea procesorului 
# in case folosim cazul * ca default in caz ca nu e respectat nici un altul 
select optiune in "Monitorizarea memoriei" "Monitorizarea procesorului" "Ambele"; do
	case $optiune in
 		"Monitorizarea memoriei")
		    while true; do 
			ps -o %mem
			sleep 5 
		    done
		    ;;
		"Monitorizarea procesorului")
		     while true; do 
                        ps -o %cpu
                        sleep 5 
                    done
		    ;; 
		"Ambele")
		   while true; do 
                        ps -o %cpu,%mem
                        sleep 5 
		  done
		    ;;
		*)
		    echo "Nu e o optiune valida"
		    ;;
	esac 
done 

## Teste de rulare cu succes 
## 1) Monitorizarea memoriei      3) Ambele
##2) Monitorizarea procesorului
##Introduceti o optiune 3
##%CPU %MEM
## 0.2  0.1
## 0.0  0.0
## 0.0  0.0
##%CPU %MEM
## 0.1  0.1
## 0.0  0.0
## 0.0  0.1
##%CPU %MEM
## 0.0  0.1
## 0.0  0.0
## 0.0  0.1
## ...........

##1) Monitorizarea memoriei      3) Ambele
#2) Monitorizarea procesorului
#Introduceti o optiune 2
#%CPU
# 0.1
# 0.0
# 0.0
#%CPU
# 0.0
# 0.0
# 0.0
#%CPU
# 0.0
# 0.0
# 0.0
#%CPU
# 0.0
# 0.0
# 0.0

