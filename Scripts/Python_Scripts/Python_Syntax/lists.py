#Author: Thomas S
#Date:18 Oct 18
#Desc: This basic program shows the syntax of lists in python. 
#Functions: title(), append(), insert(), pop(), remove(), sort(),sort(reverse=True), sorted(), reverese() 
#            len()

################################################################
#Simple List of strings
################################################################
fruits = ['apple', 'orange', 'grapes', 'strawberries']
print(fruits)

################################################################
#Access specific elements of a list
################################################################
print(fruits[3])

#Capitalize title
print(fruits[2].title())

#get the last item from the list
print(fruits[-1])

 
################################################################
#Modifing list elements:removing, adding, changing elements
################################################################
games = ['sudoku','chess','checkers']

#Changing a lists value 
games[-1] = 'monopoly'
print(games)

#Adding elements to the end of a list
games.append('UNO')
print(games)

#Inserting elements at different locations within a list
games.insert(1,'BlackJack')
print(games)

#Delete an element of a list using del
del games[2]
print(games)

#Popping items from the end of a list 
car_makes = ['Toyota', 'Chevy', 'Ford', 'Kia']
popped_car = car_makes.pop()
print(car_makes)
print(popped_car)

#Popping items from any position of a list
car_makes.pop(1)
print(car_makes)

#Remove an item from a list by value with remove()
car_makes = ['Toyota','Chevy', 'Ford', 'Kia']
car_makes.remove('Toyota')
print(car_makes)

#Sorting a list permenently
car_makes = ['Toyota','Chevy', 'Ford', 'Kia']
car_makes.sort()
print(car_makes)

#Sort a list in reverse order permently
car_makes.sort(reverse=True)
print(car_makes)

#Sorting a List temporarily with sorted()
car_makes = ['Toyota','Chevy', 'Ford', 'Kia']
#print(car_makes.sorted())

#Printing a list in reverse order with reverse()
car_makes = ['Toyota','Chevy', 'Ford', 'Kia']
car_makes.reverse()
print(car_makes)

#Finding the lenght of a list 
size = len(car_makes)
print(size)








