#!/bin/bash
if [ $# -lt 2 ];
then      
    echo "usage:$0 <username> <ipaddr>"
  
    exit 1

fi
 USERNAME=$1
 HOSTS=$2
 SCRIPT=$3
a="$4 "
b=" "
c="$6"
for HOSTNAME in ${HOSTS} ; do
   ssh -l "${USERNAME}" "${HOSTNAME}" "${SCRIPT}" "${a}" "${b}" "${c}"
done
