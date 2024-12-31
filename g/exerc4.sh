# #!/bin/bash
# Varianta 187 - Problema 4
# Scriptul va:
# 
# Prelua un director ca argument și verifica existența acestuia.
# Lista detaliat fișierele și va:
# Identifica fișierele mai mari de 10 MB și mai mici de 100 MB.
# Identifica fișierele mai mari de 100 MB care conțin extensia .iso sau .img.
# Identifica fișierele cu dimensiuni mai mici de 1 KB.
# Salvează numele acestor fișiere în /tmp:
# medium_files.txt pentru fișierele din prima categorie.
# large_iso_img_files.txt pentru fișierele din a doua categorie.
# small_files.txt pentru fișierele din a treia categorie.
# Schimbă proprietarul fișierelor din categoria mare la utilizatorul backup.
# Creează un raport sumar cu dimensiunea totală a fișierelor din fiecare categorie în format JSON.

if [ $# -ne 1 ]; then
	exit 1
fi
dir=$1
if [ ! -d $dir ]; then
	exit 1
fi
if [ -f /tmp/large_iso_img_files.txt ]; then
	echo "fisierul large_iso_img_files.txt exita"
else
	touch /tmp/large_iso_img_files.txt
fi

if [ -f /tmp/medium_files.txt ]; then
	echo "fisierul medium_files.txt exita"
else
	touch /tmp/medium_files.txt
fi
if [ -f /tmp/small_files.txt ]; then
	echo "fisierul small_files.txt exita"
else
	touch /tmp/small_files.txt
fi
ls -l $dir
find "$dir" -type f -size +10M -size -100M > /tmp/medium_files.txt

find "$dir" -type f -size +100M -regex '.*\.(jpg|png|gif)$' > /tmp/large_iso_img_files.txt

find "$dir" -size -1k -type f > /tmp/small_files.txt
