#!/usr/bin/bash

#Corb Alexia-Gabriela , grupa 1 

# ii cerem utilizatorului sa introduca un numar x 
echo "Introduceti-l pe x"
# citim si stocam valoarea citita in variabila x
read x

# calculam x ^ 2
xpatrat=$(expr $x \* $x)
# calculam numaratorul 
numarator=$(expr $xpatrat + $x + 1)
# calculam numitorul 
numitor=$(expr $x + 2)

# calculam primul termen 
termen1=$(expr $numarator / $numitor)

# calcam rezultatul final 
rezultat=$(expr $termen1 - 5 \* $x + 4)
echo "y=f(x)= $rezultat" 

## test rulat cu succes 
## 1
## rezultatul obtinut este 0
