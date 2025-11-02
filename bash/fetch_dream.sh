#!/bin/bash

for (( i = 1; i <= 20; i++ )); do
    curl -o dream_page$i.html \
         -H "Content-Type: text/html; charset: utf-8" \
         -A "Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17" \
         -G -d "answers=true&order=desc&page=1&pagesize=100&sort=votes&tagged=javascript" \
         http://chomtong.com/html/dream/dream$i.html
done
