people = 30
cars = 40
trucks = 15

if cars > people:
    print("We should take the cars")
elif cars < people or people > trucks:
    print("We can't decide.")
if trucks > cars:
    print("Thats too many trucks")
elif trucks < cars:
    print("Maybe we could take the trucks")
else:
    print("We still can't decide")
if people > trucks:
    print("Alright, Lets just take the trucks")
else:
    print("Fine, lets stay home then.")
