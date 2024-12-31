#!/usr/bin/bash

## Corb Alexia- Gabriela, grupa 1 

## folosim test - d sa verificam daca exista directorul , daca nu il cream si afisam mesajul corespunzator
## pentru a pune tot pe un rand folosim ;
#verificam daca  exista fisierul cu comanda test -f daca nu il cream cu touch
test -d test_dir && echo "Directorul exista deja" || (mkdir -p test_dir && echo "Directorul a fost creat") ; cd test_dir ; test -f log.txt && echo "Fisierul exista deja" || (touch log.txt && echo "Fisierul log.txt a fost creat")

## cazuri de testare 
## 1 - directorul si fisierul exista 
## Directorul exista deja
## Fisierul exista deja

## 2 - nici una nu exista inca 
## Directorul a fost creat
## Fisierul log.txt a fost creat

