#Author:Thomas S, ATS
#Date:Oct 31, 2019
#Desc: This power shell script gets the windows versions of the following servers: "sbqep1", "sbqep2", "sbqmc1", "sbqmc2", and "sbqima"

$servers = "<Server1>","<Server1>","<Server1>","<Server1>","<Server1>"

for ($i=0; $i -lt 5 ; $i++) { #$servers.Lenght

Invoke-Command -ComputerName $servers[$i] -ScriptBlock {hostname;echo "========================================================================"; <COMMAND> }

}
