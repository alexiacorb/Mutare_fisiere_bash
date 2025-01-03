#!/bin/bash

# Funcție pentru căutarea tuturor fisierelor pentru a fi mutate 
cautare_fisiere(){
    locatie="$1"
    find "$locatie" -type f -print0
}

# Funcție pentru a muta fișierele găsite într-o destinație specificată
mutare_fisiere_local(){
    destinatie="$1"
    if [ ! -d "$destinatie" ]; then
        echo "Locația $destinatie nu există pe acest dispozitiv."
        mkdir -p "$destinatie" && echo "Locația $destinatie a fost creată cu succes."
    else
        echo "Locația $destinatie există deja pe acest dispozitiv."
    fi

    cautare_fisiere . | xargs -0 -I {} mv {} "$destinatie" && echo "Fișierele au fost mutate cu succes în $destinatie." || echo "Eroare la mutarea fișierelor local în $destinatie."
}

# Funcție pentru configurarea inițială a repository-ului Git
initializare_git(){
    repository=$1
    git -C "$repository" init && echo "Repository-ul git a fost inițializat cu succes." || echo "Eroare la inițializarea repository-ului."
    git config --local user.email "alexia.corb04@e-uvt.ro"
    git config --local user.name "Corb Alexia"
    git branch -M main
}

# Funcție pentru a muta fișierele în repository-ul Git și a le împinge către GitHub
mutare_fisiere_git(){
    repository_git=$1
    link_github=$2
    if [ ! -d "$repository_git/.git" ]; then 
        echo "$repository_git nu este un repository de git valid."
        mkdir -p "$repository_git"
        initializare_git "$repository_git"
    fi 

    cautare_fisiere . | xargs -0 -I {} mv {} "$repository_git" && echo "Fișierele au fost mutate cu succes în repository-ul de git $repository_git." || echo "Eroare la mutarea fișierelor în repository-ul de git $repository_git."
    cd "$repository_git"

    git add .
    if git diff --cached --quiet; then
        echo "Nu au apărut modificări care să fie commise."
    else
        git commit -m "Fișierele au fost adăugate cu succes în git" && echo "Fișierele au fost commise cu succes." || echo "Eroare la commit."
    fi

    # Adaugă remote origin dacă nu există
    git remote add origin "$link_github" 2>/dev/null

    # Împinge modificările către remote
    if git pull origin main --rebase; then
        git push -u origin main
    else
        echo "A apărut o eroare în timpul rebase-ului. Verificați conflictele."
    fi
}

# Apel funcție
mutare_fisiere_git "git" "https://github.com/alexiacorb/Mutare_fisiere_bash"

