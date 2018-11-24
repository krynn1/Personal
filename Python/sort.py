numbers = ['1','2','3','4','5']

def numbers_sort(numbers):
    numbers.sort(reverse=True)
    print(f"Answer" , int(numbers[0]) + int(numbers[1]))

numbers_sort(numbers)