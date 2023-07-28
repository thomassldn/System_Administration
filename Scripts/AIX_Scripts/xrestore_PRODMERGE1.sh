#!/usr/bin/bash
# Cross Domain Restore Script v1.0


#Note: This script needs to be ran as the chIoIdPd user.

targetDomain=<DOMAIN>    
domainLogin=       
domainPassword=   
maintScript=/qmd/cpr/sw/customer/cache_maint_script/master_<DOMAIN>.txt  
tempScript=/tmp/run_xres.tmp                                              
zfpPath=/qmd/cpr/ucd/<DOMAIN>/mgr/%zfp.exp.uhnprodmerge                       #exported the global to this path
zliosPath=/qmd/cpr/ucd/<DOMAIN>/mgr/%zlios.exp.uhnprodmerge                   #exported the global to this path
zPath=/qmd/cpr/ucd/<DOMAIN>/mgr/%z.exp.uhnprodmerge                           #xported the global to this path
affPath=/qmd/cpr/ucd/<DOMAIN>/mgr/%aff.exp.uhnprodmerge                       #exported the global to this path
backupFile=""


if [ "$1" = "" ]
	then
		backupFile="/BACKUP/$targetDomain/$(grep -v "^#" $maintScript)"
	else
		backupFile=$1
fi

echo "Using " $backupFile

if [ ! -d /qmd/cpr/ucd/$targetDomain ]
then
	echo -e "\033[31m$targetDomain domain does not exist!\033[0m"
      exit
fi

cacheMgrDir=`ccontrol qlist $targetDomain | awk -F^ '{print $2}'`
if [ -f $cacheMgrDir/mgr/cache.ids ]
then
echo
echo
echo -e "\033[1;31mStopping $targetDomain ...\033[0m"
echo
echo
/usr/bin/ccontrol force $targetDomain << EOF
Y

EOF
fi

ccontrol start $targetDomain

rm -f $tempScript
echo
echo
echo -e "\033[33mStarting restore ...\033[0m"
echo
echo
echo "csession $targetDomain -U cpr backup^%zu2update << EOF" > $tempScript
chmod 777 $tempScript
echo "$domainLogin" >> $tempScript
echo "$domainPassword" >> $tempScript
echo "3" >> $tempScript
echo "Yes" >> $tempScript
echo "$backupFile" >> $tempScript
echo "Yes" >> $tempScript
echo "x" >> $tempScript
echo "x" >> $tempScript
echo "x" >> $tempScript                                           #added this line according to the SMP
echo "/qmd/cpr/ucd/$targetDomain/dbase/cmv" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/cpr" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/cprstdcol" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/cprsys" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/cprsysb" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/dkvwk" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/dojo" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/error" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/keystore" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/nojo" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/qmdlib" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/routineA" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/routineB" >> $tempScript
echo "/qmd/cpr/ucd/$targetDomain/dbase/tcache" >> $tempScript
echo "No" >> $tempScript
echo "Yes" >> $tempScript
echo "STOP" >> $tempScript
echo "No" >> $tempScript
echo "4" >> $tempScript
echo "q" >> $tempScript
echo "" >> $tempScript
echo "EOF" >> $tempScript

/usr/bin/bash $tempScript
rm -f $tempScript

echo
echo
echo -e "\033[33mRestarting Cache ...\033[0m"
echo
echo

ccontrol stop $targetDomain << EOF
N
N
N
Y
R

EOF

ccontrol start $targetDomain

echo
echo
echo -e "\033[33mPreparing domain ...\033[0m"
echo
echo
echo "#!/usr/bin/expect" > $tempScript
echo "spawn csession $targetDomain -U cpr" >> $tempScript
chmod 777 $tempScript
echo "expect \"Username: \"" >> $tempScript
echo "send \"$domainLogin\r\"" >> $tempScript
echo "expect \"Password: \"" >> $tempScript
echo "send \"$domainPassword\r\"" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"k ^%zfp\r\"" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"d \\\$SYSTEM.OBJ.Load(\\\"$zfpPath\\\")\r\"" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"k ^%zlios\r\"" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"d \\\$SYSTEM.OBJ.Load(\\\"$zliosPath\\\")\r\"" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"k ^%z\r\"" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"d \\\$SYSTEM.OBJ.Load(\\\"$zPath\\\")\r\"" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"k ^aff\r\"" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"d \\\$SYSTEM.OBJ.Load(\\\"$affPath\\\")\r\"" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"set ^%zDbPermData(\\\"cprDbOid\\\",\\\"current\\\") = \\\"\\\"\r\"" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"d autoStart^%zu2umos\r\"" >> $tempScript
echo "sleep 120" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"h\r\"" >> $tempScript

/usr/bin/expect /$tempScript
rm -f $tempScript

echo
echo
echo -e "\033[32mRestore complete!\033[0m"
echo


