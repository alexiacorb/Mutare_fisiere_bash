
#!/usr/bin/bash

## Corb Alexia-Gabriela, grupa 1

## afisam un mesaj prin care ii cerem utilizatorului o fraza
echo "Introduceti o fraza"

## citim fraza si o stocam in variabila fraza
read -r fraza

## comanda test -z urmat de variabila verifica daca fraza este un string gol 
## in caz afirmativ afiseaza la stderr , negativ (avem litere) -> stdout
test -z "$fraza" && echo "Stringul este gol" >&2 || echo "Fraza introdusa este: $fraza"

## exemple rulate cu succes
## cazul 1 - utilizatorul introduce un mesaj 
## exemplu de rulare -- Aceasta este primul exercitiu
## rezultatul obtinut -- Fraza introdusa este: Aceasta este primul exercitiu

## cazul 2 - utilizatorul nu introduce nimic (am testat cu enter)
## va fi redirectionat la STDERR mesajul "Stringul este gol"
