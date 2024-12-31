#!/bin/bash

#Corb Alexia-Gabriela , grupa 1 

# folosim comanda df / pentru a afisa informatii despre utilizarea spatiului pe disk 
# extragem cu ajutorul comenzii tail-n 1  ultima linie 
# folosim tr -s ' ' elimina spatiile consecutive 
# comanda cut extrage informatii 
# cu ajutorul -d specificam delimitatorul care e spatiu 
# cu -f specificam coloana selectata 

# pastram in variabila spatiu liber ultima linie din coloana 4 
# spatiul folosit il gasim pe ultima linie a coloanei 4 
# pentru spatiul total adunam cele doua variabile folosind expr  

spatiu_liber=$(df / | tail -n 1 |  tr -s ' ' |  cut -d ' ' -f 4 )

echo $spatiu_liber

spatiu_folosit=$(df / | tail -n 1 | tr -s ' ' |  cut -d ' ' -f 3 )

echo $spatiu_folosit

spatiu_disk=$(expr $spatiu_folosit + $spatiu_liber)


# calculam in variabila prag 10% din spatiul total cu ajutorul comenzii expr
# verificam daca spatiul liber e mai mic decat pragul stabilit si afisam un mesaj corespunzator
prag=$(expr $spatiu_disk \* 10 / 100)

echo $prag
if [ $spatiu_liber -lt $prag ]; then 
	echo "Aveti mai putin de 10% spatiu disponibil"
else
	echo "Spatiul de pe disc este suficient"
fi 

# Test de rulare cu succes 
#19836004
#9359324
#2919532
#Spatiul de pe disc este suficient

