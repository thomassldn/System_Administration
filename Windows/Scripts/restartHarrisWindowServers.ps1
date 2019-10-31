#Author:Thomas S, ATS
#Date:Oct 31, 2019
#Desc: This power shell restarts Harris' Window Servers ( "sbqep1", "sbqep2", "sbqmc1", "sbqmc2")
#

#Restart the "sbqep1", "sbqep2", "sbqmc1", "sbqmc2" servers forcefully. These servers are currently not being used, so 
#no damage can be done. 
Restart-Computer -ComputerName "sbqep1", "sbqep2", "sbqmc1", "sbqmc2" -Force

#After restarting the above servers, sleep for 15 seconds before restartign this server. 
Start-Sleep -s 15

#When this command is executed, you will be logged off, and this server will reboot. 
Restart-Computer -ComputerName "sbqima" -Force 

#End

