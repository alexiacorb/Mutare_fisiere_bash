#!/bin/bash 

director=copie 

spatiu_folosit=$(df $director | tr -s ' ' | cut -d ' ' -f5 | tr 'Use%' ' ')

if [ $spatiu_folosit -gt 75 ]; then 
	find -type f -mtime +7 | xargs rm 
else 
	echo "Nu s a atins pragul"
fi 
