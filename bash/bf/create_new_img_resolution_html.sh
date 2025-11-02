#!/bin/bash
grep class=\"image `ls -rt` | ruby -n -e '
    matches = $_.match(/(.*)\.html.*width=\"(\d+)\"\s+height=\"(\d+)\"/i); 
    "#{matches[1]} \t #{matches[2]} \t #{matches[3]} \t\t\t mini: 100 x #{matches[3].to_i/2}"; 
    w=50; h=matches[3].to_i/4; link = $_.match(/[^\s|\"]+.png/); 
    puts "<img src=\"#{link}\" width=#{w} height=#{h} key=\"#{matches[1]}\" title=\"#{matches[1]}\ntest\nline2\" />"' > all.html
