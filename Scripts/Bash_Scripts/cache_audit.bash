#! /bin/bash

##Function addHTMLTop
function addHTMLTop {

echo "<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
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
<body>

<h1 align='center'>Cache Audit</h1>
</br>
</br> " > cache_audit_report.html

}

##Function addTable 
function addTable {

echo "<h3>Table #1</h3>

<table>
  <tr>
    <th>Column #1</th>
    <th>Column #2</th>
    <th>Column #3</th>
  </tr>
  <tr>
    <td>Value #1</td>
    <td>Value #2</td>
    <td>Value #3</td>
  </tr>
  <tr>
    <td>Value #1</td>
    <td>Value #2</td>
    <td>Value #3</td>
  </tr>
  <tr>
    <td>Value #1</td>
    <td>Value #2</td>
    <td>Value #3</td>
  </tr>
  <tr>
    <td>Value #1</td>
    <td>Value #2</td>
    <td>Value #3</td>
  </tr>
  <tr>
    <td>Value #1</td>
    <td>Value #2</td>
    <td>Value #3</td>
  </tr>
  <tr>
    <td>Value #1</td>
    <td>Value #2</td>
    <td>Value #3</td>
  </tr>
</table>" >> cache_audit_report.html


} 

##Function addHTMLBottom
function addHTMLBottom { 

echo "</body>
</html>" >> cache_audit_report.html

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
        #diskFree=$(df -h) 
	#echo $diskFree >> cache_audit_report.html


	#Cache Key
	echo "<h3>Cache Key</h3>" >> cache_audit_report.html


	#Apache Version
	echo "<h3>Apache Version</h3>" >> cache_audit_report.html

	
	#Java Version
	echo "<h3>Java Version</h3>" >> cache_audit_report.html


	#OS Level 
	echo "<h3>OS Level</h3>" >> cache_audit_report.html


	#IBM XL C/C++ Runtime 
	echo "<h3>IBM XL C/C++ Runtime</h3>" >> cache_audit_report.html

	##HARDWARE REQUIREMENTS & OPTIMAZATION SETTINGS## 
	#################################################
	echo "<h2 align='center'>Hardware Requirements & Optimization Settings</h2>" >> cache_audit_report.html
	
	#File System Mount Settings
	echo "<h3>File System Mount Settings</h3>" >> cache_audit_report.html
	

	#Virtual Memory Manager Options
	echo "<h3>Virtual Memory Manager Options</h3>" >> cache_audit_report.html


	#Disk Manager Options
	echo "<h3>Disk Manager Options</h3>" >> cache_audit_report.html
	

	#Network Options
	echo "<h3>Network Options</h3>" >> cache_audit_report.html
	

	#AIX hdisk Options (e.g., SAN with Fibre and SCSI drives)
	echo "<h3>AIX hdisk Options (e.g., SAN with Fibre and SCSI drives</h3>" >> cache_audit_report.html

	#Process Limits Settings 
	echo "<h3>Process Limits Settings</h3>" >> cache_audit_report.html


	#Core File Management Settings
	echo "<h3>Core File Management Settings</h3>" >> cache_audit_report.html

	##UNIX Platform Packages (All LPARs/Servers in Domain)##
	########################################################

	#dbx
	echo "<h3>The Following Packets are Required</h3>" >> cache_audit_report.html
	echo "<h3>Dbx</h3>" >> cache_audit_report.html


	#Samba
	echo "<h3>Samba</h3>" >> cache_audit_report.html


	#Lsof
	echo "<h3>Lsof</h3>" >> cache_audit_report.html


	#Changes to Maxuproc
	echo "<h3>Maxuproc </h3>" >> cache_audit_report.html

	
	#Sysdump Settings 
	echo "<h3>Sysdump Settings</h3>" >> cache_audit_report.html


	##Cache Users and Group Check##
	###############################
	
	#Users
	echo "<h3>Users</h3>" >> cache_audit_report.html

	#Groups
	echo "<h3>Groups</h3>" >> cache_audit_report.html


	#HealthShare Database Path Permissions and Ownerships
	echo "<h3>HealthShare Database Path Permissions and Ownerships</h3>" >> cache_audit_report.html


	




	#addTable	
	addHTMLBottom

}

#call main and start execution
main
