#!/usr/bin/bash
#Desc: This script creates all the filesystems in QCPR domainname

mklv -y cchlv -t jfs2 Yes 1
mklv -y binlv -t jfs2 Yes 1
mklv -y mgrlv -t jfs2 Yes 1
mklv -y bkplv -t jfs2 Yes 1


mklv -y wijlv -t jfs2  1


mklv -y jrnlv -t jfs2  1


mklv -y qcprlv -t jfs2 Yes 1
mklv -y sfillv -t jfs2 Yes 1
mklv -y csplv -t jfs2 Yes 1
mklv -y etclv -t jfs2 Yes 1


mklv -y cachelv -t jfs2 Yes 1
mklv -y caudlv -t jfs2 Yes 1
mklv -y cliblv -t jfs2 Yes 1
mklv -y ctmplv -t jfs2 Yes 1
mklv -y cdoclv -t jfs2 Yes 1
mklv -y csmplv -t jfs2 Yes 1
mklv -y cuserlv -t jfs2 Yes 1


mklv -y ensdemolv -t jfs2 Yes 1
mklv -y enslv -t jfs2 Yes 1
mklv -y ensliblv -t jfs2 Yes 1
mklv -y mprliblv -t jfs2 Yes 1


mklv -y hsliblv -t jfs2 Yes 1
mklv -y hssyslv -t jfs2 Yes 1


mklv -y cprlv -t jfs2 Yes 1
mklv -y rtnalv -t jfs2 Yes 1
mklv -y rtnblv -t jfs2 Yes 1
mklv -y syslv -t jfs2 Yes 1
mklv -y sysblv -t jfs2 Yes 1
mklv -y scollv -t jfs2 Yes 1
mklv -y kslv -t jfs2 Yes 1


mklv -y qliblv -t jfs2 Yes 1
mklv -y tchlv -t jfs2 Yes 1
mklv -y nojlv -t jfs2 Yes 1
mklv -y dojlv -t jfs2 Yes 1
mklv -y errlv -t jfs2 Yes 1


mklv -y cprhslv -t jfs2 Yes 1


mklv -y dkvwlv -t jfs2 Yes 1
mklv -y cmvlv -t jfs2 Yes 1


#create filesystems
crfs -v jfs2 -d cchlv -m /qmd/cache_<instance>_# -a options=rw -A yes;mount /qmd/cache_<instance>_#;chmod 755 /qmd/cache_<instance>_#
crfs -v jfs2 -d binlv -m /qmd/cache_<instance>_#/bin -a options=rw -A yes;mount /qmd/cache_<instance>_#/bin;chmod 755 /qmd/cache_<instance>_#/bin
crfs -v jfs2 -d mgrlv -m /qmd/cache_<instance>_#/mgr -a options=rw -A yes;mount /qmd/cache_<instance>_#/mgr;chmod 775 /qmd/cache_<instance>_#/mgr
crfs -v jfs2 -d bkplv -m /qmd/cache_<instance>_#/mgr/Backup -a options=rw -A yes;mount /qmd/cache_<instance>_#/mgr/Backup;chmod 775 /qmd/cache_<instance>_#/mgr/Backup


crfs -v jfs2 -d wijlv -m /qmd/cache_<instance>_#/mgr/wij -a options=rw -A yes;mount /qmd/cache_<instance>_#/mgr/wij;chmod 775 /qmd/cache_<instance>_#/mgr/wij


crfs -v jfs2 -d jrnlv -m /qmd/cache_<instance>_#/mgr/journal -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/journal;chmod 775 /qmd/cache_<instance>_#/mgr/journal


crfs -v jfs2 -d qcprlv -m /qmd/cpr/ucd/<INSTANCE><grp#> -a options=rw -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>;chmod 755 /qmd/cpr/ucd/<INSTANCE><grp#>
crfs -v jfs2 -d sfillv -m /qmd/cpr/ucd/<INSTANCE><grp#>/sfiles -a options=rw -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/sfiles;chmod 755 /qmd/cpr/ucd/<INSTANCE><grp#>/sfiles
crfs -v jfs2 -d csplv -m /qmd/cpr/ucd/<INSTANCE><grp#>/qcprCSP -a options=rw -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/qcprCSP;chmod 755 /qmd/cpr/ucd/<INSTANCE><grp#>/qcprCSP
crfs -v jfs2 -d etclv -m /qmd/cpr/ucd/<INSTANCE><grp#>/qcprETC -a options=rw -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/qcprETC;chmod 755 /qmd/cpr/ucd/<INSTANCE><grp#>/qcprETC


