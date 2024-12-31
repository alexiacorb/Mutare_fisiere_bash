#!/bin/bash 
## initializarea sesiunii de git 
## verificam existenta repository ului de git 
## in caz ca nu exista il cream folosind comanda git init 
## configuram global username ul si email ul utilizatorului pentru a evita posibilele erori generate de identitatea utilizatorului 
configurare_git(){
	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
 		 echo "Repozitory-ul git este initializat"	
	else
  		git init && echo "Repository ul git a fost initializat cu succes " || echo "Eroare la initializarea repository ului" 
	fi
	git config --global user.email "alexia.corb04@e-uvt.ro"
  	git config --global user.name "Corb Alexia"

}
# fuctie folosita pentru a muta fisierele mentionate ca si prin argument al functiei in locatia precizata ca al doilea parametru 
# se verifica existenta locatiei , in caz contrar aceasta este creata 
# verificam existenta fisierelor 
# mutam fisierele corespunzatoare folosind comanda mv in locatia stabilita 
# verificam adaugarea cu succes a tuturor fisierelor 
mutare_fisiere_local(){
	fisiere="$1"
	locatie="$2"

	if [ ! -d "$locatie" ]; then 
		echo "Locatia $locatie nu exista pe acest dispozitiv"
		mkdir -p $locatie && echo "Locatia a fost creata cu succes" 
        else
   		echo "Locatia exista deja pe acest dispozitiv"      
	fi	
	ok=1
	for fisier in $fisiere; do 
		if [ ! -f $fisier ]; then 
			echo "$fisier nu exista"	
			ok=0
		else 
			mv $fisier "$locatie" || echo "eroare la mutarea fisierului $fisier in locatia $locatie" 
		fi 
	done 
        if [ $ok -eq 1 ]; then 
        	echo "Fisierele au fost mutate cu succes in directorul local $locatie"
        fi
}
## functie pentru mutarea fisierelor in git 
## stocam toate fisierele dorite intr un director de back up 
## adaugam directorul respectiv in git folosind comanda git add dupa care trimitem si un mesaj de comit cu ajutorul comenzii git commit -m 
mutare_fisiere_git(){
	fisiere=$1
	backup="backup"
	if [ ! -d $backup ]; then 
		mkdir -p $backup && echo "Directorul de backup a fost creat"
	else 
		echo "Directorul pentru backup exista deja "
	fi 
	configurare_git
	for fisier in $fisiere; do 
		if [ ! -f $fisier ]; then 
			echo "$fisier nu exista"	
			ok=0
		else 
			mv "$fisier" "$backup" 
		fi 
	done 
  	git add "$backup" && echo "Folderul de backup a fost adaugat cu succes in git " || echo "eroare la adaugarea fisierelor in git"
	git commit -m "Backup realizat cu succes"	
}
mutare_fisiere_git "*.txt" 
