# #!/bin/bash
# Varianta 13 - Problema 1
# Scriptul va primi ca și argument un director (verificați numărul corect de argumente și existența acestuia pe sistem) și va:
# 
# - găsi toate fișierele care au fost modificate în ultimele 7 zile și conțin cel puțin un link simbolic,
# - copia aceste fișiere și linkurile simbolice într-un folder numit /tmp/linked_files/ (creat dacă nu există),
# - seta un cron job care, în fiecare săptămână, în ziua de miercuri, la ora 03:30, verifică:
# - dacă fișierele originale mai există; dacă nu, șterge linkurile simbolice și scrie un mesaj de avertizare în log-ul sistemului,
# - dacă fișierele originale există, actualizează timestamp-ul fișierelor din /tmp/linked_files/.
