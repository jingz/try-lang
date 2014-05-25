#!/bin/bash

curl "http://bravefrontierglobal.wikia.com/wiki/{`cat bravelist.txt | ruby -n -e 'puts $_.match(/\w+$/)[0]' | tr '\n' ',' | sed 's/,$//'`}" --create-dirs -o html/#1.html
