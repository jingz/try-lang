#!/bin/bash

curl -o json_stack \
     -H "Content-Type: application/json" \
     -H "Accept: application/json" \
     -A "Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17" \
     --compressed \
     -G -d "answers=true&order=desc&page=1&pagesize=100&sort=votes&tagged=javascript" \
     http://api.stackoverflow.com/1.1/questions
