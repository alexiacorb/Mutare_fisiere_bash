# #!/bin/bash
# Varianta 13 - Problema 1
# Scriptul va primi ca și argument un director (verificați numărul corect de argumente și existența acestuia pe sistem) și va:
# 
# - găsi toate fișierele care au fost modificate în ultimele 7 zile și conțin cel puțin un link simbolic,
# - copia aceste fișiere și linkurile simbolice într-un folder numit /tmp/linked_files/ (creat dacă nu există),
# - seta un cron job care, în fiecare săptămână, în ziua de miercuri, la ora 03:30, verifică:
# - dacă fișierele originale mai există; dacă nu, șterge linkurile simbolice și scrie un mesaj de avertizare în log-ul sistemului,
# - dacă fișierele originale există, actualizează timestamp-ul fișierelor din /tmp/linked_files/.

# verificam daca au fost introduse un numar corect de argumente 
if [ $# -ne 1 ]; then 
	echo "Nu a fost introdus un numar corect de argumente"
	exit 1
fi 

## stocam numele directorului intr o variabila 
dir=$1

## verificam daca argumentul dat este un director 
if [ ! -d $dir ]; then 
	echo "Directorul nu exista "
	exit 1
fi 

## cautam folosind find in directorul dir toate fisierele (type f ) create in urma cu maxim 7 zile (-mtime -7)  folosim exec pentru a executa o comanda 
find "$dir" -type f -mtime -7 - exec cp {} /tmp/linked_files/ \;

# pentru a folosi cron job in terminal vom rula comanda crontab -e 
# in fisierul care se deschide vom introduce urmatoarea linie unde campurile reprezinta minute (m), ora (h), ziua lunii  (dom), luna (mon), ziua lunii , ultimul argument reprezinta numele scriptului ce va fi rulat 
# 30 3 * * 4 problema_1.sh

