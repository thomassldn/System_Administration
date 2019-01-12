#Author: Thomas S
#Date:2 Jan 19
#Desc: This python file shows the syntax of dictionaries in python; Chp6 of PythonCrashCourse
#Functions/Statements Used: del dic_1['example']; dic_1.items()-returs a list of keyvalue pairs; dic_1.keys()- returns a list of keys; sorted(dic_1) - sorts the keys in a dictionary; dic_1.values()-returns a list of values; set(dic_1.values()) - returns a list of values without any duplicates;  

###########################################################
#Dictionary Syntax
###########################################################
car_1 = {'color': 'red', 'make': "toyota"}

print( "The car's color is: " + car_1['color'])
print( "The car's make is: " + car_1['make'] + "\n")

##########################################################
#Adding values to dictionaries
##########################################################
#Dictionaries are Dynamic
print("Adding a model key and value to the car dictionary.\n")
car_1['model']='corola'
print("The cars model is: " + car_1['model'])
print(car_1)

##########################################################
#Deleting Key-Values from dictionaries 
##########################################################
print("\nThe dictionary contains:\n") 
print(car_1)
print("Deleting the make key-value pair:\n")
del car_1['make']
print("The dictionary now contains:\n")
print(car_1)

#########################################################
#Looping through dictionaries
#########################################################
#You can loop through a dictionary through its keys or values
user_0 = { 
 'username' : 'John123', 
 'first' : 'John',
 'second' : 'Doe'
 }

for k, v in user_0.items(): 
 print('\nKey: '   + k)
 print('Value: ' + v)

#########################################################
#Looping through the keys in a dictionary
#########################################################
users = {
 'Alex' : '39',
 'Sam'  : '39',
 'Jose' : '34',
 'Ron'  : '24',
 'Elm'  : '28'
 } 

print("\nThese are all of our users:\n")

for u in users.keys(): 
 print(u.title())

#printing the list in order with the sorted() function
print("\nThese are all of our users, sorted:\n") 

for u in sorted(users.keys()): 
 print(u.title())

#printing the values in a list 
print("\nThese are the values in the list:")

for v in users.values(): 
 print (v)


#printing the values in a list with out any repeats
print ("\nThese are the values in the list without any repeats:\n")

for v in set(users.values()):
 print(v)

###########################################################
#NESTING: a list of dictionaries
###########################################################
user1 = { 'Name' : 'Thomas', 'Age' : '26'}
user2 = { 'Name' : 'Alex', 'Age' : '34'}
user3 = { 'Name' : 'Daniel', 'Age' : '23'}

users = [ user1, user2, user3] 

print("\nPrinting list of dictionaries")

for user in users: 
 print(user)


#list inside dictionaries
pizza = {
 'crust' : 'thick',
 'topping': ['mushrooms', 'extra cheese']
 }

print ("\nYou ordered a " + pizza['crust'] + "-crust pizza" + "with the following toppings:")

for topping in pizza['topping']:
 print("\t" + topping)


#you can also build dictionaries of dictionaries but the code gets complicated
#quick


