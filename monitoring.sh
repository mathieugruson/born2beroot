#!/bin/bash

#sleep $(bc <<< $(uptime -s | cut -d ":" -f2)%10*60+$(uptime -s | cut -d ":" -f3)) && 
wall -n " 
                                         * *
                                          *
Date : $(date)

- Architecture                     : $(uname -a)
- Number of physical CPUs          : $(grep 'physical id' /proc/cpuinfo | uniq | wc -l)
- Number of virtual CPUs           : $(grep processor /proc/cpuinfo | uniq | wc -l)
- RAM available                    : $(free --mega | grep Mem | awk '{print $7" Mo"}')
- Percentage of RAM uses           : $(free | grep Mem | awk '{print($3/$2*100)"%"}')
- Memory available                 : $(df -h --total | grep total | awk '{print $4}')
- Percentage of memory used        : $(df -h --total | grep total | awk '{print $5}')
- Percentage of processors used    : $(top -bn1 | grep '^%Cpu(s)' | awk '{print(100 - $8)"%"}')
- Last reboot                      : $(who -b | grep system | awk '{print $3 " " $4}')
- LVM activity                     : $(if [ $(lsblk |grep lvm | wc -l) > 1 ]; then echo on; else echo off; fi)
- Number of active connections     : $(grep TCP /proc/net/sockstat | awk '{print $3 " established"}')
- Number of users using the server : $(echo $(who | wc -l) "user")
- The IPv4 adress of server        : $(ip a | grep 127 | awk '{print $2}')
- MAC adress of the server         : $(ip link show | grep link/ether | awk '{print $2}')
- Number of sudo commands executed : $(grep --text 'COMMAND' /var/log/sudo/sudo.log | wc -l)

                                        * *
