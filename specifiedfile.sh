#!bin/sh

echo "Enter the file name"

read filename

echo "Enter the word you want to find."  

read word

 find -name "$filename" | xargs grep -i $word


