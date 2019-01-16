#!/usr/bin/bash
#Desc: This script creates all the filesystems in QCPR domainname

mklv -y cchlv -t jfs2 qcpr 1
mklv -y binlv -t jfs2 qcpr 1
mklv -y mgrlv -t jfs2 qcpr 1
mklv -y bkplv -t jfs2 qcpr 1
mklv -y wijlv -t jfs2  qcpr 1
mklv -y jrnlv -t jfs2  qcpr 1
mklv -y qcprlv -t jfs2 qcpr 1
mklv -y sfillv -t jfs2 qcpr 1
mklv -y csplv -t jfs2 qcpr 1
mklv -y etclv -t jfs2 qcpr 1


mklv -y cachelv -t jfs2 qcpr 1
mklv -y caudlv -t jfs2 qcpr 1
mklv -y cliblv -t jfs2 qcpr 1
mklv -y ctmplv -t jfs2 qcpr 1
mklv -y cdoclv -t jfs2 qcpr 1
mklv -y csmplv -t jfs2 qcpr 1
mklv -y cuserlv -t jfs2 qcpr 1
mklv -y ensdemolv -t jfs2 qcpr 1
mklv -y enslv -t jfs2 qcpr 1
mklv -y ensliblv -t jfs2 qcpr 1
mklv -y mprliblv -t jfs2 qcpr 1


mklv -y hsliblv -t jfs2 qcpr 1
mklv -y hssyslv -t jfs2 qcpr 1
mklv -y cprlv -t jfs2 qcpr 1
mklv -y rtnalv -t jfs2 qcpr 1
mklv -y rtnblv -t jfs2 qcpr 1
mklv -y syslv -t jfs2 qcpr 1
mklv -y sysblv -t jfs2 qcpr 1
mklv -y scollv -t jfs2 qcpr 1
mklv -y kslv -t jfs2 qcpr 1


mklv -y qliblv -t jfs2 qcpr 1
mklv -y tchlv -t jfs2 qcpr 1
mklv -y nojlv -t jfs2 qcpr 1
mklv -y dojlv -t jfs2 qcpr 1
mklv -y errlv -t jfs2 qcpr 1
mklv -y cprhslv -t jfs2 qcpr 1
mklv -y dkvwlv -t jfs2 qcpr 1
mklv -y cmvlv -t jfs2 qcpr 1


#create filesystems
crfs -v jfs2 -d cchlv -m /qmd/cache_hlmprd_1 -a options=rw -A yes;mount /qmd/cache_hlmprd_1;chmod 755 /qmd/cache_hlmprd_1
crfs -v jfs2 -d binlv -m /qmd/cache_hlmprd_1/bin -a options=rw -A yes;mount /qmd/cache_hlmprd_1/bin;chmod 755 /qmd/cache_hlmprd_1/bin
crfs -v jfs2 -d mgrlv -m /qmd/cache_hlmprd_1/mgr -a options=rw -A yes;mount /qmd/cache_hlmprd_1/mgr;chmod 775 /qmd/cache_hlmprd_1/mgr
crfs -v jfs2 -d bkplv -m /qmd/cache_hlmprd_1/mgr/Backup -a options=rw -A yes;mount /qmd/cache_hlmprd_1/mgr/Backup;chmod 775 /qmd/cache_hlmprd_1/mgr/Backup


crfs -v jfs2 -d wijlv -m /qmd/cache_hlmprd_1/mgr/wij -a options=rw -A yes;mount /qmd/cache_hlmprd_1/mgr/wij;chmod 775 /qmd/cache_hlmprd_1/mgr/wij


crfs -v jfs2 -d jrnlv -m /qmd/cache_hlmprd_1/mgr/journal -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/journal;chmod 775 /qmd/cache_hlmprd_1/mgr/journal


crfs -v jfs2 -d qcprlv -m /qmd/cpr/ucd/HLMPRD1 -a options=rw -A yes;mount /qmd/cpr/ucd/HLMPRD1;chmod 755 /qmd/cpr/ucd/HLMPRD1
crfs -v jfs2 -d sfillv -m /qmd/cpr/ucd/HLMPRD1/sfiles -a options=rw -A yes;mount /qmd/cpr/ucd/HLMPRD1/sfiles;chmod 755 /qmd/cpr/ucd/HLMPRD1/sfiles
crfs -v jfs2 -d csplv -m /qmd/cpr/ucd/HLMPRD1/qcprCSP -a options=rw -A yes;mount /qmd/cpr/ucd/HLMPRD1/qcprCSP;chmod 755 /qmd/cpr/ucd/HLMPRD1/qcprCSP
crfs -v jfs2 -d etclv -m /qmd/cpr/ucd/HLMPRD1/qcprETC -a options=rw -A yes;mount /qmd/cpr/ucd/HLMPRD1/qcprETC;chmod 755 /qmd/cpr/ucd/HLMPRD1/qcprETC


