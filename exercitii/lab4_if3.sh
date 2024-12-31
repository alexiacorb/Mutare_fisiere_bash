#!/bin/bash

#Corb Alexia

echo "Introduceti x"

read x

if [ $x -ge -2 ] && [ $x -lt -1 ]; then 
	expresie=$(( (x ** 2 + 1 ) / (x+1) ))   
elif [ $x -lt -2 ]; then 
	expresie=$(expr $x - 3 )
elif [ $x -ge -1 ]; then
	expresie=$(expr $x +4 ) 
fi 

echo $expresie
