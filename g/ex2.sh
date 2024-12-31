#!/bin/bash

if [ $# -ne 1 ]; then
	exit 1
fi
fisier=$1
if [ ! -f $fisier ];then
	exit 1
fi
if [ ! -r $fisier ] || [ ! -w $fisier ]; then
	exit 1
fi

awk -v timestamp="$(date '+%Y-%m-%d %H:%M:%S')" -v user=$USER '{
	if (gsub(/[0-9]+/, "&") >= 2) {
        print "!!!"
        next
    	}	
    	if($0 ~ /^[A-Z0-9]+$/ && gsub(/[0-9]/,"&") >= 2){ 
    	next
    	}
	if ($0 ~ /(^|[[:space:]])(one|two|three|four|five|six|seven|eight|nine|ten)($|[[:space:]])/) {
        print timestamp
        print $0
        next
    	}
    if ($0 ~ /[[:alnum:]]+[^[:alnum:][:space:]]+/) {
    	print $0
        print user
        next
    }
}' "$fisier" > tmpfile && mv tmpfile "$fisier"
