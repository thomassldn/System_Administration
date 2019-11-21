#Create required HISMC V3.X.X directories
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
