
#!/bin/bash
if [ $# -lt 2 ];
then      
    echo "usage:$0 <number of words> <file type>"
  
    exit 1
fi
x=1
a=$1
while [ $x -le $a ];
do
echo "enter $x pattern to search "
    
   read files
   find *.$2 | xargs grep --color -i $files
   x=$(($x + 1))
   
   
done


