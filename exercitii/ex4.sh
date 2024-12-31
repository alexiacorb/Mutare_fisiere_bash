#!/bin/bash 

#Corb ALexia-GAbriela , grupa 1 

read numar 

test $((numar % 2)) -eq 0 && echo "NUmar par " || echo "NUmar impar"

