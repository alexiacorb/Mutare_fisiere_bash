#!/bin/bash

# Funcție pentru configurarea inițială a repository-ului Git
## verificam existenta repository ului de git 
## in caz ca nu exista il cream folosind comanda git init 
## configuram local user ul si email ul utilizatorului pentru a evita posibilele erori generate de identitatea utilizatorului  
configurare_git(){
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Repository-ul git este deja inițializat."
    else
        git init && echo "Repository-ul git a fost inițializat cu succes." || echo "Eroare la inițializarea repository-ului."
    fi
    git config --local user.email "alexia.corb04@e-uvt.ro"
    git config --local user.name "Corb Alexia"
}

# Funcție pentru căutarea fișierelor
cautare_fisiere(){
    locatie="$1"
    find "$locatie" -type f -name "*.txt"
}

# fuctie folosita pentru a muta fisierele gasite cu ajutorul functie de cautare in destinatia precizata ca parametru al functiei  
# se verifica existenta destinatiei , in caz contrar aceasta este creata 
# mutam fisierele corespunzatoare folosind comanda mv combinata cu xargs in destinatia stabilita 
# verificam adaugarea cu succes a tuturor fisierelor
mutare_fisiere_local(){
    destinatie="$1"

    if [ ! -d "$destinatie" ]; then
        echo "Locația $destinatie nu există. O creez..."
        mkdir -p "$destinatie" && echo "Locația $destinatie a fost creată cu succes."
    else
        echo "Locația $destinatie există deja."
    fi

    cautare_fisiere . | xargs -I {} mv {} "$destinatie" && echo "Fișierele au fost mutate cu succes în $destinatie." || echo "Eroare la mutarea fișierelor in $destinatie."
}

## functie pentru mutarea fisierelor in git 
## stocam toate fisierele dorite intr un director de back up 
## adaugam directorul respectiv in git folosind comanda git add dupa care trimitem si un mesaj de comit cu ajutorul comenzii git commit -m 
mutare_fisiere_git(){
    configurare_git
    backup="backup"

    if [ ! -d "$backup" ]; then
        mkdir -p "$backup" && echo "Directorul de backup a fost creat."
    else
        echo "Directorul de backup există deja."
    fi

    cautare_fisiere . | xargs -I {} mv {} "$backup" && echo "Fișierele au fost mutate în $backup." || echo "Eroare la mutarea fișierelor."

    git add "$backup" && echo "Folderul de backup a fost adăugat cu succes în repository ul Git." || echo "Eroare la adăugarea fișierelor în repository ul de Git."
    git commit -m "Backup realizat cu succes" && echo "Commit realizat cu succes." || echo "Eroare la realizarea commit-ului."
}

mutare_fisiere_local "backup_local"
mutare_fisiere_git

