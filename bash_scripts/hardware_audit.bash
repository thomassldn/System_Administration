#! /bin/bash

printf "\n%s\n" "=======================================" 
mount | grep "cio"


printf "\n%s\n" "=======================================" 
vmo -aF | grep "minperm%"
vmo -aF | grep "maxclient%"
vmo -aF | grep "maxperm%"


printf "\n%s\n" "=======================================" 
ioo -aF | grep "j2_minPageReadAhead"
ioo -aF | grep "j2_maxPageReadAhead"
ioo -aF | grep "j2_maxRandomWrite"
ioo -aF | grep "jfs_clread_enabled"
ioo -aF | grep "minpgahead"
ioo -aF | grep "maxpgahead"
ioo -aF | grep "maxrandwrt"
ioo -aF | grep "numfsbufs"
ioo -aF | grep "pv_min_pbuf"
ioo -aF | grep "j2_nBufferPerPagerDevice"
ioo -aF | grep "lvm_bufcnt"
ioo -aF | grep "j2_dynamicBufferPreallocation"
ioo -aF | grep "sync_release_ilock"



printf "\n%s\n" "=======================================" 
no -aF | grep "tcp_nodelayack"
no -aF | grep "tcp_keepcnt"
no -aF | grep "tcp_keepidle"
no -aF | grep "tcp_keepinit"
no -aF | grep "tcp_keepintvl"
no -aF | grep "tcp_recvspace"
no -aF | grep "tcp_sendspace"



printf "\n%s\n" "=======================================" 
cat -n /etc/security/limits

printf "\n%s\n" "=======================================" 
lscore -d


printf "\n%s\n" "=======================================" 
lslpp -l | grep "bos.adt.debug"


printf "\n%s\n" "=======================================" 
lslpp -l | grep "samba" 


printf "\n%s\n" "=======================================" 
lslpp -l | grep "lsof"


printf "\n%s\n" "=======================================" 
lsattr -El sys0 | fgrep maxuproc

printf "\n%s\n" "=======================================" 
cat -n /etc/passwd


printf "\n%s\n" "=======================================" 
cat -n /etc/group


printf "\n%s\n" "======================================="
gs -v



printf "\n%s\n" "=======================================" 
cd /
qpdf -version














SET IOO settings
====================

ioo -p -o j2_minPageReadAhead=0
ioo -p -o j2_maxPageReadAhead=1
ioo -p -o j2_maxRandomWrite=16
ioo -p -o jfs_clread_enabled=1
ioo -p -o minpgahead=2
ioo -p -o maxpgahead=4
ioo -p -o maxrandwrt=32
ioo -p -o numfsbufs=2048
ioo -p -o pv_min_pbuf=1024
ioo -p -o j2_nBufferPerPagerDevice=2048
ioo -p -o lvm_bufcnt=32
ioo -p -o j2_dynamicBufferPreallocation=256
ioo -p -o sync_release_ilock=1


SET Network Options
=========================
no -p -o tcp_nodelayack=1
no -p -o tcp_keepcnt=8
no -p -o tcp_keepidle=120
no -p -o tcp_keepinit=60
no -p -o tcp_keepintvl=60
no -p -o tcp_recvspace=65536
no -p -o tcp_sendspace=65536
