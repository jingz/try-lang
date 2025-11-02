#!/bin/bash

ruby -e "require 'json'; require 'ap'; x = File.read('json_stack'); jx = JSON.load(x); ap jx['questions'].map{|q| q['title'] }"
