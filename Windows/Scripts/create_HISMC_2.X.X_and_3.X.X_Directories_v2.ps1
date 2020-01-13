<#
Date: 20 Nov 2019
Author(s): ATS 
Desc: This powershell script creates the HISMC v 2.X.X and 3.X.X required directories. 
#>


#################################################################################
#			Create HISMC V 2.X.X & 3.X.X Required Directories                   #
#################################################################################

#Ask user to enter the Site name, Will be used to create the required directories 
$siteName = Read-Host -Prompt "`nEnter <SITE><DOMAIN> Name (Ex: AOMDEV or AOMPROD)"
Write-Host "`nThe site name is '$siteName'.`n"

#Check if GDD is enabled 
$gddEnabled = Read-Host -Prompt "`nIs GDD Enabled? [y/n]"

#Dont let user enter an invalid option
While ( ($gddEnabled -ne "y") -AND ($gddEnabled -ne "n") ){

    $gddEnabled = Read-Host -Prompt "Invalid Entry. `n`nIs GDD Enabled? [y/n]"

} 


#Create required HISMC V2.X.X & 3.X.X directories
#SQLENGHH Directories 
New-Item -Path "E:\" -Name "Harris" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\SQLENGHH" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\SQLENGHH\InstanceRoot" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\SQLENGHH\SharedFeature" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\SQLENGHH\SharedFeatureX86" -ItemType "directory"

New-Item -Path "E:\" -Name "Harris\SQLENGHH\Data" -ItemType "directory"
New-Item -Path "L:\" -Name "Harris\SQLENGHH\Logs" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\SQLENGHH\TempDB" -ItemType "directory"
New-Item -Path "L:" -Name "Harris\SQLENGHH\TempDBLogs" -ItemType "directory"
New-Item -Path "Y:\" -Name "Harris\SQLENGHH\Backup" -ItemType "directory"

#MSCDB Directories 
New-Item -Path "E:\" -Name "Harris\MSCDB" -ItemType "directory"
New-Item -Path "Y:\" -Name "Harris\MSCDB\Backup" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MSCDB\Data" -ItemType "directory"
New-Item -Path "L:\" -Name "Harris\MSCDB\Logs" -ItemType "directory"

#MEDFILEDB Directories 
New-Item -Path "E:\" -Name "Harris\MEDFILEDB" -ItemType "directory"
New-Item -Path "Y:\" -Name "Harris\MEDFILEDB\Backup" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEDB\Data" -ItemType "directory"
New-Item -Path "L:\" -Name "Harris\MEDFILEDB\Logs" -ItemType "directory"


#HISMCDB Directories 
New-Item -Path "E:\" -Name "Harris\HISMCDB" -ItemType "directory"
New-Item -Path "Y:\" -Name "Harris\HISMCDB\Backup" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\HISMCDB\Data" -ItemType "directory"
New-Item -Path "L:\" -Name "Harris\HISMCDB\Logs" -ItemType "directory"

#Wolters Kluwer Medi-Span Clinicals Application Files 
New-Item -Path "E:\" -Name "Harris\WKAPI" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKAPI\$siteName\live" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKAPI\$siteName\previous" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKAPI\$siteName\staging" -ItemType "directory"

#Wolters Kluwer Medi-Span Clinicals Data Files 
New-Item -Path "E:\" -Name "Harris\WKDATA" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKDATA\$siteName\live" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKDATA\$siteName\previous" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKDATA\$siteName\staging" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKDATA\$siteName\Leaflets" -ItemType "directory"

#MEDFILEAPP Directories 
New-Item -Path "E:\" -Name "Harris\MEDFILEAPP" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEAPP\$siteName\live" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEAPP\$siteName\previous" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEAPP\$siteName\staging" -ItemType "directory"

#MEDFILEDATA Directories 
New-Item -Path "E:\" -Name "Harris\MEDFILEDATA" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEDATA\$siteName\live" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEDATA\$siteName\previous" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEDATA\$siteName\staging" -ItemType "directory"

#HISMC Directories 
New-Item -Path "E:\" -Name "Harris\HISMC" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\HISMC\$siteName\live" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\HISMC\$siteName\previous" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\HISMC\$siteName\staging" -ItemType "directory"

