#!/usr/bin/bash
#This script runs oslevel, ccontrol list, and uptime on all servers
#Add hostnames of IP's of servers you wish to scan

#add hosts you wish to scan to this array
hosts="127.0.0.1, "

#loop throgh all the host
for i in $hosts
do

printf "%s\n\n" "============================="  >> servers

printf "%s%s\n\n" "HOST: " "$i"    >> servers

printf "%s\n"   "Cache Version: "  >> servers
ssh ats@$i ccontrol list           >> servers


printf "\n%s\n\n" "OSLevel:"       >> servers
ssh ats@$i oslevel                 >> servers


printf "\n%s\n\n" "UpTime:"        >> servers
ssh ats@$i  uptime                 >> servers

printf "\n\n%s\n"   "=============================" >> servers

done

#csession INSTANCE
username/pass
zn "CPR"
zn "CPR" w $p($p(^%z,$c(255),21),$c(1),1)_"."_$p($p(^%z,$c(255),21),$c(1),3)_" Build "_$p($p(^%z,$c(255),21),$c(1),2) 
