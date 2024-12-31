#!/bin/bash

#Corb ALexia - Gabriela , grupa 1 
read fraza 
echo $fraza
test -z "$fraza" && echo "String gol" || echo "Stringul nu e gol. Fraza introdusa e $fraza"
