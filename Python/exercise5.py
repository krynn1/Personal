name = 'Zed A. Shaw'
age = 35 # not a lie
height = 74 #inches
weight = 180 #lbs
eyes = 'blue'
teeth = 'White'
hair = 'Brown'

ft= height/12
inches= height - (ft*2)
centimeters= height * 2.54
kilos = weight * .453592
print(f"Lets talk about {name}.")
print(f"He's {ft} ft {inches} inches tall.")
print(f"He's {weight} pounds heavily.")
print(f"He's got  {eyes} eyes and {hair} hair.")
print(f"His teeth are usually {teeth} depending on the coffee")
print(f"Centimeters = {centimeters} and Kilos = {kilos}")
# this line is tricky, try to get it exactly right
total = age + height + weight
print(f"If I add {age}, {height}, and {weight} I get {total}.")

