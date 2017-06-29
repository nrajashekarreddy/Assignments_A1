#!/bin/bash
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=1
if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
   mail -s 'Disk Space Alert' nrajashekarreddy94@gmail.com << EOF
Your root partition remaining free space is critically low
"Clean the Disk".
Your System has Used: $CURRENT% 
EOF
echo ">>date<<"
echo "Your root partition remaining free space is critically low"
echo Your System has Used: $CURRENT %
echo "Clean the Disk"
echo ">> end <<"
else
echo ">>date<<"
echo no problem
fi
