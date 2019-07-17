<#
Author(s): Thomas S
Date: 1 July 19
Desc: This powershell script updates a HISMC server
To use this script 1) place new hismc files under the staging folder Ex) C:\Harris\HISMC\AMRDEV\staging 2) Give the script the path name to the live, previous and staging folder Ex) C:\Harris\HISMC\AMRDEV (no \ at the end)
#>

#Ask user to enter the path to the staging folder
$hismcFolder = Read-Host -Prompt "Enter the path to the Hismc folder, on the current server, that contains the live, previous, and staging folders (Ex:C:\Harris\HISMC\AOMDEV ) "
$liveFolder = $hismcFolder + "\live\*"
$previousFolder =  $hismcFolder + "\previous\*"
$stagingFolder =  $hismcFolder + "\staging\*"

#Stop IIS Website
Get-IISSite
$Site = Read-Host -Prompt "Which IIS Site would you like to stop? Name:  "
#$Site = Get-IISSite | Select-String -Pattern "HISMC"
Write-Host "Stopping '$Site' ..."
Stop-IISSite $Site


#Remove the contents of the previous folder#
Write-Host "Removing the contents of the Previous directory ..."
Remove-Item -path $previousFolder -recurse

#Copy the contents of live to previous
Write-Host "Copying the contents of the live directory over to the previous directory ..."

$previousFolder = $hismcFolder + "\previous\" #remove wild card so that the contents of previous can be deleted 
Copy-Item  -Path  $liveFolder -Destination $previousFolder

#Remove everything from the live directory except the appsettings.json, MediSpan.xml files
Write-Host "Removing everything from the live directory except the appsettings.json, MediSpan.xml files ..."
Remove-Item -path $liveFolder -exclude appsettings.json, MediSpan.xml -recurse

#Copy new Hismc files from staging to live 
Write-Host "Copying new Hismc files from staging to live ..."
$liveFolder = $hismcFolder + "\live\" #remove wild card so that the contents of previous can be deleted 
Copy-Item  -Path  $stagingFolder -Destination $liveFolder

#Remove files from staging after
Write-Host "Cleaning up staging folder..."
Remove-Item -path $stagingFolder -recurse


#Start IIS website 
Start-IISSite $Site

#end powershell script 
$stagingFolder = Read-Host -Prompt "Press Enter to quit"
#End
