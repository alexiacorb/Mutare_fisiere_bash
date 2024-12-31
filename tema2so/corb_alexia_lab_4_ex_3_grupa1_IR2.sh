#!/bin/bash

#Corb Alexia- Gabriela, grupa 1

##afisam un mesaj prin care ii cerem utilizatorului sa introduca numele unui director
echo "Introduceti numele unui director"

##citim directorul si l stocam in variabila director
read director 

# verificam cu if daca exista directorul cu numele pastrat in variabila
# pentru verificare folosim -d 
# daca nu exista cream fisierul cu mkdir 
if [ -d "$director" ]; then 
	echo "Directorul exista deja"
else 
	mkdir "$director" && echo "Directorul a fost creat"
fi

#ne deplasam in director 
cd "$director"
# cream cele 5 fisiere din director cu ajutorul comenzii touch 
# mai folosim si wildcard ul pentru a comprima comanda 
touch f{1,2,3,4,5}

## ne intoarcem in directorul parinte
cd ..

## adaugam permisiunile cerute in octal 
## pentru user avem permisiunile rwx de adaugat care in binar sunt 111 , iar in octal sunt 7 
## pentru group avem permisiunile r-x care in binar e 101, iar octal 5
## pentru other avem permisiunile r-x care in binar e 101, iar octal 5
chmod 755 "$director"

## afisam permisiunile directorului ls -ld si folosim comanda sudo pentru a avea dreptul de a primi aceste informatii 
sudo ls -ld "$director"

## afisam permisiunile fiecarui fisier din director cu comanda ls -l 
ls -l "$director"

# folosim stat -c "%a" pentru a extrage permisiunile in octal pt fiecare fisier 
# verificam daca permisiunile sunt cele cerute rw-r--r-- comparand cu val in octal 644
# am recurs la aceasta metoda deoarece la mine in sistem nu erau valorile implicite 
permisiunif1=$(stat -c "%a" "$director"/f1)

if [[ $permisiunif1  == 644 ]]; then 
	echo "Fisierul f1 are deja permisiunile cerute"
else
	chmod 644 "$director"/f1
fi

permisiunif2=$(stat -c "%a" "$director"/f2)

if [[ $permisiunif2  == 644 ]]; then 
        echo "Fisierul f2 are deja permisiunile cerute"
else
        chmod 644 "$director"/f2
fi

permisiunif3=$(stat -c "%a" "$director"/f3)

if [[ $permisiunif3  == 644 ]]; then 
        echo "Fisierul f3 are deja permisiunile cerute"
else
        chmod 644 "$director"/f3
fi

permisiunif4=$(stat -c "%a" "$director"/f4)

if [[ $permisiunif4  == 644 ]]; then 
        echo "Fisierul f4 are deja permisiunile cerute"
else
        chmod 644 "$director"/f4
fi

permisiunif5=$(stat -c "%a" "$director"/f5)

if [[ $permisiunif5  == 644 ]]; then 
        echo "Fisierul f5 are deja permisiunile cerute"
else
        chmod 644 "$director"/f5
fi

## mai afisam o data permisiunile pentru a verifica rezultatul obtinut
ls -l "$director"

## Exemple rulate cu succes 

## Exemplu 1 nu exista directorul
#Introduceti numele unui director
#sotest2
#Directorul a fost creat
#drwxr-xr-x 2 student student 4096 Oct 31 15:18 sotest2
#total 0
#-rw-rw-r-- 1 student student 0 Oct 31 15:18 f1
#-rw-rw-r-- 1 student student 0 Oct 31 15:18 f2
#-rw-rw-r-- 1 student student 0 Oct 31 15:18 f3
#-rw-rw-r-- 1 student student 0 Oct 31 15:18 f4
#-rw-rw-r-- 1 student student 0 Oct 31 15:18 f5
#total 0
#-rw-r--r-- 1 student student 0 Oct 31 15:18 f1
#-rw-r--r-- 1 student student 0 Oct 31 15:18 f2
#-rw-r--r-- 1 student student 0 Oct 31 15:18 f3
#-rw-r--r-- 1 student student 0 Oct 31 15:18 f4
#-rw-r--r-- 1 student student 0 Oct 31 15:18 f5

#exemplu 2 - directorul exista
#Introduceti numele unui director
#sotest2
#Directorul exista deja
#drwxr-xr-x 2 student student 4096 Oct 31 15:18 sotest2
#total 0
#-rw-r--r-- 1 student student 0 Oct 31 15:22 f1
#-rw-r--r-- 1 student student 0 Oct 31 15:22 f2
#-rw-r--r-- 1 student student 0 Oct 31 15:22 f3
#-rw-r--r-- 1 student student 0 Oct 31 15:22 f4
#-rw-r--r-- 1 student student 0 Oct 31 15:22 f5
#Fisierul f1 are deja permisiunile cerute
#Fisierul f2 are deja permisiunile cerute
#Fisierul f3 are deja permisiunile cerute
#Fisierul f4 are deja permisiunile cerute
#Fisierul f5 are deja permisiunile cerute
#total 0
#-rw-r--r-- 1 student student 0 Oct 31 15:22 f1
#-rw-r--r-- 1 student student 0 Oct 31 15:22 f2
#-rw-r--r-- 1 student student 0 Oct 31 15:22 f3
#-rw-r--r-- 1 student student 0 Oct 31 15:22 f4
#-rw-r--r-- 1 student student 0 Oct 31 15:22 f5

