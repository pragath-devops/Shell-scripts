#!/bin/bash

# Get the number of CPU cores
cpu_cores=$(nproc)

# Get the load average for the last 1 minute
load_average=$(uptime | awk -F 'average:' '{print $2}' | awk '{print $1}' | cut -d "," -f1)

echo "Number of CPU cores: $cpu_cores"
echo "Load average (1 min): $load_average"

# Check if there is only 1 CPU core
if [ "$cpu_cores" -eq 1 ];
then
    echo "Alert: CPU core count is 1."

# Convert load average to integer for comparison
    load_average_int=$(awk -v load_avg="$load_average" 'BEGIN{ printf "%.0f", load_avg*100}')

    # Check load average thresholds and print corresponding alerts
    if [ $load_average_int -ge 60 -a $load_average_int -lt 75 ]
    then
        echo "Alert: p3 or medium load is :$load_average_int%"
    elif [ $load_average_int -ge 75 -a $load_average_int -lt 90 ]
    then
        echo "Alert: p2 or high load is :$load_average_int%"
    elif [ $load_average_int -ge 90 -a $load_average_int -lt 100 ]
    then
        echo "Alert: p1 critical load is $load_average_int%"
    else
        echo "No alert and cpu load is healthy and below 1"
    fi
else
    echo "No alert: CPU core count is greater than 1."
fi





#info
load_average=$(uptime | awk -F 'average:' '{print $2}' | awk '{print $1}' | cut -d "," -f1)

This Bash script snippet uses awk to calculate the load average percentage. Let me break it down for you:

awk -v load_avg="$load_average": This starts an awk command and assigns the value of the variable load_average to an awk variable load_avg.
'BEGIN{ printf "%.0f", load_avg*100}': This part is an awk BEGIN block, which means it's executed before processing any input. Inside this block:
printf "%.0f": This part is a printf statement that formats the output. %.0f tells printf to format the number with zero decimal places.
load_avg*100: This multiplies the load_avg variable (which holds the load average) by 100 to convert it into a percentage.
load_average_int=$(...): This captures the output of the awk command and stores it in the variable load_average_int.
So, the whole line takes the load_average variable, multiplies it by 100, and then formats it to an integer value. The result is stored in the load_average_int variable.


to check the load useing "uptime" command

uptime
 08:45:13 up 13 min,  2 users,  load average: 0.00, 0.03, 0.06
ubuntu@ip-172-31-42-132:~$ uptime | awk -F 'average:' '{print $2}'
 0.00, 0.02, 0.06
ubuntu@ip-172-31-42-132:~$ uptime | awk -F 'average:' '{print $2}' | awk '{print $1}'
0.00,
ubuntu@ip-172-31-42-132:~$ uptime | awk -F 'average:' '{print $2}' | awk '{print $1}' | cut -d "," -f1
0.00


sh -x load.sh
+ nproc
+ cpu_cores=1
+ cut -d , -f1
+ awk {print $1}
+ awk -F average: {print $2}
+ uptime
+ load_average=0.27
+ echo Number of CPU cores: 1
Number of CPU cores: 1
+ echo Load average (1 min): 0.27
Load average (1 min): 0.27
+ [ 1 -eq 1 ]
+ echo Alert: CPU core count is 1.
Alert: CPU core count is 1.
+ awk -v load_avg=0.27 BEGIN{ printf "%.0f", load_avg*100}
+ load_average_int=27
+ [ 27 -ge 60 -a 27 -lt 75 ]
+ [ 27 -ge 75 -a 27 -lt 90 ]
+ [ 27 -ge 90 -a 27 -lt 100 ]
+ echo No alert and cpu load is healthy and below 1
No alert and cpu load is healthy and below 1


sh load.sh
Number of CPU cores: 1
Load average (1 min): 0.04
Alert: CPU core count is 1.
No alert and cpu load is healthy and below 1


check load
-----------
sudo snap install glances 

glances
top then press 1
htop

stress the load
----------------
stress --cpu 4 --timeout 60s
