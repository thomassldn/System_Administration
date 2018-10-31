# Cross Domain Restore Script v1.0
# Jimmy Chen / QuadraMed ATS

#Enter the Domain to be restored, can be found using ccontrol list; in this case
#we will be restoring UHNTRNA1
targetDomain=UHNTRNA1

#Enter Server credentials for the domain user
domainLogin=chIoIdTr
domainPassword=uhniotr

#path to the MASTER back up file
maintScript=/qmd/cpr/sw/customer/cache_maint_script/master_UHNTRNA1.txt
tempScript=/tmp/run_xres.tmp

#the following are the QCPR tables that we need to xin back in to QCPR after the script is ran, since they get over written by the script
zfpPath=/qmd/cpr/ucd/UHNTRNA1/mgr/%zfp.gof.uhntrna1
zliosPath=/qmd/cpr/ucd/UHNTRNA1/mgr/%zlios.gof.uhntrna1
zPath=/qmd/cpr/ucd/UHNTRNA1/mgr/%z.gof.uhntrna1
backupFile=""

#IF the user does not pass in a Backup file to this bash script, the default Backup File will be found inside the
#/qmd/cpr/sw/customer/cache_maint_script/master_UHNTRNA1.txt file
#ElSE if the user passes a Backup File to this bash script, that will be the Backup File this script will use to perform the restore with
if [ "$1" = "" ]
        then
                #MASTER back up file
                backupFile="/BACKUP/$targetDomain/$(grep -v "^#" $maintScript)"
        else
                #Backup file passed in by the user
                backupFile=$1
fi

#if the file /qmd/cpr/ucd/$targetDomain does not exist, tell the user this is the wrong domain
if [ ! -d /qmd/cpr/ucd/$targetDomain ]
then
        echo -e "\033[31m$targetDomain domain does not exist!\033[0m"
      exit
fi

#variable cacheMgrDir will hold /qmd/cache_uhntrna_1
cacheMgrDir=`ccontrol qlist $targetDomain | awk -F^ '{print $2}'`

#if the file /qmd/cache_uhntrna_1/mgr/cache.ids exists and is a regular file, then..
if [ -f $cacheMgrDir/mgr/cache.ids ]
then
echo
echo
#...Tell the user, the domain is being stopped
echo -e "\033[1;31mStopping $targetDomain ...\033[0m"
echo
echo
/usr/bin/ccontrol force $targetDomain << EOF
Y
EOF
fi

#start the cache instance
ccontrol start $targetDomain

rm -f $tempScript
echo
echo
echo -e "\033[33mStarting restore ...\033[0m"
echo
echo
#pass in the following parameters and file paths the the $tempScript(/tmp/run_xres.tmp) file above so that it can be ran on
#on line 101: /usr/bin/bash $tempScript
echo "csession $targetDomain -U cpr backup^%zu2update << EOF" > $tempScript
echo "$domainLogin" >> $tempScript
echo "$domainPassword" >> $tempScript
echo "3" >> $tempScript
echo "Yes" >> $tempScript
echo "$backupFile" >> $tempScript
echo "Yes" >> $tempScript
echo "x" >> $tempScript
echo "x" >> $tempScript
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

#stop cache instance and pass in N,N,Y,R values to the prompts
ccontrol stop $targetDomain << EOF
N
N
N
Y
R

EOF

#start cache instance
ccontrol start $targetDomain

echo
echo
echo -e "\033[33mPreparing domain ...\033[0m"
echo
echo
#The following will create a script that starts a cession and imports globals back into QCPR. The script is ran on line 157: "/usr/bin/expect /$tempScript"
#start a cession to use the cache global importing utility
echo "#!/usr/bin/expect" > $tempScript
echo "spawn csession $targetDomain -U cpr" >> $tempScript
#pass in username and password to the cache csession prompts
echo "expect \"Username: \"" >> $tempScript
echo "send \"$domainLogin\r\"" >> $tempScript
echo "expect \"Password: \"" >> $tempScript
echo "send \"$domainPassword\r\"" >> $tempScript
#import the %zfp global
echo "expect \"CPR>\"" >> $tempScript
echo "send \"w ##class(%Library.Global).Import(\\\"cpr\\\",\\\"%zfp.GBL\\\",\\\"$zfpPath\\\",7)\r\"" >> $tempScript
#import the %zlios global
echo "expect \"CPR>\"" >> $tempScript
echo "send \"w ##class(%Library.Global).Import(\\\"cpr\\\",\\\"%zlios.GBL\\\",\\\"$zliosPath\\\",7)\r\"" >> $tempScript
#import the %z global
echo "expect \"CPR>\"" >> $tempScript
echo "send \"w ##class(%Library.Global).Import(\\\"cpr\\\",\\\"%z.GBL\\\",\\\"$zPath\\\",7)\r\"" >> $tempScript
#run set ^%zDbPermData in the csession using the CPR namespace
echo "expect \"CPR>\"" >> $tempScript
echo "send \"set ^%zDbPermData(\\\"cprDbOid\\\",\\\"current\\\") = \\\"\\\"\r\"" >> $tempScript
#run d autoStart^%zu2umos command in the CPR csession
echo "expect \"CPR>\"" >> $tempScript
echo "send \"d autoStart^%zu2umos\r\"" >> $tempScript
echo "sleep 60" >> $tempScript
echo "expect \"CPR>\"" >> $tempScript
echo "send \"h\r\"" >> $tempScript

#run the above script
/usr/bin/expect /$tempScript
rm -f $tempScript

echo
echo
echo -e "\033[32mRestore complete!\033[0m"
echo
