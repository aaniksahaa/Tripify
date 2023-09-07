import random

arr = []

for _ in range(100):
    indicator = random.randint(0,4)
    arr.append(indicator//2)

print(arr.count(0))
print(arr.count(1))
print(arr.count(2))