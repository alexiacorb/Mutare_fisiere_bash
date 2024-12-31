#!/bin/bash

#Corb Alexia

pozitie=1
nr_linii=$((cat fisier.txt) | wc -l)
for linie in $(cat fisier.txt); do 
	if [ ! $pozitie -eq $nr_linii ]; then 
	      if [ $((pozitie%2)) -eq 0 ]; then 
		echo 'TEST' | tr "\n" "+"
	      else
		echo $linie | tr '\n' '+' 
	      fi
	else
	      if [ $((pozitie%2)) -eq 0 ]; then 
                echo 'TEST' 
              else
                echo $linie
	      fi 
	fi
	((pozitie++))
done 
