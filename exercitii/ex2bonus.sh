#!/bin/bash 

#Corb Alexia -Gabriela 
df -h > disk_usage.txt
test -f disk_usage.txt && test $(ls disk_usage.txt | wc -l) -gt 0 && echo "Raport generat cu succes " || echo "Eroare"
