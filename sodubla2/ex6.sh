#!/bin/bash 

#Corb Alexia 

echo $USER
for fisier in $(ls); do 
	if [[ -f $fisier  && -x $fisier ]]; then 
		if [[ $fisier == $USER || $fisier == "$USER."* ]]; then 
			ln -s $fisier "$HOME"/soft_link_$fisier
		fi
	fi  
done 

ls -l $HOME
