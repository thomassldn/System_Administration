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

<h2 align='center'>Title</h2>
</br>
</br> " > cache_audit_report.html

}

##Function addTable 
function addTable {

echo "<h3>Variable1</h3>

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
addHTMLTop
addTable
addHTMLBottom

