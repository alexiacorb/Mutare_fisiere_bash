#!/bin/bash 

#Corb ALexia Gabriela

suma=$(expr 2 + 3)
echo $suma

dif=$(expr 3 - 2)
echo $dif

a=2
b=3
produs=$((a*b))
echo $produs
p=$(expr $a \* $b)
echo $p

rest=$(expr $a % $b)
echo $rest

calcul=$((a * b))
echo $calcul

((a--))
echo $a

