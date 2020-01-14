#!/usr/bin/bash
#This script runs oslevel on a list of hosts 
#Add hostnames of IP's of servers you wish to scan to the "hosts" array below

#add hosts you wish to scan here
hosts="127.0.0.1 aomqcpr01-01 aomqcpr01-02 aomqcpr02-02"

#loop throgh all the host
for i in $hosts
do

printf "%s\n\n" "============================="  >> servers

printf "%s%s\n\n" "HOST: " "$i"    >> servers
ssh root@$i oslevel                 >> servers
echo >> servers

done
