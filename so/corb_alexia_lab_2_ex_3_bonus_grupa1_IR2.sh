
#!/usr/bin/bash

##Corb Alexia-Gabriela, grupa 1 

## testam cu metoda test -f daca fisierul exista si afisam primul mesaj daca da al doilea daca nu 
#test -f myfile.txt && echo "Fisierul exista" || (touch myfile.txt && echo "Fisierul a fost creat")
## redirectionam afisarea de la STDOUT spre fisierul creat 
## astfel afisam in fisier mesajul
#echo > myfile.txt "Acesta este un fisier nou"
## folosim metoda cat pentru a afisa continutul fisierului 
#cat myfile.txt

# toate sarcinile intr o linie 
test -f myfile.txt && echo "Fisierul exista" || (touch myfile.txt && echo "Fisierul a fost creat") ; echo > myfile.txt "Acesta este un fisier nou"; cat myfile.txt

## testare
## caz 1 -  fisierul myfile.txt exista
## ce va afisa : 
## Fisierul exista
## Acesta este un fisier nou
## Acesta este un fisier nou -- mesaj redirectionat in fisier 

## caz 2 - fisierul myfile.txt nu exista
## ce va afisa : 
## Fisierul a fost creat
## Acesta este un fisier nou
## Acesta este un fisier nou -- mesaj redirectionat in fisier 

