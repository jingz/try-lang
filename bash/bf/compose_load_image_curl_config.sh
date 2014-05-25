#!/bin/bash

grep class=\"image html/ | ruby -n -e 'puts $_.match(/[^\s]+png\"/)[0].gsub("href", "url"); puts "output=\"unit_pics/#{$_.match(/.*\.html/)[0].gsub(".html",".png")}\""'
