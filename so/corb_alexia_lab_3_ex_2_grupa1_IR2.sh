#!/bin/bash

#Corb Alexia-Gabriela , grupa 1 

## verificam daca fisierul exista cu comanda test -f si daca are permisiuni de citire cu -r
## folsoim sudo pentru a primi permisiuni asupra fisierelor 
## folosim comanda tail -n 10 pentru a afisa ultimele 10 linii in cazul in care poate fi citit si exista fisierul
## daca nu poate fi citit sau nu exista il cream si afisam Fisier creat 

sudo test -f /var/log/syslog && sudo test -r /var/log/syslog && tail -n 10 /var/log/syslog || (sudo touch /var/log/syslog && echo "Fisier creat")

## test rulat cu succes 
## [sudo] password for student: 
##2024-10-23T09:08:03.424046+00:00 Ubuntu gnome-shell[1923]: Window manager warning: Overwriting existing binding of keysym 38 with keysym 38 (keycode 11).
##2024-10-23T09:08:03.424183+00:00 Ubuntu gnome-shell[1923]: Window manager warning: Overwriting existing binding of keysym 35 with keysym 35 (keycode e).
##2024-10-23T09:08:03.424256+00:00 Ubuntu gnome-shell[1923]: Window manager warning: Overwriting existing binding of keysym 37 with keysym 37 (keycode 10).
##2024-10-23T09:08:03.424315+00:00 Ubuntu gnome-shell[1923]: Window manager warning: Overwriting existing binding of keysym 37 with keysym 37 (keycode 10).
##2024-10-23T09:08:03.481133+00:00 Ubuntu gnome-shell[1923]: GFileInfo created without standard::icon
##2024-10-23T09:08:03.481304+00:00 Ubuntu gnome-shell[1923]: file ../../../gio/gfileinfo.c: line 1765 (g_file_info_get_icon): should not be reached
##2024-10-23T09:08:27.510436+00:00 Ubuntu systemd[1]: fprintd.service: Deactivated successfully.
##2024-10-23T09:10:12.310525+00:00 Ubuntu systemd[1]: Starting sysstat-collect.service - system activity accounting tool...
##2024-10-23T09:10:12.318616+00:00 Ubuntu systemd[1]: sysstat-collect.service: Deactivated successfully.
##2024-10-23T09:10:12.319019+00:00 Ubuntu systemd[1]: Finished sysstat-collect.service - system activity accounting tool.

## test rulat fara succes 
## 2024-10-23T09:08:03.424315+00:00 Ubuntu gnome-shell[1923]: Window manager warning: Overwriting existing binding of keysym 37 with keysym 37 (keycode 10).
## 2024-10-23T09:08:03.481133+00:00 Ubuntu gnome-shell[1923]: GFileInfo created without standard::icon
## 2024-10-23T09:08:03.481304+00:00 Ubuntu gnome-shell[1923]: file ../../../gio/gfileinfo.c: line 1765 (g_file_info_get_icon): should not be reached
## 2024-10-23T09:08:27.510436+00:00 Ubuntu systemd[1]: fprintd.service: Deactivated successfully.
## 2024-10-23T09:10:12.310525+00:00 Ubuntu systemd[1]: Starting sysstat-collect.service - system activity accounting tool...
## 2024-10-23T09:10:12.318616+00:00 Ubuntu systemd[1]: sysstat-collect.service: Deactivated successfully.
## 2024-10-23T09:10:12.319019+00:00 Ubuntu systemd[1]: Finished sysstat-collect.service - system activity accounting tool.
## 2024-10-23T09:12:48.236226+00:00 Ubuntu tracker-miner-fs-3[7019]: (tracker-extract-3:7019): GLib-GIO-WARNING **: 09:12:48.235: Error creating IO channel for /proc/self/mountinfo: Invalid argument (g-io-error-quark, 13)
## 2024-10-23T09:13:17.771337+00:00 Ubuntu tracker-miner-fs-3[7115]: (tracker-extract-3:7115): GLib-GIO-WARNING **: 09:13:17.770: Error creating IO channel for /proc/self/mountinfo: Invalid argument (g-io-error-quark, 13)
## 2024-10-23T09:13:47.675679+00:00 Ubuntu tracker-miner-fs-3[7127]: (tracker-extract-3:7127): GLib-GIO-WARNING **: 09:13:47.675: Error creating IO channel for /proc/self/mountinfo: Invalid argument (g-io-error-quark, 13)

