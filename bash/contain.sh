#!/bin/bash

file_reg="$2"
pattern="$1"

if [ $# = 1 ]; then
    grep -i "$1" `find -name "*" -print` | cut -d":" -f1 | sort -u
else
    grep -i "$1" `find -name "$file_reg" -print` | cut -d":" -f1 | sort -u | cat $1 | grep -i pattern
fi

# exist status
echo "exit $?"
