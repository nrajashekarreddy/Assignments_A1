#! /bin/bash -e
#echo "Maximum memory"
free -t -m | grep "Total" | awk '{ print "Maximum Memory : "$2 " ";
}'
AvgMemory(){
avg=`echo "scale = 3; $1/$2" | bc`
echo "Avg memory : $avg"
}
AvgCpu(){
avg1=`echo "scale = 3; $1 / $2" | bc`
echo "Avg cpu : $avg1"
}
AvgDisk(){
avg2=`echo "scale = 3; $1 / $2"| bc`
echo "Avg disk : $avg2"
}
count=0

mem=0

DiskUsage=0

CpuUsage=0
if [[ $# -lt 1 ]];
then       
	echo "usage:$0 <missing argument>"
	echo "input time period in secs"
	exit 102
fi
printf "Memory\t\tDisk\t\tCPU\n"
end=$((SECONDS+$1))
while [ $SECONDS -le $end ]; do

	MEMORY=$(free -m | awk 'NR==2{printf "%.2f\t\t",$3*100/$2 }')

	DISK=$(df -h | awk '$NF=="/"{printf "%.2f\t\t", $5}')

	CPU=$(top -bn1 | grep load | awk '{printf "%.2f\t\t\n", $(NF-2)}')

	echo "$MEMORY$DISK$CPU"

	mem=`echo $mem + $MEMORY | bc`

	DiskUsage=`echo $DiskUsage + $DISK | bc`

	CpuUsage=`echo $CpuUsage + $CPU | bc`

	count=$(( $count + 1))

	sleep 5
done
AvgMemory $mem $count
AvgDisk $DiskUsage $count
AvgCpu  $CpuUsage $count
echo -e "Enter the resource you want ::\n memory | disk | cpu\n"
read resource 
case $resource in
	"memory")	
			echo -e "You have selected Memory details:\n "
			#echo -e "\n"			
			echo -e ">>\t $avg %  Average Memory Usage of the System.\n" 

	;;
	"disk")
			echo -e "You have selected Disk details:\n"
			#echo -e "\n"	
			echo -e ">>\t $avg2%  Average Disk Usage of the System.\n" 
	;;
	"cpu")
			echo "You have selected CPU details :"
			#echo -e "\n"	
			echo -e ">>\t $avg1%  Average CPU Usage of the System."	

	;;

	    *)

			echo -e ">>\t Invalid Resource \n>>\tCheck the Resource the and try again"
esac


