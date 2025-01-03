#!/bin/bash


# Funcție pentru căutarea tuturor fisierelor pentru a fi mutate 
cautare_fisiere(){
    locatie="$1"
    find "$locatie" -type f -print0
}

# fuctie folosita pentru a muta fisierele gasite cu ajutorul functie de cautare in destinatia precizata ca parametru al functiei  
# se verifica existenta destinatiei , in caz contrar aceasta este creata 
# mutam fisierele corespunzatoare folosind comanda mv combinata cu xargs in destinatia stabilita 
# verificam adaugarea cu succes a tuturor fisierelor
mutare_fisiere_local(){
    destinatie="$1"
    if [ ! -d "$destinatie" ]; then
        echo "Locația $destinatie nu există pe acest dispozitiv "
        mkdir -p "$destinatie" && echo "Locația $destinatie a fost creată cu succes."
    else
        echo "Locația $destinatie există deja pe acest dispozitiv ."
    fi

    cautare_fisiere . | xargs -0 -I {} mv {} "$destinatie" && echo "Fișierele au fost mutate cu succes în $destinatie." || echo "Eroare la mutarea fișierelor local in $destinatie."
}
# Funcție pentru configurarea inițială a repository-ului Git
## verificam existenta repository ului de git 
## in caz ca nu exista il cream folosind comanda git init 
## configuram local user ul si email ul utilizatorului pentru a evita posibilele erori generate de identitatea utilizatorului
initializare_git(){
    repository=$1
    git -C "$repository" init && echo "Repository-ul git a fost inițializat cu succes." || echo "Eroare la inițializarea repository-ului."
    git config --local user.email "alexia.corb04@e-uvt.ro"
    git config --local user.name "Corb Alexia"
}
## functie pentru mutarea fisierelor in git 
## stocam toate fisierele dorite intr un director de back up 
## adaugam directorul respectiv in git folosind comanda git add dupa care trimitem si un mesaj de comit cu ajutorul comenzii git commit -m 
mutare_fisiere_git(){
	repository_git=$1
	link_github=$2
	if [ ! -d "$repository_git/.git" ]; then 
		echo "$repository_git nu este un repository de git valid "
		mkdir -p $repository_git 
		initializare_git "$repository_git"
	else 
		cautare_fisiere . | xargs -0 -I {} mv {} "$repository_git" && echo "Fișierele au fost mutate cu succes în repository ul de git $repository_git." || echo "Eroare la mutarea fișierelor in repozitory ul de git $repository_git."		
		cd "$repository_git"
		# adauga toate fisierele selectate in staging area - retine modificarile pregatind commit ul 
		git add .
		if git diff --cached --quiet; then
    			echo "Nu au aparut modificari care sa fie commise"
		else
    			git commit -m "Fisierele au fost adaugate cu succes in git" && echo "Fișierele au fost commise cu succes" || echo "Eroare la commit"
    			git remote add origin "$link_github" 2>/dev/null
    			git push -u origin main
		fi
	fi 
	
}
mutare_fisiere_git "/home/student/Desktop/ProiectB/.git/" "https://github.com/alexiacorb/Mutare_fisiere_bash" 