crfs -v jfs2 -d cachelv -m /qmd/cache_<instance>_#/mgr/cache -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/cache;chmod 775 /qmd/cache_<instance>_#/mgr/cache
crfs -v jfs2 -d caudlv -m /qmd/cache_<instance>_#/mgr/cacheaudit -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/cacheaudit;chmod 775 /qmd/cache_<instance>_#/mgr/cacheaudit
crfs -v jfs2 -d cliblv -m /qmd/cache_<instance>_#/mgr/cachelib -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/cachelib;chmod 775 /qmd/cache_<instance>_#/mgr/cachelib
crfs -v jfs2 -d ctmplv -m /qmd/cache_<instance>_#/mgr/cachetemp -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/cachetemp;chmod 775 /qmd/cache_<instance>_#/mgr/cachetemp
crfs -v jfs2 -d cdoclv -m /qmd/cache_<instance>_#/mgr/docbook -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/docbook;chmod 775 /qmd/cache_<instance>_#/mgr/docbook
crfs -v jfs2 -d csmplv -m /qmd/cache_<instance>_#/mgr/samples -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/samples;chmod 775 /qmd/cache_<instance>_#/mgr/samples
crfs -v jfs2 -d cuserlv -m /qmd/cache_<instance>_#/mgr/user -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/user;chmod 775 /qmd/cache_<instance>_#/mgr/user


crfs -v jfs2 -d ensdemolv -m /qmd/cache_<instance>_#/mgr/ensdemo -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/ensdemo;chmod 775 /qmd/cache_<instance>_#/mgr/ensdemo
crfs -v jfs2 -d enslv -m /qmd/cache_<instance>_#/mgr/ensemble -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/ensemble;chmod 775 /qmd/cache_<instance>_#/mgr/ensemble
crfs -v jfs2 -d ensliblv -m /qmd/cache_<instance>_#/mgr/enslib -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/enslib;chmod 775 /qmd/cache_<instance>_#/mgr/enslib
crfs -v jfs2 -d mprliblv -m /qmd/cache_<instance>_#/mgr/mprllib -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/mprllib;chmod 775 /qmd/cache_<instance>_#/mgr/mprllib


crfs -v jfs2 -d hsliblv -m /qmd/cache_<instance>_#/mgr/hslib -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/hslib;chmod 775 /qmd/cache_<instance>_#/mgr/hslib
crfs -v jfs2 -d hssyslv -m /qmd/cache_<instance>_#/mgr/hssys -a options=cio -A yes;mount /qmd/cache_<instance>_#/mgr/hssys;chmod 775 /qmd/cache_<instance>_#/mgr/hssys


crfs -v jfs2 -d cprlv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cpr -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cpr;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cpr
crfs -v jfs2 -d rtnalv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/routineA -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/routineA;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/routineA
crfs -v jfs2 -d rtnblv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/routineB -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/routineB;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/routineB
crfs -v jfs2 -d syslv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprsys -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprsys;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprsys
crfs -v jfs2 -d sysblv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprsysb -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprsysb;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprsysb
crfs -v jfs2 -d scollv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprstdcol -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprstdcol;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprstdcol
crfs -v jfs2 -d kslv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/keystore -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/keystore;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/keystore


crfs -v jfs2 -d qliblv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/qmdlib -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/qmdlib;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/qmdlib
crfs -v jfs2 -d tchlv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/tcache -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/tcache;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/tcache
crfs -v jfs2 -d nojlv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/nojo -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/nojo;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/nojo
crfs -v jfs2 -d dojlv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/dojo -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/dojo;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/dojo
crfs -v jfs2 -d errlv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/error -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/error;chmod 775 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/error


crfs -v jfs2 -d cprhslv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprhs -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprhs;chmod 755 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cprhs


crfs -v jfs2 -d dkvwlv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/dkvwk -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/dkvwk;chmod 755 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/dkvwk
crfs -v jfs2 -d cmvlv -m /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cmv -a options=cio -A yes;mount /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cmv;chmod 755 /qmd/cpr/ucd/<INSTANCE><grp#>/dbase/cmv
