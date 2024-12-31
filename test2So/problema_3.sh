# #!/bin/bash
# Varianta 13 - Problema 3
# Scriptul va citi de pe linia de comandă opțiunile -p și -s cu valorile aferente (folosiți un apel de tip getopt) și va seta câte un handler pentru semnalele următoare:
# 
# SIGUSR1: handler1
# SIGUSR2: handler2
# SIGALRM: handler3
# La interceptarea:
# 
# SIGUSR1: scriptul va porni, în background, un job care monitorizează primele p procese sortate după utilizarea CPU-ului la intervale de s secunde, folosind comanda watch, și va salva rezultatele în /tmp/cpu_usage.log.
# SIGUSR2: scriptul va readuce job-ul în foreground pentru o analiză interactivă.
# SIGALRM: scriptul va opri monitorizarea, va arhiva raportul în /tmp/cpu_usage_backup.tar.gz, și va șterge log-ul curent.
# Scriptul va bloca semnalele SIGHUP și SIGINT.
# În caz de erori, scriptul va raporta un mesaj la STDERR și va termina execuția.

#!/bin/bash

## parcurgem folosind getopts optiunile oferite pe linia de comanda 
## extragem cu OPTARG argumentul optiunii 
while getopts ":u:i:" opt; do
    case "$opt" in
        u) 
        	arg_u="$OPTARG"
        	;;
        i) 
        	arg_i="$OPTARG"
        	;;
        *) echo "Opțiune invalida"
        
    esac
done

## functii care specifica comportamentul fiecarui semnal cand e folosit CTRL + Z
functie1(){
	
	sleep $arg_i
}

functie2(){

}

functie3(){

}

## capturam semnalele

trap functie1 SIGUSR1
trap functie2 SIGUSR2
trap functie3 SIGTSTP


while true; do 
	sleep 1
done 
