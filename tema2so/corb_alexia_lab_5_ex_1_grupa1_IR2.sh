#!/bin/bash

#Corb Alexia-Gabriela, grupa 1

echo "Introduceti numele unui director"
# citim si stocam in variabila director numele directorului introdus 
read director

##folosim select pentru a crea un meniu interactiv

PS3="Alegeti o optiune"
select optiune_user in "melisa" "matei" "mircea"; do 
                case $optiune_user in
                        "melisa") 
                                user="melisa"
                                break
				;; 
                        "matei") 
                                user="matei"
				break
                                ;;
                        "mircea")
                                user="mircea"
                                break
                                ;;
                        *) 
				echo "Varianta introdusa e invalida"
                                ;;
                esac
done

select optiune_group in "audi" "bmw" "porsche"; do 
          case $optiune_group in
                  "audi") 
                         group="audi"
			 break
                   	 ;; 
                 "bmw") 
                         group="bmw" 
			 break                         
                         ;;
                "porsche")
                         group="porsche"
			 break
                         ;;

                 *)     
			 echo "Varianta introdusa e invalida"
                         ;;

                 esac
        done
# parcurgem cu ajutorul for ului toate fisierele din directorul dat 
# folosim chown pentru a schimba utilizatorul si grupul cu datele stocate in cele 2 variabile 
for fisier in "$director"/*; do
	sudo chown "$user":"$group" "$fisier"

done

# am afisat cu ls -l pentru a vedea specificatiile legate de utilizator si grup

ls -l "$director"


## in terminal am rulat aceste doua comenzi inainte de rularea scriptului 
## nu scris in script deoarece daca exista deja imi returna un mesaj  
## am folosit comanda sudo groupadd pentru a adauga un nou grup 
## in loc de variabila group eu am pun numele concret al grupurilor alese in select  
##sudo groupadd $group 
## am folosit useradd pentru a adauga un nou user 
##sudo useradd -m $user 

## Exemple de teste rulate cu succes 

## Introduceti numele unui director
## mydir
#1) melisa
#2) matei
#3) mircea
#Alegeti o optiune 1
#1) audi
#2) bmw
#3) porsche
#Alegeti o optiune 1
#[sudo] password for student:
#total 0
#-rw------- 1 melisa audi 0 Nov  1 20:53 myfile2.txt
#-rw-rw-r-- 1 melisa audi 0 Nov  1 20:53 myfile.txt

