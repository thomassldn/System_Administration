#Author:Thomas S, ATS
#Date:Oct 31, 2019
#Desc: This power shell script runs a command(s) on multiple servers  

$servers = "<Server1>","<Server1>","<Server1>","<Server1>","<Server1>"

for ($i=0; $i -lt 5 ; $i++) { #$servers.Lenght

Invoke-Command -ComputerName $servers[$i] -ScriptBlock {hostname;echo "========================================================================"; <COMMAND> }

}
