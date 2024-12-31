#!/usr/bin/bash

## Corb Alexia- Gabriela
# citim numerele x si y de pe doua linii diferite 

read -r x
read -r y

# calculam x^2
xpatrat=$(expr $x \* $x)

# calculam y^2
ypatrat=$(expr $y \* $y)

# calculam rezultatul f(x,y)
rezultat=$(expr $xpatrat + $ypatrat - $x + $y)

echo "y=f(x,y)= $rezultat "

## test rulat cu succes 
## f(1,2)
## am testat cu valorile 
## 1
## 2
## 6
