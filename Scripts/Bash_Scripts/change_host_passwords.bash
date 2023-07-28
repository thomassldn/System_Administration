#!/bin/bash

echo "WARNING THIS SCRIPT WILL CHANGE YOUR PASSWORD  !!"

echo -n "Are you sure you wish to continue (y/n)? "

read -n1 var_answer

echo

if [ "$var_answer" != "y" ]
then
        exit 1
fi

echo -n "Enter your username: "

read var_username

if [ -z "$var_username" ]
then
        exit 1
fi

if [ "$var_username" == "root" ]
then
        echo Sorry, you cannot use this script to change the root password !
        exit 1
fi


echo -n "Enter your NEW password. Please use a DIFFERENT password from your previous one! : "

read var_password

if [ -z "$var_password" ]
then
        exit 1
fi

# Run the password through a simple policy test:
password_test=$( echo $var_password | passwd $var_username 2>&1 | grep BAD )

if [ ! -z "$password_test" ]
then
        echo $password_test
        echo Sorry. Password too simple. Please try again with a more complex password.
        echo Password was not changed.
        exit 1
fi

P_FAIL=5
for m_id in E0SVAPCAE03 E0SVAPCAE04 E0SVAPCAE05 E0SVAPCAE06 E0SVAPCAEDEMO01 E0SVAPCAEDEV03 E0SVAPCAEDEV04 E0SVAPCAEENS01 E0SVAPCAEENS02 E0SVAPCAEENSD01 E0SVAPCAEENSD02 E0SVAPCAEENST01 E0SVAPCAEMM01 E0SVAPCAEMM02 E0SVAPCAEQA01 E0SVAPCAETEST01 E0SVAPCAETRN01 E0SVBDCAE01 E0SVBDCAE02 E0SVBDCAEDEV01 E0SVBDCAEDEV02 E0SVBDCAERS01 E0SVAPCAEFS01 E0SVAPCAEFS02
do
if [ `ping -c 1 $m_id.reg05.rtss.qc.ca | wc | awk '{print $1}'` == $P_FAIL ]
then
   echo "Ping failed on " $m_id
else
#      
        echo Checking if password is used on $m_id
        shadow=$( ssh -q root@$m_id.reg05.rtss.qc.ca getent shadow $var_username )
        shadow=$( echo $shadow | awk -F: '{ print $2 }' )
        salt=$( echo $shadow | awk -F$ '{ print $3 }' )
#       echo salt = $salt
        hash=$( perl -e "print crypt('$var_password','\$6\$$salt\$')" )
#       echo "$m_id hash = $hash"
#       echo "$m_id shadow = $shadow"
        if [ "$hash" == "$shadow" ]
        then
                echo Password already used on $m_id !
                bad_password=1
        fi
        if [ -z "$shadow" ]
        then
                echo Username not found on $m_id !
                bad_user=1
        fi
fi
done

if [ "$bad_user" == "1" ]
then
        echo Username not found on one or more servers !
        echo Password not changed.
        exit 1
fi

if [ "$bad_password" == "1" ]
then
        echo Sorry. You cannot use this password.
        echo It is already used on one or more servers.
        echo Please run the script again and try a different password.
        exit 1
fi

echo Password OK ! Changing password on all servers...

P_FAIL=5
for m_id in E0SVAPCAE03 E0SVAPCAE04 E0SVAPCAE05 E0SVAPCAE06 E0SVAPCAEDEMO01 E0SVAPCAEDEV03 E0SVAPCAEDEV04 E0SVAPCAEENS01 E0SVAPCAEENS02 E0SVAPCAEENSD01 E0SVAPCAEENSD02 E0SVAPCAEENST01 E0SVAPCAEMM01 E0SVAPCAEMM02 E0SVAPCAEQA01 E0SVAPCAETEST01 E0SVAPCAETRN01 E0SVBDCAE01 E0SVBDCAE02 E0SVBDCAEDEV01 E0SVBDCAEDEV02 E0SVBDCAERS01 E0SVAPCAEFS01 E0SVAPCAEFS02
do
if [ `ping -c 1 $m_id.reg05.rtss.qc.ca | wc | awk '{print $1}'` == $P_FAIL ]
then
   echo "Ping failed on " $m_id
else
        # Escape the password for special characters:
        echo Changing password on server $m_id ...
        ssh -q root@$m_id.reg05.rtss.qc.ca "echo "$( printf "%q" "$var_password" )" | passwd $var_username --stdin"
fi
done
