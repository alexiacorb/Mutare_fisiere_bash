#!/bin/bash

# Corb Alexia-Gabriela, grupa 1 
# afisam un mesaj prin care ii cerem utilizatorului un nume de fisier 
echo "Introduceti numele unui fisier"

# citim cu functia read si stocam in variabila fisier fisierul introdus de utilizator 
read -r fisier 
# afisam fisierul introdus de utilizator 
echo "Fisierul introdus de utilizator este  $fisier"

#afisam permisiunile pentru fisierul introdus cu ajutorul comenzii stat 
# stat functioneaza asemanator cu ls -l 
echo "Permisiunile pentru fisierul introdus sunt : "
stat -c "%A" $fisier

# extragem permisiunile cu comanda ls -l si le stocam in cadrul variabilei permisiuni
permisiuni=$(ls -l $fisier)

# verificam permisiunile pentru fiecare grup tinand cont de slicing si de pozitia la care se gaseste fiecare caracter
# ne raportam la formatul cu litere obtinut din ls -l 
# daca are permisiuni afisam un mesaj 
# altfel oferim permisiuni cu chmod 
# chmod foloseste ca parametri utilizatorul la care se refera (user, group, other) si dupa permisiunea oferita precedata de + (r- citire, w- scriere, x- executare)
if [ "${permisiuni:1:1}" = "r" ]; then 
	echo "User are permisiuni de citire"
else 
	chmod u+r $fisier
fi 

if [ "${permisiuni:2:1}" = "w" ]; then 
        echo "User are permisiuni de scriere"
else 
        chmod u+w $fisier
fi 

if [ "${permisiuni:3:1}" = "x" ]; then 
        echo "User are permisiuni de executie"
else 
        chmod u+x $fisier
fi 

if [ "${permisiuni:4:1}" = "r" ]; then 
        echo "Group are permisiuni de citire"
else 
        chmod g+r $fisier
fi 

if [ "${permisiuni:5:1}" = "w" ]; then 
        echo "Group are permisiuni de scriere"
else 
        chmod g+w $fisier
fi 

if [ "${permisiuni:6:1}" = "x" ]; then 
        echo "Group are permisiuni de executie"
else 
        chmod g+x $fisier
fi 

if [ "${permisiuni:7:1}" = "r" ]; then 
        echo "Other are permisiuni de citire"
else 
        chmod o+r $fisier
fi 

if [ "${permisiuni:8:1}" = "w" ]; then 
        echo "Other are permisiuni de scriere"
else 
        chmod o+w $fisier
fi 

if [ "${permisiuni:9:1}" = "x" ]; then 
        echo "Other are permisiuni de executie"
else 
        chmod o+x $fisier
fi 

ls -l $fisier

## Exemple rulate cu succes 
#Introduceti numele unui fisier
#test.txt
#Fisierul introdus de utilizator este  test.txt
#Permisiunile pentru fisierul introdus sunt : 
#-rw-rw-r--
#User are permisiuni de citire
#User are permisiuni de scriere
#Group are permisiuni de citire
#Group are permisiuni de scriere
#Other are permisiuni de citire
#-rwxrwxrwx 1 student student 0 Oct 30 19:15 test.txt

#Introduceti numele unui fisier
#test.txt
#Fisierul introdus de utilizator este  test.txt
#Permisiunile pentru fisierul introdus sunt : 
#-rwxrwxrwx
#User are permisiuni de citire
#User are permisiuni de scriere
#User are permisiuni de executie
#Group are permisiuni de citire
#Group are permisiuni de scriere
#Group are permisiuni de executie
#Other are permisiuni de citire
#Other are permisiuni de scriere
#Other are permisiuni de executie
#-rwxrwxrwx 1 student student 0 Oct 30 19:15 test.txt