crfs -v jfs2 -d cachelv -m /qmd/cache_hlmprd_1/mgr/cache -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/cache;chmod 775 /qmd/cache_hlmprd_1/mgr/cache
crfs -v jfs2 -d caudlv -m /qmd/cache_hlmprd_1/mgr/cacheaudit -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/cacheaudit;chmod 775 /qmd/cache_hlmprd_1/mgr/cacheaudit
crfs -v jfs2 -d cliblv -m /qmd/cache_hlmprd_1/mgr/cachelib -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/cachelib;chmod 775 /qmd/cache_hlmprd_1/mgr/cachelib
crfs -v jfs2 -d ctmplv -m /qmd/cache_hlmprd_1/mgr/cachetemp -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/cachetemp;chmod 775 /qmd/cache_hlmprd_1/mgr/cachetemp
crfs -v jfs2 -d cdoclv -m /qmd/cache_hlmprd_1/mgr/docbook -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/docbook;chmod 775 /qmd/cache_hlmprd_1/mgr/docbook
crfs -v jfs2 -d csmplv -m /qmd/cache_hlmprd_1/mgr/samples -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/samples;chmod 775 /qmd/cache_hlmprd_1/mgr/samples
crfs -v jfs2 -d cuserlv -m /qmd/cache_hlmprd_1/mgr/user -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/user;chmod 775 /qmd/cache_hlmprd_1/mgr/user


crfs -v jfs2 -d ensdemolv -m /qmd/cache_hlmprd_1/mgr/ensdemo -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/ensdemo;chmod 775 /qmd/cache_hlmprd_1/mgr/ensdemo
crfs -v jfs2 -d enslv -m /qmd/cache_hlmprd_1/mgr/ensemble -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/ensemble;chmod 775 /qmd/cache_hlmprd_1/mgr/ensemble
crfs -v jfs2 -d ensliblv -m /qmd/cache_hlmprd_1/mgr/enslib -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/enslib;chmod 775 /qmd/cache_hlmprd_1/mgr/enslib
crfs -v jfs2 -d mprliblv -m /qmd/cache_hlmprd_1/mgr/mprllib -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/mprllib;chmod 775 /qmd/cache_hlmprd_1/mgr/mprllib


crfs -v jfs2 -d hsliblv -m /qmd/cache_hlmprd_1/mgr/hslib -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/hslib;chmod 775 /qmd/cache_hlmprd_1/mgr/hslib
crfs -v jfs2 -d hssyslv -m /qmd/cache_hlmprd_1/mgr/hssys -a options=cio -A yes;mount /qmd/cache_hlmprd_1/mgr/hssys;chmod 775 /qmd/cache_hlmprd_1/mgr/hssys


crfs -v jfs2 -d cprlv -m /qmd/cpr/ucd/HLMPRD1/dbase/cpr -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/cpr;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/cpr
crfs -v jfs2 -d rtnalv -m /qmd/cpr/ucd/HLMPRD1/dbase/routineA -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/routineA;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/routineA
crfs -v jfs2 -d rtnblv -m /qmd/cpr/ucd/HLMPRD1/dbase/routineB -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/routineB;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/routineB
crfs -v jfs2 -d syslv -m /qmd/cpr/ucd/HLMPRD1/dbase/cprsys -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/cprsys;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/cprsys
crfs -v jfs2 -d sysblv -m /qmd/cpr/ucd/HLMPRD1/dbase/cprsysb -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/cprsysb;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/cprsysb
crfs -v jfs2 -d scollv -m /qmd/cpr/ucd/HLMPRD1/dbase/cprstdcol -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/cprstdcol;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/cprstdcol
crfs -v jfs2 -d kslv -m /qmd/cpr/ucd/HLMPRD1/dbase/keystore -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/keystore;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/keystore


crfs -v jfs2 -d qliblv -m /qmd/cpr/ucd/HLMPRD1/dbase/qmdlib -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/qmdlib;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/qmdlib
crfs -v jfs2 -d tchlv -m /qmd/cpr/ucd/HLMPRD1/dbase/tcache -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/tcache;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/tcache
crfs -v jfs2 -d nojlv -m /qmd/cpr/ucd/HLMPRD1/dbase/nojo -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/nojo;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/nojo
crfs -v jfs2 -d dojlv -m /qmd/cpr/ucd/HLMPRD1/dbase/dojo -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/dojo;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/dojo
crfs -v jfs2 -d errlv -m /qmd/cpr/ucd/HLMPRD1/dbase/error -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/error;chmod 775 /qmd/cpr/ucd/HLMPRD1/dbase/error


crfs -v jfs2 -d cprhslv -m /qmd/cpr/ucd/HLMPRD1/dbase/cprhs -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/cprhs;chmod 755 /qmd/cpr/ucd/HLMPRD1/dbase/cprhs


crfs -v jfs2 -d dkvwlv -m /qmd/cpr/ucd/HLMPRD1/dbase/dkvwk -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/dkvwk;chmod 755 /qmd/cpr/ucd/HLMPRD1/dbase/dkvwk
crfs -v jfs2 -d cmvlv -m /qmd/cpr/ucd/HLMPRD1/dbase/cmv -a options=cio -A yes;mount /qmd/cpr/ucd/HLMPRD1/dbase/cmv;chmod 755 /qmd/cpr/ucd/HLMPRD1/dbase/cmv

