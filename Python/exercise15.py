#Imports modules for 
from sys import argv
#parses the variables
script, filename = argv
#opens the file
txt = open(filename)
#types your file
print(f"Here's your file {filename}:")
#prints the values of the txt file you opened on line 6
print(txt.read())
#User inputs the file name again
print("Type the filename again:")
file_again = input("> ")
#File is opened using a different variable
txt_again = open(file_again)
print(txt.read())
print(txt_again.read())
txt.close()
txt_again.close()
