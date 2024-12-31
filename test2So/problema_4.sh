# #!/bin/bash
# Varianta 13 - Problema 4
# Scriptul va:
# 
# Prelua un director ca argument și verifica existența acestuia; dacă nu există, afișează un mesaj de eroare.
# Lista detaliat fișierele din directorul respectiv și va:
# Identifica fișierele cu nume care conțin:
# Un șir de litere urmat de cifre (ex.: file123.txt).
# Numele care încep și se termină cu aceeași literă (ex.: ana.txt).
# Fișiere a căror extensie este .log sau .tmp.
# Salvează numele acestor fișiere în /tmp:
# alpha_numeric_files.txt pentru fișierele din prima categorie.
# palindromic_files.txt pentru fișierele din a doua categorie.
# log_tmp_files.txt pentru fișierele din a treia categorie.
# Modifică permisiunile astfel încât să elimine permisiunile de citire pentru grup (group) dacă numele fișierului conține un șir numeric exact de 4 cifre.
# Creează un raport sumar în format JSON cu numărul de fișiere pentru fiecare categorie și îl scrie la STDOUT.


## verificam daca a fost introdus numarul corect de argumente 
if [ $# -ne 1 ]; then 
	echo "Nu a fost introdus numarul de argumente asteptat"
	exit 1
fi 

## stocam in variabila dir numele directorului 
dir =$1
## verificam existenta directorului 
if [ ! -d $dir ]; then 
	echo "Nu este un director"
	exit 1
fi 

## verificam existenta fiecaruia dintre fisiere 
if [ -f /tmp/log_tmp_files.txt ]; then 
	echo "Fisierul log_tmp_files.txt exista deja"
else 
	touch /tmp/log_tmp_files.txt 
fi 

if [ -f /tmp/palindromic_files.txt ]; then 
        echo "Fisierul palindromic_files.txt exista deja"
else 
        touch /tmp/palindromic_files.txt 
fi 

if [ -f /tmp/alpha_numeric_files.txt ]; then 
        echo "Fisierul alpha_numeric_files.txt exista deja"
else 
        touch /tmp/alpha_numeric_files.txt
fi 

## listam detaliat fisierele din acest director  
ls -l $dir 

## gasim in directorul specificat fisierele care respecta patern urile specificate de regex
find $dir -type f -regex "^[A-Za-z]*[0-9]*$"  > /tmp/palindromic_files.txt


find $dir -type f -regex '.*\.(log|tmp)$' > /tmp/log_tmp_files.txt 



