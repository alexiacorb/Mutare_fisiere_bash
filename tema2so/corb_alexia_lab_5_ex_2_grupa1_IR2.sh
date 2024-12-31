#!/bin/bash

#Corb Alexia-Gabriela, grupa 1

## folosim id -u pentru a afisa UID ul userului curent  
id -u 
## folosim id -g pentru a afisa GID ul curent 
id -g

# folosim ps -  u pentru a extrage procesele care ruleaza sub utilizatorul mentionat intre paranteze
interval=5
## folosim sleep pentru a astepta 5 seceunde ( valoarea variabilei interval)

while true; do 
	echo "Procesele ce ruleaza sub utilizatorul $(id -u) sunt:"
	ps -u $(id -u)
	## folosim -o %mem aferent ps pentru a afisa memoria necesara proceselor 
	echo "Memoria folosita pentru aceste procese este: "
	ps -u $(id -u) -o %mem
	sleep "$interval"
done 

## Test rulat cu succes 
## 1000
## 1000
## Procesele ce ruleaza sub utilizatorul 1000 sunt:
##    PID TTY          TIME CMD
##   1707 ?        00:00:01 systemd
##   1711 ?        00:00:00 (sd-pam)
##   1724 ?        00:00:00 pipewire
##   1725 ?        00:00:00 pipewire
##   1730 ?        00:00:00 wireplumber
##   1732 ?        00:00:01 pipewire-pulse
##   1738 ?        00:00:03 dbus-daemon
##   1741 ?        00:00:00 gnome-keyring-d
##   1766 ?        00:00:00 xdg-document-po
##   1776 ?        00:00:00 xdg-permission-
##   1793 tty2     00:00:00 gdm-wayland-ses
##   1799 tty2     00:00:00 gnome-session-b
##   1873 ?        00:00:00 gcr-ssh-agent
##   1874 ?        00:00:00 gnome-session-c
##   1888 ?        00:00:00 gvfsd
##   1896 ?        00:00:00 gvfsd-fuse
##   1899 ?        00:00:00 gnome-session-b
##   1943 ?        00:00:00 at-spi-bus-laun
##   1953 ?        00:51:53 gnome-shell
##   1957 ?        00:00:00 dbus-daemon
##   2019 ?        00:00:00 at-spi2-registr
##   2039 ?        00:00:00 gnome-shell-cal
##   2046 ?        00:00:00 evolution-sourc
##   2059 ?        00:00:00 gjs
## ..........................................
## Memoria folosita pentru aceste procese este: 
##%MEM
## 0.1
## 0.0
## 0.3
## 0.0
## 0.2
## 0.6
## 0.0
## 0.1
## 0.0
## 0.0
## 0.0
## 0.1
## 0.0
## 0.0
## 0.0
## 0.0
## 0.1
## 0.0
## 9.4
## 0.0

