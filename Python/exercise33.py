i=0
n=1

numbers = []

def number(i,n):
    print(f"At the top i is {i} {n}")
    numbers.append(i)
    numbers.append(n)
    print("Numbers now: ", numbers)
    print(f"At the bottom i is {i}")

while i<6:
    number(i,n)
    n = n + 10
    i = i + 1

print("The numbers: ")
for num in numbers:
    print(num)