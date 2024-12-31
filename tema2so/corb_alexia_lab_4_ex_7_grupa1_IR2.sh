#!/bin/bash

#Corb Alexia-Gabriela

# folosim umask pentru a determina si afisa valoarea curenta a umask ului 
umask

#folosim mkdir pt a crea directorul 
#folosim -p in cazul in care exista deja sa nu l mai creeze 
mkdir -p mydir && echo "Director creat cu succes " || echo "Directorul exista deja"

# ne pozitionam cu cd in directorul dorit
cd mydir 

#folosim touch pentru a crea un nou fisier 
touch myfile.txt && echo "Fisier creat cu succes " || echo "Fisierul exista deja "

# ne deplasam in directorul parinte folosind cd..
cd ..
#afisam cu ajutor ls -ld afisam permisiunile directorului
ls -ld mydir

cd mydir

#afisam cu ajutor ls -l afisam permisiunile fisierului
ls -l myfile.txt

# aplicam umask pt a spune care permisiuni sa fie sterse folosind notatia octala 
umask 077  
cd ..

ls -ld mydir

cd mydir 

ls -l myfile.txt

touch myfile2.txt 
ls -l myfile2.txt

#Exemple de teste rulate cu succes 
#0002
#Director creat cu succes 
#Fisier creat cu succes 
#drwxrwxr-x 2 student student 4096 Nov  1 17:27 mydir
#-rw-rw-r-- 1 student student 0 Nov  1 20:53 myfile.txt
#drwxrwxr-x 2 student student 4096 Nov  1 17:27 mydir
#-rw-rw-r-- 1 student student 0 Nov  1 20:53 myfile.txt
#-rw------- 1 student student 0 Nov  1 20:53 myfile2.txt


## am afisat permisiunile initiale ale directorului si a primului fisier inainte de aplicarea umask 
## am reafisat dupa setarea umask ului si am observat ca permisiunile au ramas la fel
## diferentele au aparut abia pentru urmatorul fisier creat 
## s-au aplicat pentru al doilea fisier doar permisiunie neregasite in umask 
## ca o concluzie observata aplicacrea umask ului se face doar pentru fisierele create dupa aplicarea sa 



