#! /usr/bin/expect -f 
#Date: 28 Sept 18
#Desc: Expect Syntax; To download expect use 'yum install expect' or 'apt-get install expect'
#      This script runs another script called questions and answers that script's prompts. 
#Author(s): Thomas S

set timeout -1

spawn ./expect_questions

expect "What is your name?"
send -- "Thomas\r"

expect "What day is it?\r"
send -- "Tuesday\r"

expect "Do you have any more requests?\r"
send -- "Yes\r"

expect eof
