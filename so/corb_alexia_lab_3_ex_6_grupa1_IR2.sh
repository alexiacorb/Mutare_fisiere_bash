#!/usr/bin/bash

# Corb Alexia-Gabriela, grupa 1
# Selectam liniile care contin caracterul ':' si folosim pipe ul | pentru a trimite output ul la urmatoarea comanda
# selectam cu grap -i liniile care contin 'run' indiferent daca sunt litere mari sau mici 
# transformăm literele folosind comanda tr si pattern urile [:lower:][:upper:]' '[:upper:][:lower:]' pentru a transforma literele mici in mari si invers  
# redirectionam cu comanda tee la STDOUT si fisier 
# pentru redirectionarea la stderr nu ne putem folosi direct de tee si avem nevoie de un intermediar cat 

grep ':' /etc/passwd | grep -i "run" | tr '[:lower:][:upper:]' '[:upper:][:lower:]' | tr ':' '@' | tee /tmp/filtered_data.txt >(cat >&2)

## test rulat cu succes 
## STDOUT + STDERR 
## IRC@X@39@39@IRCD@/RUN/IRCD@/USR/SBIN/NOLOGIN
##UUIDD@X@103@103@@/RUN/UUIDD@/USR/SBIN/NOLOGIN
##AVAHI@X@108@111@aVAHI Mdns DAEMON,,,@/RUN/AVAHI-DAEMON@/USR/SBIN/NOLOGIN
##SPEECH-DISPATCHER@X@111@29@sPEECH dISPATCHER,,,@/RUN/SPEECH-DISPATCHER@/BIN/FALSE
##HPLIP@X@116@7@hplip SYSTEM USER,,,@/RUN/HPLIP@/BIN/FALSE
##GNOME-INITIAL-SETUP@X@119@65534@@/RUN/GNOME-INITIAL-SETUP/@/BIN/FALSE
##IRC@X@39@39@IRCD@/RUN/IRCD@/USR/SBIN/NOLOGIN
##UUIDD@X@103@103@@/RUN/UUIDD@/USR/SBIN/NOLOGIN
##AVAHI@X@108@111@aVAHI Mdns DAEMON,,,@/RUN/AVAHI-DAEMON@/USR/SBIN/NOLOGIN
##SPEECH-DISPATCHER@X@111@29@sPEECH dISPATCHER,,,@/RUN/SPEECH-DISPATCHER@/BIN/FALSE
##HPLIP@X@116@7@hplip SYSTEM USER,,,@/RUN/HPLIP@/BIN/FALSE
##GNOME-INITIAL-SETUP@X@119@65534@@/RUN/GNOME-INITIAL-SETUP/@/BIN/FALSE

