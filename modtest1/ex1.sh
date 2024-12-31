#!/bin/bash
#Corb Alexia 

director=$1

for fisier in $(ls -R $director); do 
     if [ -f $director/$fisier ]; then 
	lungime_nume=${#fisier}
	lungime_jumate=$(expr $lungime_nume / 2)
	echo "Lungimea fisierului $fisier este : " $lungime_nume
	prima_jumatate=${fisier:0:lungime_jumate}
	jumate2=${fisier:lungime_jumate:lungime_nume}
	continut=$(cat $director/$fisier)
	lungime_continut=${#continut}
	jumate_continut=$(expr $lungime_continut /2)
	touch $prima_jumatate
 	touch $jumate2
        echo ${continut:0:jumate_continut}>$prima_jumatate
	echo ${continut:jumate_continut:continut}>$jumate2
fi
done

