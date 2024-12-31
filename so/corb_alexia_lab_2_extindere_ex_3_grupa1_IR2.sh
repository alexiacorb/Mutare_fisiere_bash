#!/usr/bin/bash

# Corb Alexia-Gabriela , grupa 1

#obtinem informatii despre utilizarea spatiului pe disc folosind df -h
# folosim comanda tee pentru a redirectiona atat in fisier cat si in STDOUT
df -h |tee disk_usage.txt

# folosim comanda grep pentru a cauta toate liniile care se potrivesc
# redirectionam rezultatul cu > in fisierul cerut 
grep "tmpfs" disk_usage.txt > tmpfs_usage.txt


## verificam daca fisierul e gol
## folosim comanda test -s care verifica daca dimensiunea fisierul >  0

test -s tmpfs_usage.txt && echo "Date despre tmpfs disponibile" || echo "Nu exista date despre tmpfs"
## folosim comanda free -h pentru utilizarea spatiului de swap
# folosim pipe ul pentru a extrage doar linia care contine swap
## redirectionam cu ajutorul comenzii >> in fisier
## folosim >> nu > pentru a evita suprascrierea fisierului 
free -h | grep "Swap" >> tmpfs_usage.txt

## verificam daca exista fisierul cu test - f si cu test - s verificam daca nu e gol

test -f errors.txt && test -s errors.txt && echo "Erori detectate" || echo "Executie complet fara erori"

## teste rulate cu succes
## STDOUT 
## Filesystem      Size  Used Avail Use% Mounted on
##tmpfs           392M  1.6M  390M   1% /run
##/dev/sda2        30G  6.6G   22G  24% /
##tmpfs           2.0G     0  2.0G   0% /dev/shm
##tmpfs           5.0M  8.0K  5.0M   1% /run/lock
##tmpfs           392M  136K  392M   1% /run/user/1000
##Date despre tmpfs disponibile
##Executie complet fara erori
 
#fisier disk_usage.txt
# Filesystem      Size  Used Avail Use% Mounted on
#tmpfs           392M  1.6M  390M   1% /run
#/dev/sda2        30G  6.6G   22G  24% /
#tmpfs           2.0G     0  2.0G   0% /dev/shm
#tmpfs           5.0M  8.0K  5.0M   1% /run/lock
#tmpfs           392M  136K  392M   1% /run/user/1000

# fisier tmpfs_usage.txt
#tmpfs           392M  1.6M  390M   1% /run
#tmpfs           2.0G     0  2.0G   0% /dev/shm
#tmpfs           5.0M  8.0K  5.0M   1% /run/lock
#tmpfs           392M  136K  392M   1% /run/user/1000
#Swap:          1.0Gi          0B       1.0G
