#!/bin/bash
 
#
# Your Datas
#
 
TMB_USER='wsaryoo@gmail.com';
TMB_PASS='';
 
#
# What to Write
#
 
TMB_TYPE='text';
TMB_TITLE='The post title';
TMB_CONTENT='This is the body of the post.';
 
#
# Updating
#
 
     # -o /dev/null \
curl -s \
     -o $0.log \
     -X POST \
     -d "email=$TMB_USER&password=$TMB_PASS&type=$TMB_TYPE&title=$TMB_TITLE&body=$TMB_CONTENT&generator=Bash&state=draft" \
     http://api.tumblr.com/v2/blog/ejing/post
