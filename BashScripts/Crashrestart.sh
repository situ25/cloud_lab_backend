lsof -i :5000 >temp.txt
awk 'NR == 2 {print $2}' temp.txt > processFlaskId
pid=$(cat processFlaskId)

memThreshold=2.0
cpuThreshold=0.0
#echo $pid

while :
do
    top -p $pid -b -n 1 > usage.txt
    awk 'NR == 8 {print $9}' usage.txt > usagecpu
    cpuUse=$(cat usagecpu)
    echo Cpu Use: $cpuUse

    awk 'NR == 8 {print $10}' usage.txt > usagemem
    memUse=$(cat usagemem)
    echo Memory CPU: $memUse

    if [ $cpuUse == $cpuThreshold ] || [ $memUse -gt $memThreshold ]
    then
	echo "Shutting Down"
	#shutdown -r now
    else
	echo "Server is running normally"
    fi	    
    sleep 20
done
