#! /bin/bash
#Des: ping all host in a network range

for i in $(seq 1 126); 
do ping -c2 172.16.2.$i;
