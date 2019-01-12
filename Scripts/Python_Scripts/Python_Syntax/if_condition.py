#Author: Thomas S
#Date:5 Nov 18
#Desc:if condition examples; Chp5 of python crash course
#Functions:input(), int(input()),float(input())

###########################################################
#Example of If 	
###########################################################
name = input("What is your name?")
age = int(input("What is your age?"))#raw_input reads Strings 

if age < 18:
    print("Hello " + name + ", you are underage.")
else:
    print("Hello " + name + ", you are an adult.")

###########################################################
#Checking multiple conditions
###########################################################
age = int(input("What is your age?"))

if age > 18 and age < 25: 
    print("You are between the ages of 18 and 25.")
else: 
    print("You are NOT between the ages of 18 and 25.")


##########################################################
#Using "not" to check whether values are not in a list
##########################################################
students = ["John Doe", "Ana", "James", "Anthony"]

if "Ana" not in students:
    print("Anna is not a student in the class")
else:
    print("Anna is part of the class")

##########################################################
#Different types of if statements 
##########################################################
#if-elif-else; the last else is optional
month = input("What month were you born?")

if month == "June": 
    print("You were born in June")
elif month == "March":
    print("You were born in March")
elif month == "September":
    print("You were born in September")
else:
    print("You were not born in June, March, or September!")

##########################################################
#Checking if a list is empty
##########################################################
#if you put the name of a list on an if statement, python returns
#true if the list is not empty, false if the list is empty. 
empty_list = []

if empty_list:
    print("This list is empty.")
else:
    print("This list is empty.")


#########################################################
#Check if two lists are te same
#########################################################
list_one = ['one', 'two', 'three','four']
list_two = ['ten', 'two', 'three','four']

for list_one in list_two: 
    if list_one in list_two: 
       print( list_one + " is in the list")
    else:
       print("Sorry, " + list_one + "is not in list_one")
