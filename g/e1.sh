#!/bin/bash
# Varianta 42 - Problema 1
# 
# Scriptul va primi ca și argument un director (verificați numărul corect de argumente și existența acestuia pe sistem) și va:
# 
# - identifica toate fișierele din director care sunt mai mari de 500 MB și au fost accesate în ultimele 10 zile,
# - muta aceste fișiere într-un folder numit /tmp/large_recent_files/ (creat dacă nu există),
# - seta un cron job care, în fiecare zi de luni, la ora 02:00, verifică spațiul ocupat de acest folder și:
#     dacă spațiul ocupat depășește 5 GB, arhivează cele mai vechi fișiere și le șterge,
#     dacă spațiul este mai mic de 5 GB, scrie în /var/log/syslog un mesaj.

if [ $# -ne 1 ]; then
	exit 1
fi
dir=$1
if [ ! -d $dir ]; then
	exit 1
fi
if [ -d /tmp/large_recent_files/ ]; then
	echo "Folderul exista"
else 
	mkdir /tmp/large_recent_files/
fi
find "$dir" -size +50M -type f -atime -10 -exec mv {} /tmp/large_recent_files/ \;
