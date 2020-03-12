Clindoc IIS Creation Commands

 install the feature IIS Management Scripts and tools under Internet Information Services >> Web Management Tools.


New-WebAppPool -Name CLINDOC
Import-Module -Name 'C:\Windows\system32\WindowsPowerShell\v1.0\Modules\WebAdministration\WebAdministration.psd1'
Set-ItemProperty IIS:\AppPools\CLINDOC\ managedRuntimeVersion v4.0
Set-ItemProperty IIS:\AppPools\CLINDOC\ enable32BitAppOnWin64 True
Set-ItemProperty IIS:\AppPools\CLINDOC\ processModel.idleTimeout 02:00:00
Set-ItemProperty IIS:\AppPools\CLINDOC\ recycling.periodicRestart.time 02:00:00
New-Website -Name CLINDOC -ApplicationPool CLINDOC -Port 8080 -PhysicalPath "E:\Harris\CLINDOC\live\salar\Matterhorn"
New-WebApplication -Name Matterhorn -Site 'CLINDOC' -PhysicalPath "E:\Harris\CLINDOC\live\salar\Matterhorn" -ApplicationPool CLINDOC
