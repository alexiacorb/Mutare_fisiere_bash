#!/bin/bash 

#Corb ALexia 

if [ -f /etc/fstab ]; then 
	if [ ! -d backup ]; then 
		mkdir -p backup 
	fi
	cp /etc/fstab backup
fi 

