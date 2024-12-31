#!/bin/bash

#Corb Alexia - Gabriela

director=$1
if [ $# -eq 1 ]; then 
	n=3
else
	n=$2
fi

echo $director
echo $n

for fisier in $(ls $director);do 
     if [ -f $fisier ]; then 	
	extensie=$(echo "$fisier" | cut -d '.' -f 1 $fisier)
	echo $extensie
     fi	
done 
