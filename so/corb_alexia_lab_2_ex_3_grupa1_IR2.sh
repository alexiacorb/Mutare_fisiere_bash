#!/usr/bin/bash

## Corb Alexia-Gabriela, grupa 1 
## cream directorul documents/ si folosim -p pentru a nu da eroare in caz ca deja exista (util la mai multe rulari)
mkdir -p documents/

## ne deplasam in documents/
cd documents/
## adaugam cu comanda touch fisiere goale si folosim wildcard pentru a face comanda mai compacta
touch {file1.txt,file2.txt,file3.txt}
## folosim comanda pentru a afisa toate fisierele din directorul curent 
ls 
## folosim | care poarta denumirea de pipe pentru a oferi ca input fisierele listate de ls
## folosim comanda wc -l pentru a numara cate fisiere exista 
## gasim numarul de fisiere numarand liniile afisate de ls 
ls | wc -l 

## test rulat cu succes 
## rezultatul obtinut e prezentat pe urmatoarele 2 randuri 
## file1.txt  file2.txt  file3.txt
## 3

