#!/bin/bash 

nume_fisier=$1

sed -i -E 's/^[1-9][0-9]{4}$/\$/' $nume_fisier

sed -i -E '/^[a-zA-Z0-9]+$/d' $nume_fisier 

sed -i -E ''
cat $nume_fisier
