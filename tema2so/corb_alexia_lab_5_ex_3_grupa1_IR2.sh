#!/bin/bash

#Corb Alexia-Gabriela , grupa 1

# folosim export pentru a face variabila vizibila si celorlalte scripturi pentru a putea fi folosita pe tot parcursul de viata al sesiunii de sh
# folosim comanda printenv pentru afisarea variabilelor de mediu
# folosim pipe urmat de cut pentru a extrage separand cu -d si -f prima coloana inainte de = 
# verificam cu -z daca variabila este 
MYVAR="Variabila de mediu personalizata"
export MYVAR
for varmediu in $( printenv | cut -d '=' -f 1 ); do 
	echo $varmediu
done  

if [ ! -z "$MYVAR" ]; then
	unset MYVAR
fi

echo "${MYVAR:-"Valoare implicita"}"


##Test de rulare cu succes 
##SHELL
#SESSION_MANAGER
#QT_ACCESSIBILITY
#COLORTERM
#XDG_CONFIG_DIRS
#XDG_MENU_PREFIX
#GNOME_DESKTOP_SESSION_ID
##MYVAR
#GNOME_SHELL_SESSION_MODE
#SSH_AUTH_SOCK
#MEMORY_PRESSURE_WRITE
#XMODIFIERS
#DESKTOP_SESSION
#GTK_MODULES
#PWD
#XDG_SESSION_DESKTOP
#LOGNAME
#XDG_SESSION_TYPE
#SYSTEMD_EXEC_PID
#XAUTHORITY
#HOME
#USERNAME
#IM_CONFIG_PHASE
#LANG
#LS_COLORS
#XDG_CURRENT_DESKTOP
#MEMORY_PRESSURE_WATCH
#VTE_VERSION
#WAYLAND_DISPLAY
#GNOME_TERMINAL_SCREEN
#GNOME_SETUP_DISPLAY
#LESSCLOSE
#XDG_SESSION_CLASS
#TERM
#LESSOPEN
#USER
#GNOME_TERMINAL_SERVICE
#DISPLAY
#SHLVL
#GSM_SKIP_SSH_AGENT_WORKAROUND
#QT_IM_MODULE
#XDG_RUNTIME_DIR
#DEBUGINFOD_URLS
#XDG_DATA_DIRS
#PATH
#GDMSESSION
#DBUS_SESSION_BUS_ADDRESS
#OLDPWD
#_
#Valoare implicita
 
