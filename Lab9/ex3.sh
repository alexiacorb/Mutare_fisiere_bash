#!/bin/bash

# gaseste fisierele .conf din etc2
# inlocuieste toate aparitiile lui deprecated cu update
find etc2 -name '*.conf' -exec grep -l "deprecated" {} + | 
while read file; do 
sed -i 's/deprecated/updated/g' "$file" 
done
