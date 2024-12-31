#!/usr/bin/bash

# Corb Alexia-Gabriela, grupa 1

# folosim cat pentru a concatena cele doua fisiere 
# folosim pipe ul pentru a folosi cele doua fisiere concatenate ca si input pentru urmatoarea comanda
# comanda tr ne ajuta sa inlocuim primul caracter cu al doilea 
# folosim redirectionarea > pentru a redirectiona tot in fiserul results.txt 
cat /etc/hosts /etc/issue | tr '-' '#' > results.txt 
