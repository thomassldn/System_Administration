#! /bin/bash
#
#Author(s): Thomas S
#Desc: Cache System Audit - This bash script performs a cache system audit of a server and generates an html report. This script does not break or modify anything. It just displays system information.
#Date: 27 Sep 19
#
#
#


##Function addHTMLTop
function addHTMLTop {

echo "<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 50%;
}
td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body bgcolor="#FFFAFA">
<h1 align='center'>Cache Audit</h1>
" > cache_audit_report.html

}

##Function addTable
function addTable {

#declaration of variables
#this variables will be used in the system overview table of this report
hostname=$(hostname)
domain=$(domainname)
site=$(ccontrol qlist | cut -c1-7)
os=$(oslevel)
uptime=$(uptime | cut -c1-23)
memory=$(svmon -G -O unit=GB | head -4 | tail -1 | cut -d " " -f10)
#disk=$()
date=$(date)


echo "
<table>
  <tr>
    <th bgcolor="#95B9C7">Item</th>
    <th bgcolor="#95B9C7">Value</th>
  </tr>
  <tr>
    <td>Server Name</td>
    <td>$hostname</td>
  </tr>
  <tr>
    <td>Domain Name</td>
    <td>$domain</td>
  </tr>
  <tr>
    <td>Site Name</td>
    <td>$site</td>
  </tr>
  <tr>
    <td>Operating System</td>
    <td>$os</td>
  </tr>
  <tr>
    <td>Total Memory</td>
    <td>$memory</td>
  </tr>
  <tr>
    <td>System Uptime</td>
    <td>$uptime</td>
  </tr>
  <tr>
    <td>Local Time</td>
    <td>$date</td>
  </tr>
</table>" >> cache_audit_report.html


}


