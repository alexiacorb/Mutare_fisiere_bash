#!/usr/bin/bash

## Corb Alexia-Gabriela , grupa 1 

## cod pe mai multe linii 
##touch disk_usage.txt
## df -h >disk_usage.txt && echo "Raportul a fost generat si salvat" || echo "Raportul nu a fost generat sau salvat"


## cream fisierul cu ajutorul functie touch
## afisam informatii de monitorizare pe disc folosind df -h
## redirectionam cu ajutorul operatorului > listarea la fisierul creat 

##  intrebare suplimentara - restrangem toate de mai sus pe o linie 
touch disk_usage.txt; df -h >disk_usage.txt && echo "Raportul a fost generat si salvat" || echo "Raportul nu a fost generat sau salvat"

## exemplu de testare 
## rezultatul obtinut 
## Raportul a fost generat si salvat  -- raspuns primit in consola
## rezultat obtinut in fisier 
## Filesystem      Size  Used Avail Use% Mounted on
##tmpfs           392M  1.7M  390M   1% /run
##/dev/sda2        30G  6.5G   22G  24% /
##tmpfs           2.0G     0  2.0G   0% /dev/shm
##tmpfs           5.0M  8.0K  5.0M   1% /run/lock
##tmpfs           392M  156K  392M   1% /run/user/1000

