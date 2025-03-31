#!/bin/bash

# Get disk usage in percentage
disk_usage=$(df -h | grep "/dev/root" | awk '{print $5}' | cut -d "%" -f1)

echo "Disk Usage: $disk_usage%"

# Check disk usage thresholds and print corresponding alerts
if [ $disk_usage -ge 60 -a $disk_usage -lt 75 ]
then
    echo "Disk usage is between 60% to 75%. Alert: p3 or medium disk use is :$disk_usage%" 
elif [ $disk_usage -ge 75 -a $disk_usage -lt 90 ]
then
    echo "Disk usage is between 75% to 90%. Alert: p2 or high disk use is :$disk_usage%" 
elif [ $disk_usage -ge 90 -a $disk_usage -le 100 ]
then
    echo "Disk usage is between 90% to 100%. Alert: p1 or critical disk use is :$disk_usage%" 
else
    echo "No alert and disk usage is under 60% healthy and disk usage is :$disk_usage%"
fi



check disk "use df -h" command

 df
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/root        7941576 5186748   2738444  66% /
tmpfs             486016       0    486016   0% /dev/shm
tmpfs             194408     892    193516   1% /run
tmpfs               5120       0      5120   0% /run/lock
/dev/xvda15       106832    6186    100646   6% /boot/efi
tmpfs              97200       4     97196   1% /run/user/1000
ubuntu@ip-172-31-42-132:~/ashok/real-time-scripts$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       7.6G  5.0G  2.7G  66% /
tmpfs           475M     0  475M   0% /dev/shm
tmpfs           190M  892K  189M   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/xvda15     105M  6.1M   99M   6% /boot/efi
tmpfs            95M  4.0K   95M   1% /run/user/1000
ubuntu@ip-172-31-42-132:~/ashok/real-time-scripts$ df -h | grep "/dev/root"
/dev/root       7.6G  5.0G  2.7G  66% /
ubuntu@ip-172-31-42-132:~$ df -h | grep '/dev/root' | awk '{print $5}'
66%
ubuntu@ip-172-31-42-132:~$ df -h | grep '/dev/root' | awk '{print $5}' | cut -d "%" -f1
66

  sh -x disk-usage.sh
+ cut -d % -f1
+ awk {print $5}
+ grep /dev/root
+ df -h
+ disk_usage=80
+ echo Disk Usage: 80%
Disk Usage: 80%
+ [ 80 -ge 60 -a 80 -lt 75 ]
+ [ 80 -ge 75 -a 80 -lt 90 ]
+ echo Disk usage is between 60% to 75%. Alert: p2 or high disk use is :80%
Disk usage is between 60% to 75%. Alert: p2 or high disk use is :80%


sh disk-usage.sh
Disk Usage: 80%
Disk usage is between 60% to 75%. Alert: p2 or high disk use is :80%




stress the disk
-----------------
sudo apt-get install fio

Create a configuration file:Create a configuration file (e.g., disk_stress.fio)

[global]
ioengine=libaio
directory=/tmp
size=1G

[disk_stress]
rw=randwrite

fio disk_stress.fio


 sh -x disk-usage.sh
+ cut -d % -f1
+ awk {print $5}
+ grep /dev/root
+ df -h
+ disk_usage=80
+ echo Disk Usage: 80%
Disk Usage: 80%
+ [ 80 -ge 60 -a 80 -lt 75 ]
+ [ 80 -ge 75 -a 80 -lt 90 ]
+ echo Disk usage is between 75% to 90%. Alert: p2 or high disk use is :80%
Disk usage is between 75% to 90%. Alert: p2 or high disk use is :80%


 sh disk-usage.sh
Disk Usage: 80%
Disk usage is between 75% to 90%. Alert: p2 or high disk use is :80%


Every 2.0s: sh disk-usage.sh                                                                 ip-172-31-42-132: Fri May  3 10:43:01 2024

Disk Usage: 80%
Disk usage is between 75% to 90%. Alert: p2 or high disk use is :80%




