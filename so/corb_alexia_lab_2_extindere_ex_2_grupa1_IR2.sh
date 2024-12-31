#!/usr/bin/bash

#Corb Alexia-Gabriela , grupa 1 

# ii cerem utilizatorului sa introduca un numar x pentru functia f(x) 
echo "Introduceti-l pe x pentru f(x):"
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
rezultat1=$(expr $termen1 - 5 \* $x + 4) 

echo "Introduceti-l pe x pentru f(x2,y):"
read -r x2
echo "Introduceti-l pe y pentru f(x2,y):"
read -r y

# calculam x^2
xpatrat=$(expr $x \* $x)

# calculam y^2
ypatrat=$(expr $y \* $y)
# calculam rezultatul f(x,y)
rezultat2=$(expr $xpatrat + $ypatrat - $x + $y)

test $rezultat1 -lt $rezultat2  && echo "f($x)<f($x2,$y)" || echo "f($x)>f($x2,$y)"
test $rezultat1 -eq $rezultat2  && echo "f($x)=f($x2,$y)"

## teste de rulare 
## test1
## Introduceti-l pe x pentru f(x):
## 3   
##Introduceti-l pe x pentru f(x2,y):
##1
##Introduceti-l pe y pentru f(x2,y):
##2
##f(3)<f(1,2)

#test2
##Introduceti-l pe x pentru f(x):
##2
##Introduceti-l pe x pentru f(x,y):
##-1
##Introduceti-l pe y pentru f(x,y):
##1
##f(2)<f(-1,1)
