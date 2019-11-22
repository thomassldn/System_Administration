<#
#Author:Thomas S, ATS
#Date: 22 Nov 2019
#Desc: This power shell script creates HISMC V3 directories, installs SQL, and downloads and installs SSMS
#
#>

#Enter path to SQL Configuration File
#Change this path or installation will fail.
$sqlConfigurationFile = "C:\Program Files\Microsoft SQL Server\130\Setup Bootstrap\Log\20191121_160043\ConfigurationFile.ini"

###################################################################################################################
#                    Create required HISMC V3.X.X directories                                                     #
###################################################################################################################

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
New-Item -Path "E:\" -Name "Harris\WKAPI\PIMPROD\live" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKAPI\PIMPROD\previous" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKAPI\PIMPROD\staging" -ItemType "directory"

#Wolters Kluwer Medi-Span Clinicals Data Files 
New-Item -Path "E:\" -Name "Harris\WKDATA" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKDATA\PIMPROD\live" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKDATA\PIMPROD\previous" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKDATA\PIMPROD\staging" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\WKDATA\PIMPROD\Leaflets" -ItemType "directory"

#MEDFILEAPP Directories 
New-Item -Path "E:\" -Name "Harris\MEDFILEAPP" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEAPP\PIMPROD\live" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEAPP\PIMPROD\previous" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEAPP\PIMPROD\staging" -ItemType "directory"

#MEDFILEDATA Directories 
New-Item -Path "E:\" -Name "Harris\MEDFILEDATA" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEDATA\PIMPROD\live" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEDATA\PIMPROD\previous" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\MEDFILEDATA\PIMPROD\staging" -ItemType "directory"

#HISMC Directories 
New-Item -Path "E:\" -Name "Harris\HISMC" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\HISMC\PIMPROD\live" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\HISMC\PIMPROD\previous" -ItemType "directory"
New-Item -Path "E:\" -Name "Harris\HISMC\PIMPROD\staging" -ItemType "directory"

###################################################################################################################
#                   Install SQL Server                                                                            #
###################################################################################################################



#$command = "D:\setup.exe /ConfigurationFile=$($configfile)"
$command = 'D:\setup.exe /ConfigurationFile="$sqlConfigurationFile"'
#run the command
Invoke-Expression -Command $command

###################################################################################################################
#                   Download and Install SSMS                                                                     #
###################################################################################################################
#Folder where SSMS installer will be downloaded and ran in 
$ssmsPath = Get-Location 

#SSMS executable 
$ssmsExecutable="$ssmsPath\SSMS-Setup-ENU.exe"

#Download SSMS executable 
If (!(Test-Path $ssmsExecutable)){
    
    Write-Host "`nDownloading SSMS 18.4..."
    $URL = "https://aka.ms/ssmsfullsetup"

    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($url,$ssmsExecutable)

    Write-Host "`nSSMS 18.4 installer download complete ..." -ForegroundColor Green

} 

 
#Run SSMS installer
Write-Host "`nBeginning the SSMS installion..." 

#Create Installation Parameters, log file
$installationParameters =  "/Install /Quiet /Norestart /Logs SSMS_install_log.txt"
$args = $installationParameters.Split(" ")

#Execute SSMS Executeable and pass above arguments
& "$ssmsExecutable" $args | Out-Null
Write-Host "`nSSMS installation complete!" -ForegroundColor Green
