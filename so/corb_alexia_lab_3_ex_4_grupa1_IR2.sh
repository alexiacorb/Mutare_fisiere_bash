#!/usr/bin/bash

#Corb Alexia-Gabriela , grupa 1 

# verificam daca are permisiuni cu test -w cu cd ne deplasam in director si dupa cu touch adaugam un fisier in director si afisam in el 
##  comanda pe o linie
## folosim dev/null ca al doilea parametru pentru a preveni afisarea la STDOUT
sudo test -w /tmp && cd /tmp && (echo "Permisiuni OK" | sudo tee testfile.txt > /dev/null) || echo "Nu are permisiuni de scriere" >&2


## varianta pe mai multe randuri , folosim \ pentru a scrie pe mai multe randuri 
sudo test -w /tmp \
&& cd /tmp \
&& (echo "Permisiuni OK " | sudo tee textfile.txt > /dev/null) \
|| echo "Nu are permisiuni de scriere" >&2
