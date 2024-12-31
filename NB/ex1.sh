#!/bin/bash

nr_argumente=$#
if [ nr_argumente -lt 1 ]; then 
	echo "Nu ati introdus ca argument directorul"
	exit 1
else 
	director=$1
fi
if [ ! -d $director ]; then 
	echo "Argumentul introdus nu e un director"
	exit 1
fi 

find $director -type f -name "*.log" 

