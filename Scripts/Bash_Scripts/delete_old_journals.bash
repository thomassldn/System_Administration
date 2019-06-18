#!/usr/bin/bash
#Author: Thomas S
#Date: 13 Sept 18
#Description:This script deletes old journals from a journal directory (never delete journal with out permission!!)

cd /path/to/journals/ 

#list journals; Note:"0908|0909" are the journals you want to ommit from deletion" 
for i in `ls | egrep -v 'lck|0908|0909'` ; do echo $i; done

#Before running the next command, enter if condition to verify with the user if the obove journals listed are the ones to be deleted.
#delete journals
for i in `ls | egrep -v 'lck|0908|0909'` ; do echo $i; yes | rm $i; done




