#!/bin/bash
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=1
if [ "$CURRENT" -gt "$THRESHOLD" ] ;
then
  mail -s 'Disk Space Alert' nrajashekarreddy94@gmail.com << EOF
Your root partition remaining free space is critically low.
 Used: $CURRENT%
EOF
fi #close if statement.
