#!/usr/bin/bash

## Corb Alexia-Gabriela, grupa 1 

## citim de la tastatura cele 3 numere x y si z 
read -r x
read -r y
read -r z

##  calculam suma variabilelor x y z 
suma=$(expr $x + $y + $z)
## calculam rezultatul 
rezultat=$(expr $suma \* $suma)

echo "y=f(x,y,z)= $rezultat"

## test rulat cu succes 
## 1
## 2
## 3
## y=f(x,y,z)= 36

