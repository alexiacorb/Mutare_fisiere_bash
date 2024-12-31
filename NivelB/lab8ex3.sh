#!/bin/bash

# Citirea și verificarea directorului
read -p "Introduceți calea directorului pentru backup: " director

if [ ! -d "$director" ]; then
    echo "Nu ați introdus un director valid!"
    exit 1
fi


# Directorul de backup
director_backup="backup"
mkdir -p "$director_backup"  # Creează directorul de backup dacă nu există

# Data curentă pentru numele fișierului de backup
data_curenta=$(date "+%Y%m%d_%H%M%S")
nume_backup="$director_backup/backup_$data_curenta.tar"

tar -cf $nume_backup $director
find -type f $director_backup -mtime +5 -exec rm {} \;

# Confirmarea finalizării
echo "Backup complet! Fișierul de backup este: $nume_backup"

