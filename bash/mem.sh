#!/bin/bash

TEXT=`top -n 1 -b | grep 'Mem'`
TOTAL=`echo $TEXT | cut -d' ' -f2 | cut -d'k' -f1`
USAGED=`echo $TEXT | cut -d' ' -f4 | cut -d'k' -f1`
FREE=`echo $TEXT | cut -d' ' -f6 | cut -d'k' -f1`

echo $TEXT
echo $TOTAL
echo $USAGED
echo `expr $(echo $FREE) \* 100 / $(echo $TOTAL)`%
