#!/bin/bash
 USERNAME=$1
 HOSTS=$2
 SCRIPT="pwd; ls"
for HOSTNAME in ${HOSTS} ; do
   ssh -l "${USERNAME}" "${HOSTNAME}" "${SCRIPT}"
done
