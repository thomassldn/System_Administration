#! /bin/bash

for i in `ls *.exception` ; do mv $i ${i%.exception} ; done
