#System Status Script
echo "========================"
echo " System Status Report "
echo "========================"

#Display CPU load
echo "\n\nCPU Load:"
uptime | awk -F 'load average:' '{ print "Current Load:" $2 }'

#Memory usage
echo "\n\nMemory Usage:"
free -h | awk '/^Mem/ { print "Used: " $3 ", Free: " $4 }'

#Disk usage
echo "\n\nDisk Usage:"
df -h --total | grep 'total' | awk '{ print "Total: " $2 ", Used: " $3 ", Available: " $4 }'

#Network usage
echo "\n\nNetwork Usage:"
echo "Interface   Received   Transmitted"
cat /proc/net/dev | awk '/:/ { interface=$1; rx=$2; tx=$10; gsub(/:/, "", interface); if(interface != "lo") printf "%-10s %8s %8s \n", interface, rx, tx }'

#Active loggied-in users
echo "\n\nActive Looged-in Users:"
who

echo "\n\nReport Completed."
