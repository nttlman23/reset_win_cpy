#!/bin/bash

recurse() {
    for i in "$1"/*;do
	if [ -d "$i" ];then
	    echo "Entering dir: $i"
        chmod go-w "$i"
	    recurse "$i"
	elif [ -f "$i" ]; then
	    EXC=`file "$i"|grep executable`
	    if [[ -z $EXC ]];then
	        echo "Processing $i"
		chmod ugo-x "$i"
	    fi
        #echo "file: $i"
	fi
    done
}

recurse .
