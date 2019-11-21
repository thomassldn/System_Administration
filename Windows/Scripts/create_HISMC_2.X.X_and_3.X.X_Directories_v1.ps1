<#
Date: 20 Nov 2019
Author(s): ATS 
Desc: This powershell script creates the HISMC v 2.X.X and 3.X.X required directories. If they are already exist, it does not create them and displays a message. 
#>

#################################################################################
#			Create HISMC V3.X.X Required Directories                            #
#################################################################################

#Ask user to enter the Site name, Will be used to create the required directories 
$siteName = Read-Host -Prompt "`nEnter Site Name (Ex: AOMDEV or AOMPROD)"
Write-Host "`nThe site name is '$siteName'.`n"

#Ask user what drive should be used to create the directories 
Write-Host "What drive would you like to create the directories in?`n`n1)C `n2)D `n3)E `n4)F `n5)G`n"
$drive = Read-Host -Prompt "Choose drive" 


#Dont let user enter an invalid drive option
While ( ($drive -ne 1) -AND ($drive -ne 2) -AND ($drive -ne 3) -AND ($drive -ne 4) -AND ($drive -ne 5) ) {

	Write-Host "`nInvalid Entry. What drive would you like to create the directories in?`n`n1)C `n2)D `n3)E `n4)F `n5)G`n"
	$drive = Read-Host -Prompt "Choose drive"
	
}

If ($drive -eq 1){

	Write-Host "`nCreating directories in C drive ..." 
    $drive = "C:\"

} ElseIf ($drive -eq 2) {

	Write-Host "`nCreating directories in D drive ..."
    $drive = "D:\"

} ElseIf ($drive -eq 3){

	Write-Host "`nCreating directories in E drive ..."
    $drive = "E:\"

} ElseIf ($drive -eq 4){

	Write-Host "`nCreating directories in F drive ..."
    $drive = "F:\"

}ElseIf ($drive -eq 5) {

	Write-Host "`nCreating directories in G drive ..."
    $drive = "G:\"

}


#Check if GDD is enabled 
$gddEnabled = Read-Host -Prompt "`nIs GDD Enabled? [y/n]"

#Dont let user enter an invalid option
While ( ($gddEnabled -ne "y") -AND ($gddEnabled -ne "n") ){

    $gddEnabled = Read-Host -Prompt "Invalid Entry. `n`nIs GDD Enabled? [y/n]"

} 

#Create required HISMC V3.X.X directories
#SQLENGHH Directories 
New-Item -Path "$drive" -Name "Harris" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\SQLENGHH" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\SQLENGHH\InstanceRoot" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\SQLENGHH\SharedFeature" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\SQLENGHH\SharedFeatureX86" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\SQLENGHH\Data" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\SQLENGHH\Logs" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\SQLENGHH\TempDB" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\SQLENGHH\TempDBLogs" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\SQLENGHH\Backup" -ItemType "directory"

#MSCDB Directories 
New-Item -Path "$drive" -Name "Harris\MSCDB" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MSCDB\Backup" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MSCDB\Data" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MSCDB\Logs" -ItemType "directory"

#MEDFILEDB Directories 
New-Item -Path "$drive" -Name "Harris\MEDFILEDB" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MEDFILEDB\Backup" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MEDFILEDB\Data" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MEDFILEDB\Logs" -ItemType "directory"

#GDD Directories 
If ($gddEnabled -eq "y"){

    New-Item -Path "$drive" -Name "Harris\GDDDB" -ItemType "directory"
    New-Item -Path "$drive" -Name "Harris\GDDDB\Backup" -ItemType "directory"
    New-Item -Path "$drive" -Name "Harris\GDDDB\Data" -ItemType "directory"
    New-Item -Path "$drive" -Name "Harris\GDDDB\Logs" -ItemType "directory"

    New-Item -Path "$drive" -Name "Harris\GDD" -ItemType "directory"
    New-Item -Path "$drive" -Name "Harris\GDD\$siteName\live" -ItemType "directory"
    New-Item -Path "$drive" -Name "Harris\GDD\$siteName\previous" -ItemType "directory"
    New-Item -Path "$drive" -Name "Harris\GDD\$siteName\staging" -ItemType "directory"
    New-Item -Path "$drive" -Name "Harris\GDD\$siteName\install_update" -ItemType "directory"

}

#HISMCDB Directories 
New-Item -Path "$drive" -Name "Harris\HISMCDB" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\HISMCDB\Backup" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\HISMCDB\Data" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\HISMCDB\Logs" -ItemType "directory"

#Wolters Kluwer Medi-Span Clinicals Application Files 
New-Item -Path "$drive" -Name "Harris\WKAPI" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\WKAPI\$siteName\live" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\WKAPI\$siteName\previous" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\WKAPI\$siteName\staging" -ItemType "directory"

#Wolters Kluwer Medi-Span Clinicals Data Files 
New-Item -Path "$drive" -Name "Harris\WKDATA" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\WKDATA\$siteName\live" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\WKDATA\$siteName\previous" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\WKDATA\$siteName\staging" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\WKDATA\$siteName\Leaflets" -ItemType "directory"

#MEDFILEAPP Directories 
New-Item -Path "$drive" -Name "Harris\MEDFILEAPP" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MEDFILEAPP\$siteName\live" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MEDFILEAPP\$siteName\previous" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MEDFILEAPP\$siteName\staging" -ItemType "directory"

#MEDFILEDATA Directories 
New-Item -Path "$drive" -Name "Harris\MEDFILEDATA" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MEDFILEDATA\$siteName\live" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MEDFILEDATA\$siteName\previous" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\MEDFILEDATA\$siteName\staging" -ItemType "directory"

#HISMC Directories 
New-Item -Path "$drive" -Name "Harris\HISMC" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\HISMC\$siteName\live" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\HISMC\$siteName\previous" -ItemType "directory"
New-Item -Path "$drive" -Name "Harris\HISMC\$siteName\staging" -ItemType "directory"

#End powershell script 
Write-Host " " 
$stagingFolder = Read-Host -Prompt "Press Enter to quit"
#End
