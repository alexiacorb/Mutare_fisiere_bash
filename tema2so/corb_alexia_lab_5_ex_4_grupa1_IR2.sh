#!/bin/bash 

#Corb ALexia-Gabriela , grupa 1 

# extragem in variabila user UID ul curent cu ajutorul comenzii id -u 
user=$(id -u)
echo $user 

# folosim for pentru a itera prin toate fisierele din directorul ales 
# am ales directorul testso 
# pentru a extrage toate fisierele dupa numele directorului punem /*
for fisiere in testso/* ; do 
# verificam daca UID ul este 0(root)
#  stergem initial toate permisiunile dupa le adaugam pe cele necesare in functie de valoarea UID
	if [ $user -eq 0 ]; then 
		sudo chmod 000 $fisiere
		sudo chmod 777 $fisiere
	else 
		sudo chmod 000 $fisiere 
                sudo chmod 666 $fisiere 
 	fi 
done 

# folosim ls -l pentru a vedea permisiunile actuale ale fisierelor din directorul ales 

ls -l testso

## Test de rulare cu succes 
#1000
#total 0
#-rw-rw-rw- 1 student student 0 Oct 31 14:09 f1
#-rw-rw-rw- 1 student student 0 Oct 31 14:09 f2
#-rw-rw-rw- 1 student student 0 Oct 31 14:09 f3
#-rw-rw-rw- 1 student student 0 Oct 31 14:09 f4
#-rw-rw-rw- 1 student student 0 Oct 31 14:09 f5
