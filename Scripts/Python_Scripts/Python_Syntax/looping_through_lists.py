#Author: Thomas S
#Date:29 Oct 18
#Desc:This file shows the basic syntax of looping through lists.  
#Functions: range()-generates number in a range; list(); max(); min(); sum()

#start of program

################################################################
#Using for loop to loop through a list
################################################################
fruits = ["Apple", "Pumpkin", "Strawberry", "Pinapple"]

print("The items in the list are:\n")

#fruit is a temporary variable that will hold each item in the list fruits
#you can execute any number of lines inside the for loop, just indent appropriately
for fruit in fruits:
  print( fruit )

###############################################################
#Generating Numbers and printing them with a for loop 
###############################################################
for x in range(1,10):
  print( x )

#Create a List with the range() function 
list_set = list(range(1,11))
print( list_set )

##############################################################
#Working with min(), max(), sum() and lists
##############################################################
numbers = [22, 333,3434,59,0, 232,202, 45]
print(numbers)

#MAX
print("MAX: ")  
print(max(numbers))

#MIN
print("MIN: ") 
print(min(numbers))

#SUM
print("SUM: ") 
print(sum(numbers))


##############################################################
#List Comprehension
##############################################################
#This 
numbers = []
for x in range(1,11):
  square = x**2
  numbers.append(square)

print("\nNumbers:")
print(numbers)

#Does the same as this
numbers = [x**2 for x in range(1,11)]#x is the expresion and you populate it with a for loop
print("\nNumbers with List Comprehension:")
print(numbers)

##############################################################
#Accessing different parts of a List - Slicing 
##############################################################
phones = ["Nokia", "Android", "Iphone", "Razor", "BlackBerry"]
print("Phones: ")
print(phones[0:2])
print(phones[:3])

##############################################################
#Copying a list using a slice
##############################################################
menu_items = ["hamburger", "tacos", "quesadilla", "burrito"]
#copy menu_items list 
togo_menu = menu_items[:] 

print("To go items: ")
print(togo_menu)


#############################################################
#Tuples
#############################################################
#tuples are like lists, except they use paranthesis instead of brackets, and they are immutable
square = (3,4) 
print("Square's dimensions: ")
print(square[0])
print(square[1])




























#end of program 
