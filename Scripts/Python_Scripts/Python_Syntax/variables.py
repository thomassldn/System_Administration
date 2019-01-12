#Author: Thomas S
#Date:11 Oct 18
#Desc:This simple program demonstrates the use of variables and data types

#=======================================================
#create a variable message and print it                 
#=======================================================
message = "Hello there\n"
print(message)

#=======================================================
#string variables
#in python you can use single and double quote variables
#=======================================================

print ("This is a double quote string\n")
print ('This is a single quote string\n')

#======================================================
#Change letter cases with methods 
#USE METHOD(S): .title(), .upper(), .lower()
#======================================================
a_string = "this is a string\n"

print(a_string.title())#output:This Is A String
print(a_string.upper())#output:THIS IS A STRING 
print(a_string.lower())#output:this is a string

#=====================================================
#Concatinating a String
#======================================================
string_1 = "This is"
string_2 = "a String!!"

a_string = string_1 + ' ' + string_2
print(a_string)#output:This is a String!!

#or
print("This is " + string_2)#output:This is a String!!

#=====================================================
#Stripp white spaces at beginning and end of strings
#USE METHOD: .rstrip(); .lstrip() 
#======================================================
user_name = "Lex745    "#string with space that will be stripped 
print(user_name.rstrip())






#end of program 
