#!/bin/bash


# Get CPU percentage using vmstat command
cpu_percentage=$(vmstat 1 2 | tail -n1 | awk '{print 100 -$15}')


if [ $cpu_percentage -ge 60 -a $cpu_percentage -lt 75 ]
then 
	echo "CPU usage is between 65% to 75%. Alert: P3 or medium cpu_percentage is :$cpu_percentage%"

elif [ $cpu_percentage -ge 75 -a $cpu_percentage -lt 90 ]
then
	 echo "CPU usage is between 75% to 90%. Alert: P2 or high cpu_percentage is :$cpu_percentage%"
 elif [ $cpu_percentage -ge 90 -a $cpu_percentage -le 100 ]
 then
	echo "CPU usage is between 90% to 100%. Alert: P1 or critical cpu_percentage is :$cpu_percentage%"
else 
	echo "cpu percentage is below 60% and healthy prasent cpu-percentage:$cpu_percentage%"
fi



--------------------------------------------------------------
cpu percentage
-----------
top then press 1
htop
mpstat
vmstat

stress the cpu
----------------
sudo apt-get install stress

stress --cpu $(nproc)

to get cpu percentage using "vmstat" command

 vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 1  0      0  62596  16736 459044    0    0   511    38  407  799 43  1 54  0  1
ubuntu@ip-172-31-42-132:~/ashok/real-time-scripts$ vmstat 1 2
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 1  0      0  62596  16736 459044    0    0   509    38  408  795 43  1 54  0  1
 1  0      0  62596  16736 459044    0    0     0     0  576   89 100  0  0  0  0

"substract 100 -ideal cpu"
vmstat 1 2 | tail -n1 | awk '{print 100 -$15}'
100

ubuntu@ip-172-31-42-132:~/ashok/real-time-scripts$ sh -x cpu-percentage-alerts.sh
+ awk {print 100 - $15}
+ tail -n1
+ vmstat 1 2
+ cpu_percentage=100
+ [ 100 -ge 60 -a 100 -lt 75 ]
+ [ 100 -ge 75 -a 100 -lt 90 ]
+ [ 100 -ge 90 -a 100 -le 100 ]
+ echo CPU usage is between 90% to 100%. Alert: P1 or critical cpu_percentage is :100%
CPU usage is between 90% to 100%. Alert: P1 or critical cpu_percentage is :100%

sh cpu-percentage-alerts.sh
CPU usage is between 90% to 100%. Alert: P1 or critical cpu_percentage is :100%

Every 2.0s: sh cpu-percentage-alerts.sh                                                                ip-172-31-42-132: Fri May  3 02:21:03 2024

CPU usage is between 90% to 100%. Alert: P1 or critical cpu_percentage is :100%
-----------------------------------------------------------------------------------------------------------















ubuntu@ip-172-31-42-132:~$ sh -x cpu-alerts.sh

+ awk {print 100 - $15}
+ tail -n1
+ vmstat 1 2
+ cpu_percentage=0
+ [ 0 -gt 60 -a 0 -lt 75 ]
+ [ 0 -ge 75 -a 0 -lt 90 ]
+ [ 0 -ge 90 -a 0 -le 100 ]
+ echo cpu percentage is below 60% and healthy prasent cpu-percentage:0%
cpu percentage is below 60% and healthy prasent cpu-percentage:0%

ubuntu@ip-172-31-42-132:~$ sh cpu-alerts.sh
cpu percentage is below 60% and healthy prasent cpu-percentage:1%

ubuntu@ip-172-31-42-132:~$ sh cpu-alerts.sh
cpu percentage is below 60% and healthy prasent cpu-percentage:0%


vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 1  0      0  63316  19928 381644    0    0   178    42  430  134 67  0 32  0  1

 vmstat 1 2
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 1  0      0  62844  20000 381728    0    0   169    40  437  132 68  0 31  0  1
 1  0      0  62844  20000 381728    0    0     0     0  572   86 100  0  0  0  0

vmstat 1 2 | tail -n1
 1  0      0  62748  19952 381644    0    0     0    24  564   88 100  0  0  0  0

vmstat 1 2 | tail -n1 | awk -F " " '{print 100 -$15}'
100



Every 2.0s: sh cpu-percentage-alerts.sh                                                                                  ip-172-31-42-132: Thu May  2 09:47:03 2024

cpu percentage is below 60% and healthy prasent cpu-percentage:0%
