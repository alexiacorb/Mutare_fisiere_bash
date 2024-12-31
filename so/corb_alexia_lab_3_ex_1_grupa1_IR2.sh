#!/usr/bin/bash

# Corb Alexia- Gabriela , grupa 1 

# folosim comanda grep bash pentru a extrage din etc passwd toate aparitiile bash
# redirectionam cu ajutorul comenzii tee atat in fisier cat si ca pipe pentru comanda wc -l
# cu ajutorul wc - l 
grep "bash" /etc/passwd | tee bash_users.txt  | wc -l

## test rulat cu succes 
## STDOUT
## 2
## fisierul bash_users.txt
#root:x:0:0:root:/root:/bin/bash
#student:x:1000:1000:student:/home/student:/bin/bash
