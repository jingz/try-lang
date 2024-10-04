#!/bin/bash
set -e
set -x
grep not_there /dev/null
echo $?
