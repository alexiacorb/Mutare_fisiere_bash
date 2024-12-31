#!/bin/bash 

numar_procese=$(( $(ps -o pid | wc -l)-1))
for procesid in $(ps -o pid s -p $procesid -o %cpu | tail -n 1 | tr -s ' ' | cut -d '.' )
	if [ $cpu_folosit -gt 90 ]; then 
		kill $procesid
	fi
done 


