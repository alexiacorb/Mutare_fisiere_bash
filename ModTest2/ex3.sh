#!/bin/bash 

while getopts ":p:" opt; do 
    case $opt in
	p) 
	  numar_procese=$OPTARG
	  ;;
	*)
	  echo "Optiune invalida!"
	  ;;
    esac
done 
if [[ $numar_procese =~ "^[0-9]+$" ]]; then
	ps -o pid,%cpu | tr -s ' ' |  tail -n $numar_procese > cpu_usage.txt
	cat cpu_usage.txt
	echo "Numar"
else 
	echo "Argumentul introdus nu e un numar"
fi


