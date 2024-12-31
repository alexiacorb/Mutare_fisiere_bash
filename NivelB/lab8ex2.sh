#!/bin/bash 

numar_procese=$(( $(ps -o pid | wc -l)-1))
lista_proc=$(ps -ax -o pid,%cpu | tr 'PID %CPU' ' ' | tr -s ' ')

for procesid in $(echo $lista_proc | tr 'PID %CPU' ' ' | tr -s ' ' | cut -d '.' )
	if [ $cpu_folosit -gt 90 ]; then
		kill $procesid
	fi
done
