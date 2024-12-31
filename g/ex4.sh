#!/bin/bash


if [ $# -ne 1 ];then 
	exit 1
fi
dir=$1
if [ ! -d $dir ];then
	exit 1
fi

if [ -f /tmp/symbolic_uppercase_files.txt ];then
	echo "Fisierul symbolic_uppercase_files.txt exista"
else 
	touch /tmp/symbolic_uppercase_files.txt
fi

if [ -f /tmp/structured_files.txt ];then
	echo "Fisierul structured_files.txt exista"
else 
	touch /tmp/structured_files.txt
fi

if [ -f /tmp/underscore_files.txt ];then
	echo "Fisierul underscore_files.txt exista"
else 
	touch /tmp/underscore_files.txt
fi

ls -l $dir
find "$dir" -type f | grep -E '[A-Z]|[^a-z0-9._/-]' > /tmp/symbolic_uppercase_files.txt
find "$dir" -type f \( -name ".json" -o -name ".xml" -o -name "*.yaml" \) > /tmp/structured_files.txt
find "$dir" -type f -name "_*" > /tmp/underscore_files.txt

JSON_FILES=$(find "$dir" -type f -name "*.json")
COUNT=0
if [ -n "$JSON_FILES" ]; then
    tar -czf /tmp/json_backup.tar.gz $JSON_FILES
    COUNT=$(echo "$JSON_FILES" | wc -l)
fi

cat <<EOF > /tmp/report.xml
<report>
    <archived_json_files>$COUNT</archived_json_files>
</report>
EOF

echo "Raport creat în /tmp/report.xml"
echo "Fișiere symbol/uppercase: /tmp/symbolic_uppercase_files.txt"
echo "Fișiere structurate: /tmp/structured_files.txt"
echo "Fișiere underscore: /tmp/underscore_files.txt"
echo "Arhivă JSON: /tmp/json_backup.tar.gz (dacă fișiere json au existat)"
