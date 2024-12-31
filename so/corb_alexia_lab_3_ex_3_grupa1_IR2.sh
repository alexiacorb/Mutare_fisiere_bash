#!/usr/bin/bash

# Corb Alexia-Gabriela

## folsoim du -sh pentru a obtine rezumatul folosirii pe disk a unui director
## folosim sort -h pentru a sorta fisierele dupa dimensiune
## am folosit sudo pentru a rula ca administrator,pt ca fara primeam :
## du: cannot read directory '/var/log/speech-dispatcher': Permission denied
## du: cannot read directory '/var/log/sssd': Permission denied
## du: cannot read directory '/var/log/gdm3': Permission denied
## du: cannot read directory '/var/log/private': Permission denied
# am folosit /* pentru a extrage tot din var/log  
sudo du -sh /var/log/* | sort -h >  sorted_files.txt

# test rulat 
## 0	/var/log/boot.log
#0	/var/log/btmp
#0	/var/log/faillog
#0	/var/log/lastlog
#0	/var/log/README
#4.0K	/var/log/apport.log
#4.0K	/var/log/apport.log.1
#4.0K	/var/log/apport.log.2.gz
#4.0K	/var/log/apport.log.3.gz
#4.0K	/var/log/apport.log.4.gz
#4.0K	/var/log/apport.log.5.gz
#4.0K	/var/log/cups-browsed
#4.0K	/var/log/dist-upgrade
#4.0K	/var/log/gdm3
#4.0K	/var/log/gpu-manager.log
#4.0K	/var/log/openvpn
#4.0K	/var/log/private
#4.0K	/var/log/speech-dispatcher
#4.0K	/var/log/sssd
#4.0K	/var/log/vboxpostinstall.log
#8.0K	/var/log/auth.log.2.gz
#8.0K	/var/log/cloud-init-output.log
#8.0K	/var/log/fontconfig.log
#8.0K	/var/log/hp
#12K	/var/log/wtmp
#16K	/var/log/dmesg.1.gz
#16K	/var/log/dmesg.2.gz
#16K	/var/log/dmesg.3.gz
#16K	/var/log/dmesg.4.gz
#20K	/var/log/boot.log.1
#24K	/var/log/auth.log
#32K	/var/log/alternatives.log
#32K	/var/log/cups
#40K	/var/log/unattended-upgrades
#52K	/var/log/dmesg.0
#56K	/var/log/auth.log.1
#56K	/var/log/dmesg
#84K	/var/log/kern.log
#88K	/var/log/cloud-init.log
#96K	/var/log/boot.log.2
#108K	/var/log/kern.log.2.gz
#116K	/var/log/bootstrap.log
#196K	/var/log/apt
#288K	/var/log/syslog
#384K	/var/log/syslog.2.gz
#404K	/var/log/kern.log.1
#804K	/var/log/sysstat
#968K	/var/log/dpkg.log
#1.1M	/var/log/installer
#1.5M	/var/log/syslog.1
#156M	/var/log/journal

## fara a folosi /* obtineam doar urmatorul rezultat 
## 162M	/var/log
