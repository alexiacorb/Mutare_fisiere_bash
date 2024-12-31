
#!/usr/bin/bash

## Corb Alexia-Gabriela , grupa 1 

## ii cerem utilizatorului de la stdin un numar 
echo "Introduceti un numar: "
## citim de la tastatura un numar 
read numar 
# testam paritatea verificand daca restul impartirii numarului la 2 este 0  
# afisam un mesaj corespunzator 
test $((numar%2)) -eq 0 && echo "Numarul este par" || echo "Numarul este impar"

## teste rulate cu succes 

## primul test 
## introdus de la tastatura 12
## rezultatul obtinut:
## Numarul este par 

## al doilea test 
## introdus de la tastatura 5
## rezultatul obtinut:
## Numarul este impar
