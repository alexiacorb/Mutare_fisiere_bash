#!/bin/bash

#Corb Alexia-Gabriela 

read director 

ls $director

du -sh "$director"/* | sort -h >sortat.txt

cat sortat.txt

##test rulat cu succes 
## folder
#f1.bak	f2.bak	f3.bak	f4.bak
#0	folder/f4.bak
#4.0K	folder/f1.bak
#4.0K	folder/f2.bak
#4.0K	folder/f3.bak

