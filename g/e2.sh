#!/bin/bash
# Varianta 42 - Problema 2
# Scriptul va efectua prelucrări asupra unui fișier dat ca și argument (verificati numar corect argumente si existenta, cat si permisiunile!).
# Acesta va:
# 
# inlocui toate liniile ce contin cel puțin trei caractere speciale consecutive cu șirul #
# sterge toate liniile care încep cu o cifră și conțin spații
# adauga, inaintea liniilor care contin doar cifre pare, o linie mentionand timestamp-ul curent de pe sistem
# adauga, dupa liniile care contin caractere speciale, o linie mentionand directorul curent al utilizatorului.
# De exemplu, pentru fisierul cu continutul urmator:
# 
# ##@@##
# 123 număr
# 2468
# #*#@!
# 
# Va deveni dupa modificari:
# 
# #
# <output comanda date>
# 2468
# #*#@!
# user directory: <output comanda pwd>
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

fisier=$1


if [ ! -f "$fisier" ]; then
    echo "Error: File does not exist."
    exit 1
fi


if [ ! -r "$fisier" ] || [ ! -w "$fisier" ]; then
    echo "Error: No read/write permissions on the file."
    exit 1
fi

awk -v timestamp="$(date '+%Y-%m-%d %H:%M:%S')" -v user_dir="$(pwd)" '
{

    if ($0 ~ /[^a-zA-Z0-9 ]{3,}/) {
        print "#";
        next;
    }

  
    if ($0 ~ /^[0-9].* /) {
        next;
    }

    if ($0 ~ /^[02468]+$/) {
        print timestamp;
        print $0;
        next;
    }

    if ($0 ~ /[^a-zA-Z0-9 ]/) {
        print $0;
        print "user directory: " user_dir;
        next;
    }

    print $0;
}' "$fisier" > tmpfile && mv tmpfile "$fisier"