##Function Main
#echo "<h3> </h3>" >> cache_audit_report.html
function main {

        #add top of HTML code
        addHTMLTop


        echo "<h2 align='center'>System Overview</h2>" >> cache_audit_report.html

        #addTable
        addTable


        ##Prerequisites##
        #################
        #UNIX Server Filesystem Configuration
        echo "<h2 align='center'>Prerequisites</h2>" >> cache_audit_report.html
        echo "<h3>UNIX Server Filesystem Configuration</h3>" >> cache_audit_report.html

        df -g | awk '{print $NF}'  > df.txt
        df -g | awk '{print $2}'  > gbBlocks.txt

         echo " <table>
            <tr>
              <th bgcolor="#95B9C7">Filesystem</th>
              <th bgcolor="#95B9C7">GB blocks</th>
            </tr> " >> cache_audit_report.html

        while read -r a && read -r b <&3
        do
        echo "<tr><td>$a</td><td>$b</td></tr>" >> cache_audit_report.html
        done < df.txt 3<gbBlocks.txt


        echo " </table> "  >> cache_audit_report.html


        rm -f df.txt gbBlocks.txt

        #Cache Key
        echo "<h3>Cache Key</h3>" >> cache_audit_report.html
        cp /qmd/*/mgr/cache.key keyfile

        key=$(cat keyfile | sed 's/$/<br>/')


         echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Version</th>
                </tr>

                </tr>
                  <td>$key</td>
                </tr>
             </table> " >> cache_audit_report.html

        rm -f keyfile


        #Apache Version
        echo "<h3>Apache</h3>" >> cache_audit_report.html

        apacheversion=$(/qmd/apache/bin/apachectl -version | sed 's/$/<br>/')

         echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Version</th>
                </tr>

                </tr>
                  <td>$apacheversion</td>
                </tr>
             </table> " >> cache_audit_report.html


        #Java Version
        echo "<h3>Java</h3>" >> cache_audit_report.html
        java=$(java -version 2>&1 | grep version  | sed 's/$/<br>/')


         echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Version</th>
                </tr>

                </tr>
                  <td>$java</td>
                </tr>
             </table> " >> cache_audit_report.html





        #OS Level
        echo "<h3>OS Level</h3>" >> cache_audit_report.html

        oslevel=$(oslevel | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Version</th>
                </tr>

                </tr>
                  <td>$oslevel</td>
                </tr>
             </table> " >> cache_audit_report.html


        #IBM XL C/C++ Runtime
        echo "<h3>IBM XL C/C++ Runtime</h3>" >> cache_audit_report.html

        lslpp=$(lslpp -l | grep XL | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Version</th>
                </tr>

                </tr>
                  <td>$lslpp</td>
                </tr>
             </table> " >> cache_audit_report.html




        ##HARDWARE REQUIREMENTS & OPTIMAZATION SETTINGS##
        #################################################
        echo "<h2 align='center'>Hardware Requirements & Optimization Settings</h2>" >> cache_audit_report.html

        #File System Mount Settings
        echo "<h3>File System Mounts </h3>" >> cache_audit_report.html

        mount | awk -F ' ' '{print  $2}' > mount.txt
        mount | awk -F ' ' '{print  $NF}'  > options.txt

         echo " <table>
            <tr>
              <th bgcolor="#95B9C7">Mount</th>
              <th bgcolor="#95B9C7">Options</th>
            </tr> " >> cache_audit_report.html

        while read -r a && read -r b <&3
        do
        echo "<tr><td>$a</td><td>$b</td></tr>" >> cache_audit_report.html
        done < mount.txt 3<options.txt


        echo " </table> "  >> cache_audit_report.html


        rm -f mount.txt options.txt



        #mount=$(mount | mount | awk -F ' ' '{print  $NF}' | sed 's/$/<br>/')


       # echo "<table>
        #        <tr>
         #         <th bgcolor="#95B9C7">Settings</th>
          #      </tr>

 #               </tr>
  #                <td>$mount</td>
   #             </tr>
    #         </table> " >> cache_audit_report.html


        #Virtual Memory Manager Options
        echo "<h3>Virtual Memory Manager</h3>" >> cache_audit_report.html
        vmo=$(vmo -aF | egrep 'minperm%|maxclient%|maxperm%' | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Options</th>
                </tr>

                </tr>
                  <td>$vmo</td>
                </tr>
             </table> " >> cache_audit_report.html


        #Disk Manager Options
        echo "<h3>Disk Manager Options</h3>" >> cache_audit_report.html
        ioo=$(ioo -aF | egrep 'j2_minPageReadAhead|j2_maxPageReadAhead|j2_maxRandomWrite|jfs_clread_enabled|minpgahead|maxpgahead|maxrandwrt|numfsbufs|pv_min_pbuf|j2_nBufferPerPagerDevice|lvm_bufcnt|j2_dynamicBufferPreallocation|sync_release_ilock' | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Settings</th>
                </tr>

                </tr>
                  <td>$ioo</td>
                </tr>
             </table> " >> cache_audit_report.html

        #Network Options
        echo "<h3>Network Options</h3>" >> cache_audit_report.html
        no=$(no -aF | egrep 'tcp_nodelayack|tcp_keepcnt|tcp_keepidle|tcp_keepinit|tcp_keepintvl|tcp_recvspace|tcp_sendspace' | sed 's/$/<br>/')
        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Settings</th>
                </tr>

                </tr>
                  <td>$no</td>
                </tr>
             </table> " >> cache_audit_report.html


        #AIX hdisk Options (e.g., SAN with Fibre and SCSI drives)
        echo "<h3>AIX hdisk Options (e.g., SAN with Fibre and SCSI drives)</h3>" >> cache_audit_report.html

        #Process Limits Settings
        echo "<h3>Process Limits </h3>" >> cache_audit_report.html
        limits=$(cat -n /etc/security/limits | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Settings</th>
                </tr>

                </tr>
                  <td>$limits</td>
                </tr>
             </table> " >> cache_audit_report.html


        #Core File Management Settings
        echo "<h3>Core File Management</h3>" >> cache_audit_report.html
        lscore=$(lscore -d | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Settings</th>
                </tr>

                </tr>
                  <td>$lscore</td>
                </tr>
             </table> " >> cache_audit_report.html


        ##UNIX Platform Packages (All LPARs/Servers in Domain)##
        ########################################################

        #dbx
        echo "<h3>The Following Packets are Required</h3>" >> cache_audit_report.html
        echo "<h3>Dbx</h3>" >> cache_audit_report.html
        dbx=$(lslpp -l |grep "bos.adt.debug" | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Version</th>
                </tr>

                </tr>
                  <td>$dbx</td>
                </tr>
             </table> " >> cache_audit_report.html


        #Samba
        echo "<h3>Samba</h3>" >> cache_audit_report.html
        samba=$(lslpp -l |grep "samba" | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Version</th>
                </tr>

                </tr>
                  <td>$samba</td>
                </tr>
             </table> " >> cache_audit_report.html



        #Lsof
        echo "<h3>Lsof</h3>" >> cache_audit_report.html
        lsof=$(lslpp -l |grep "lsof" | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Version</th>
                </tr>

                </tr>
                  <td>$lsof</td>
                </tr>
             </table> " >> cache_audit_report.html



        #Changes to Maxuproc
        echo "<h3>Maxuproc </h3>" >> cache_audit_report.html
        lsattr=$(lsattr -El sys0|fgrep maxuproc | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Settings</th>
                </tr>

                </tr>
                  <td>$lsattr</td>
                </tr>
             </table> " >> cache_audit_report.html


        #Sysdump Settings
        echo "<h3>Sysdump </h3>" >> cache_audit_report.html
        sysdump=$(sysdumpdev -t traditional | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Settings</th>
                </tr>

                </tr>
                  <td>$sysdump</td>
                </tr>
             </table> " >> cache_audit_report.html




        ##Cache Users and Group Check##
        ###############################

        #Users
        echo "<h3>Users</h3>" >> cache_audit_report.html
        users=$(nl /etc/passwd | sed 's/$/<br>/')


        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">File</th>
                </tr>

                </tr>
                  <td>$users</td>
                </tr>
             </table> " >> cache_audit_report.html


        #Groups
        echo "<h3>Groups</h3>" >> cache_audit_report.html
        groups=$(nl /etc/group | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">File</th>
                </tr>

                </tr>
                  <td>$groups</td>
                </tr>
             </table> " >> cache_audit_report.html



        #HealthShare Database Path Permissions and Ownerships
        echo "<h3>HealthShare Database Path Permissions and Ownerships</h3>" >> cache_audit_report.html
        dbase=$(ls -trl /qmd/cpr/ucd/*/dbase/ | sed 's/$/<br>/')

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">File</th>
                </tr>

                </tr>
                  <td>$dbase</td>
                </tr>
             </table> " >> cache_audit_report.html


        #End of html report
        echo "<br><br></body></html>" >> cache_audit_report.html

}

#call main and start execution
main
