lsof -i :5000 >temp.txt
awk 'NR == 2 {print $2}' temp.txt > processFlaskId
pid=$(cat processFlaskId)

memThreshold=75
cpuThreshold=75
#echo $pid

while :
do
    top -p $pid -b -n 1 > usage.txt
    cpuUse=$(awk 'NR == 8 {print $9}' usage.txt)
    echo $cpuUse >> usagecpu
    #cpuUse= $(awk 'NR == 8 {print $9}')
    #echo Cpu Use: $cpuUse
    echo Cpu Use: $cpuUse

    memUse=$(awk 'NR == 8 {print $10}' usage.txt) 
    echo $memUse>> usagemem
    echo Memory CPU: $memUse
    #memUse= $($memUse | bc)

    if [[ $cpuUse == $cpuThreshold ]]
    then
	echo "Shutting Down due to cpu overuse"
	#shutdown -r now
    else
	echo "Server is running normally"
    fi	    

    if [[ $memUse == $memThreshold ]]

    then
	    echo "Shutting down due to memory overuse  $memUse"
	    #shutdown -r now
    else
	    echo "Server is running normally"
    fi
    sleep 1 
done
