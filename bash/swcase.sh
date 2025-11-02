#!/bin/bash

var='sdss'
case $var in
     's') echo 's' ;;
     'ss') echo 'ss' ;;
     'sss') echo 'sss' ;;
     *) echo 'default not found' ;;
esac
