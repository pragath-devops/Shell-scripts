#!/bin/bash

# Get memory usage percentage
memory_percentage=$(free -m | awk '/Mem/{printf("%.2f"), $3/$2*100}' | cut -d "." -f1)

echo "memory usage :$memory_percentage%"

# Check memory thresholds and trigger alerts accordingly

if [ $memory_percentage -ge 60 -a $memory_percentage -lt 75 ]
then
    echo "Memory usage is between 60% and 75%"
    echo "Alert : P3 or medium and memory usage is :$memory_percentage%"

elif [ $memory_percentage -ge 75 -a $memory_percentage -lt 90 ]
then
    echo "Memory usage is between 75% and 90%"
    echo "Alert : P2 or high and memory usage is :$memory_percentage%"

elif [ $memory_percentage -ge 90 -a $memory_percentage -le 100 ]
then
    echo "Memory usage is between 90% and 100%"
    echo "Alert : P1 or critical and memory usage is :$memory_percentage%"
else
    echo "Memory usage is below 60% and healthy"
    echo "No Alert and memory-ram usage is :$memory_percentage%"
fi

-------------------------------------------------------------------------

get memory using 'free' command

free
               total        used        free      shared  buff/cache   available
Mem:          972020      438792       71936         876      461292      369576
Swap:              0           0           0

free -m
               total        used        free      shared  buff/cache   available
Mem:             949         428          70           0         450         360
Swap:              0           0           0

free -m | awk '/Mem/'
Mem:             949         428          70           0         450         361

free | awk '/Mem/{printf("%.2f"), $3/$2*100}'
45.04

 free -m | awk '/Mem/{print $3/$2*100}' | cut -d "." -f1
44

this is memory percentage

sh -x memory-percentage-alerts.sh
+ cut -d . -f1
+ awk /Mem/{printf("%.2f"), $3/$2*100}
+ free
+ memory_percentage=45
+ echo Memory Percentage: 45%
Memory Percentage: 45%
+ [ 45 -ge 60 -a 45 -lt 75 ]
+ [ 45 -ge 75 -a 45 -lt 90 ]
+ [ 45 -ge 90 -a 45 -le 100 ]
+ echo Memory usage is below 60% and healthy
Memory usage is below 60% and healthy
+ echo No Alert and cpu usage is :45%
No Alert and cpu usage is :45%

sh memory-percentage-alerts.sh
Memory Percentage: 45%
Memory usage is below 60% and healthy
No Alert and cpu usage is :45%


memory commands
----------------
free -m
htop
top
vmstat


Every 2.0s: sh memory-percentage-alerts.sh                      ip-172-31-42-132: Fri May  3 03:46:00 2024

Memory Percentage: 43%
Memory usage is below 60% and healthy
No Alert and cpu usage is :43%



stress the memory/ram
---------------------
sudo apt-get install stress

 stress --vm 1 --vm-bytes 800 --timeout 60s
stress --vm 4 --vm-bytes 100M

sh memory-percentage-alerts.sh
memory usage :62%
Memory usage is between 60% and 75%
Alert : P3 or medium and memory usage is :62%

Every 2.0s: sh memory-percentage-alerts.sh                                                                          ip-172-31-42-132: Fri May  3 04:52:48 2024

memory usage :82%
Memory usage is between 75% and 90%
Alert : P2 or high and memory usage is :82%









one more way
--------------
# Get memory information using free command
memory_info=$(free -m | awk 'NR==2{printf "%d %d", $3, $2}')

# Extract used and total memory
used_memory=$(echo $memory_info | awk '{print $1}')
total_memory=$(echo $memory_info | awk '{print $2}')

# Calculate memory percentage
memory_percentage=$(awk "BEGIN {printf \"%.2f\", $used_memory / $total_memory * 100}" | cut -d "." -f1)

echo "Memory Percentage: $memory_percentage%"
