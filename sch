#!/bin/bash

#downloading log file
wget -O position https://inductions.delta.nitt.edu/sysad-task1-position.log

#getting current date for auto updation of posts
matchitem=$(date "+%Y-%m-%d")
#echo $match

#creating files and giving input
for i in {1..50}
do
    touch /home/Army$i/post_alloted
    cat position | grep -w "Army$i" | grep -w "^+$matchitem" | cut -d " " -f 1,4,5 > /home/Army$i/post_alloted
    
    touch /home/Navy$i/post_alloted
    cat position | grep -w "Navy$i" | grep -w "^+$matchitem" | cut -d " " -f 1,4,5 > /home/Navy$i/post_alloted
    
    touch /home/AirForce$i/post_alloted
    cat position | grep -w "AirForce$i" | grep -w "^+$matchitem" | cut -d " " -f 1,4,5 > /home/AirForce$i/post_alloted
done

echo Done
