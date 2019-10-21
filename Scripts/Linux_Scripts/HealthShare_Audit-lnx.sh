#! /bin/bash
#
#Date: 27 Sep 19
#Desc: Cache System Audit - This bash script performs a cache/healthshare system audit of a server and generates an html report with system information. This script does not break or modify anything. It just displays system information.
#
#
#
#NOTES: Visit https://www.w3schools.com/html/html_tables.asp to view the format of this report. This whole report revolves around this html table.

##Function addHTMLTop; Add the top of the above code to the html report
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
<h1 align='center'>HealthShare Audit</h1>
" > cache_audit_report.html

}

##Function addTable; Adds the system overview table to the html file
function addTable {

#declaration of variables
#these variables will be fed to the system overview tablet
hostname=$(hostname)
domain=$(domainname)
site=$(ccontrol qlist | cut -c1-7)
os=$(cat /etc/*release | tail -1)
uptime=$(uptime | cut -c1-23)
memory=$(cat /proc/meminfo | head -1 | cut -c12-28)
#disk=$()
date=$(date)
cacheVersion=$(ccontrol qlist | cut -c29-48)

#add the table to the .html file
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


##Function Main; Execution Starts H
function main {

        #Call function addHTMLTop;Add the the top of the html table to the top of the .html file
        addHTMLTop


        echo "<h2 align='center'>System Overview</h2>" >> cache_audit_report.html

        #addTable system overview table
        echo "<h3>Overview</h3>" >> cache_audit_report.html
        addTable


        ##Prerequisites##
        #################
        #Cache Instances
        echo "<h3>Cache Instances</h3>" >> cache_audit_report.html

        instances=$(ccontrol list)

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Instances</th>
                </tr>

                </tr>
                  <td><pre>$instances</pre></td>
                </tr>
             </table> " >> cache_audit_report.html


        #UNIX Server Filesystem Configuration
        echo "<h2 align='center'>Prerequisites</h2>" >> cache_audit_report.html
        echo "<h3>UNIX Server Filesystem Configuration</h3>" >> cache_audit_report.html

        df -h | egrep 'qmd|backup' |  awk '{print $NF}'  > df.txt
        df -h | egrep 'qmd|backup' |  awk '{print $2}'  > gbBlocks.txt

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

        #copy key file so that we dont have to touch original key file
        cp /qmd/*/mgr/cache.key keyfile

        key=$(cat keyfile)


         echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Version</th>
                </tr>

                </tr>
                  <td><pre>$key</pre></td>
                </tr>
             </table> " >> cache_audit_report.html

        #rm copy of key file after its not needed
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
        java=$(java -version 2>&1)


         echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Version</th>
                </tr>

                </tr>
                  <td><pre>$java</pre></td>
                </tr>
             </table> " >> cache_audit_report.html


        #################################################
        ##HARDWARE REQUIREMENTS & OPTIMAZATION SETTINGS##
        #################################################
        echo "<h2 align='center'>Hardware Requirements & Optimization Settings</h2>" >> cache_audit_report.html

        #File System Mount Settings
        echo "<h3>File System Mounts </h3>" >> cache_audit_report.html

        mounts=$(findmnt)

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Instances</th>
                </tr>

                </tr>
                  <td><pre>$mounts</pre></td>
                </tr>
             </table> " >> cache_audit_report.html


        #Network Options
        echo "<h3>Network Options</h3>" >> cache_audit_report.html

        network=$(cat /etc/sysctl.conf)

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Options</th>
                </tr>

                </tr>
                  <td><pre>$network</pre></td>
                </tr>
             </table> " >> cache_audit_report.html



        #Process Limits Settings
        echo "<h3>Process Limits </h3>" >> cache_audit_report.html
        limits=$(cat /etc/security/limits.conf)

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">/etc/security/limits.conf</th>
                </tr>

                </tr>
                  <td><pre>$limits</pre></td>
                </tr>
             </table> " >> cache_audit_report.html


        #Core File Management Settings
        echo "<h3>Core File Management</h3>" >> cache_audit_report.html
        lscore=$(ulimit -c)

        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">Settings</th>
                </tr>

                </tr>
                  <td>$lscore</td>
                </tr>
             </table> " >> cache_audit_report.html


        ###############################
        ##Cache Users and Group Check##
        ###############################

        #Users
        echo "<h3>Users</h3>" >> cache_audit_report.html
        users=$(nl /etc/passwd | sed 's/$/<br>/')


        echo "<table>
                <tr>
                  <th bgcolor="#95B9C7">/etc/passwd</th>
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
                  <th bgcolor="#95B9C7">/etc/groups</th>
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
                  <th bgcolor="#95B9C7">Permisions</th>
                </tr>

                </tr>
                  <td>$dbase</td>
                </tr>
             </table> " >> cache_audit_report.html


        #End of html report
        echo "<br><br></body></html>" >> cache_audit_report.html

                echo " "
        echo "Please download the 'cache_audit_report.html' file in this current directory for full report."
        echo " "
}

#call main function above and start execution
main
