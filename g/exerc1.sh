#!/bin/bash
# Varianta 88 - Problema 1
# Scriptul va primi ca si argument un director (verificati numar argumente corect si existenta acestuia pe sistem) si va:
#     - determina toate fisierele care sunt mai vechi de 30 de zile din directorul respectiv,
#     - le va crea, pentru cele ce indeplinesc cerinta de mai sus, cate un link simbolic corespunzator in /tmp/old.
#     - seta un cron job care, in data de intai a fiecarei luni, la ora 00:00, va verifica validitatea linkurilor simbolice create in /tmp/old.
#         - daca acestea nu mai sunt valide (fisierele originale au fost sterse), linkurile simbolice vor fi de asemenea sterse.
#         - daca acestea sunt valide, va scrie in /var/log/syslog un mesaj informativ (pentru fiecare in parte).


# Verificarea argumentelor
if [ $# -ne 1 ]; then
    exit 1
fi

dir=$1

if [ ! -d "$dir" ]; then
    exit 1
fi

# Crearea directorului pentru linkurile simbolice
mkdir -p /tmp/old

# Găsirea fișierelor mai vechi de 30 de zile și crearea linkurilor simbolice
find "$dir" -type f -mtime +30 | while read -r file; do
    link_name="/tmp/old/$(basename "$file")"
    if [ ! -e "$link_name" ]; then
        ln -s "$file" "$link_name"
        echo "Link simbolic creat pentru: $file"
    fi
done

# Scriptul temporar pentru verificarea linkurilor simbolice
verificare_script="/tmp/verify_links.sh"

cat > "$verificare_script" << 'EOF'
#!/bin/bash
# Script pentru verificarea validității linkurilor simbolice din /tmp/old.

log_file="/var/log/syslog"

for link in /tmp/old/*; do
    if [ -L "$link" ]; then
        if [ -e "$link" ]; then
            echo "Link valid: $link" >> "$log_file"
        else
            echo "Link invalid: $link - Se șterge." >> "$log_file"
            rm "$link"
        fi
    fi
done
EOF

# Asigurarea permisiunilor de execuție pentru scriptul temporar
chmod +x "$verificare_script"

# Adăugarea cron job-ului (elimină duplicatele)
(crontab -l 2>/dev/null | grep -v "$verificare_script"; echo "0 0 1 * * /bin/bash $verificare_script") | crontab -

echo "Script completat cu succes!"
echo "Linkurile simbolice pentru fișierele mai vechi de 30 de zile au fost create în /tmp/old."
echo "Un cron job a fost setat pentru validarea linkurilor simbolice în data de 1 a fiecărei luni."
