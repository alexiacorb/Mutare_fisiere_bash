#!/bin/bash 
## stocam in variabila spatiu folosit valoarea procentului de spatiu folosit de pe disc

director="copie"
spatiu_folosit=$(df -h "$director" | tail -1 | tr -s ' ' | cut -d ' ' -f5 | tr -d '%')
email="student"

echo "Spațiu folosit: ${spatiu_folosit}%"

if [ "$spatiu_folosit" -gt 35 ]; then
    find "$director" -type f -mtime +7 -exec rm {} \;
    echo "Ati ajuns la limita de ${spatiu_folosit}%. Fisierele mai vechi de 7 zile au fost sterse." | mail -s "Avertisment: Spațiu de stocare" "$email"
    echo "A fost trimis un e-mail"
else
    echo "Nu a fost atins pragul maxim."
fi

