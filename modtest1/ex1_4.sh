#!/bin/bash

#Corb Alexia -Gabriela 

director=$1

for fisier in $(ls -R $director) ; do 
	if [ -f $fisier ]; then 
		echo $fisier
	elif [ -d $fisier ]; then 
		for f in $fisier; do 
			echo $f
		done 
	fi
done 
