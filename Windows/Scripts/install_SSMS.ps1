#Author:Thomas S, ATS
#Date: 22 Nov 2019
#Desc: This power shell script downloads SSMS and installs it 
#

#Folder where SSMS installer will be downloaded and ran in 
#Change the ssmsPath below or script will not work
$ssmsPath="C:\Scripts\SQLInstallationMedia" 

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
& "$ssmsExecutable" $args 
Write-Host "`nSSMS installation complete!" -ForegroundColor Green
