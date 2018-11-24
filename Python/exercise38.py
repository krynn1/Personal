ten_things = "Apples Oranges Crows Telephone Light Sugar"

print("Wait there are not 10 thigns in that list. Let's fix that")

stuff = ten_things.split(' ')
more_stuff = ["Day", "Night", "Song", "Frisbee", "Corn", "Banana", "Girl", "Boy"]


while len(stuff) != 10:
    next_one = more_stuff.pop() #takes the last value at the end
    print("Adding: ", next_one) 
    stuff.append(next_one) #adding value back to the next list
    print(f"There are {len(stuff)} items now")
print("There we go: ", stuff)

print("Lets do some things with stuff.")
print(stuff[1])
print(stuff[-1]) #whoa fancy!
print(stuff.pop())
print(' '.join(stuff)) #What cool?
print('#'.join(stuff[3:5])) #Super stellar
