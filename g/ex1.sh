#!/bin/bash


# Verificarea numărului de argumente
if [ $# -ne 1 ]; then
    echo "Utilizare: $0 <director>"
    exit 1
fi

dir=$1

# Verificarea dacă directorul există
if [ ! -d "$dir" ]; then
    echo "Eroare: Directorul '$dir' nu există."
    exit 1
fi

# Crearea directoarelor /tmp/big_files și /tmp/small_files
if [ ! -d /tmp/big_files ]; then
    mkdir /tmp/big_files
    echo "Directorul /tmp/big_files a fost creat."
fi

if [ ! -d /tmp/small_files ]; then
    mkdir /tmp/small_files
    echo "Directorul /tmp/small_files a fost creat."
fi

# Mutarea fișierelor în funcție de dimensiune
find "$dir" -type f -ctime -30 -size +1k -exec mv {} /tmp/big_files/ \;
find "$dir" -type f -ctime -30 ! -size +1k -exec mv {} /tmp/small_files/ \;

echo "Fișierele au fost mutate în directoarele corespunzătoare."

# Setarea cron job-ului pentru arhivarea fișierelor din big_files
CRON_JOB="0 0 1 /3 * tar -czf /tmp/big_files_archive_\$(date +\%Y\%m\%d).tar.gz -C /tmp/big_files . && rm -rf /tmp/big_files/"

# Adăugarea cron job-ului în crontab, verificând mai întâi dacă există deja
(crontab -l | grep -v "big_files_archive" ; echo "$CRON_JOB") | crontab -

echo "Cron job-ul a fost setat să ruleze o dată la 3 luni, pe data de 01, la ora 00."
