x = 10

if x > 10:
    print("X is larger than 10.")
elif x == 10:
    print("X is 10.")
else:
    print("X is not larger than 10.")


for i in range(6):
    print("The number is {:,.2f}".format(i))


for animal in ('cat', 'rat', 'dog',):
    print(animal)


x = 0
while x < 5:
    print(x)
    x += 1

a = dict(x=1, y=2)
print(a)

try:
    a['z']
except Exception as e:
    print(type(e))


with open("ww3.py") as f:
    for line in f:
        print(line)

for k in a:
    print(k, a[k])

it = iter(list([1, 2, 3, 4]))

print(it)
print(next(it))
print(next(it))
print("programe do another things")
print(next(it))
try:
    print(next(it))
    print(next(it))
except StopIteration as e:
    print(type(e))
    print("do another things")

