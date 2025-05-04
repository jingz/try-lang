# Let's play python numeric types
# There are 3 numeric types in python
# 1. Integers
# 2. Floating point numbers
# 3. Complex numbers
# In this video we will cover only 1 and 2
# ----------------------------------------

x = 3
y = 10
z = 2
print(x, y, z)  #=> 3 10 2

# sum
print(x + y)  #=> 13

# difference
print(y - x)  #=> 7
print(z - x)  #=> -1

# product
print(x * y)  #=> 30
print(x * z)  #=> 6
print(z * y)  #=> 20

# quotient
print(x / y)  #=> 0.3
print(z / y)  #=> 0.2
print(y / z)  #=> 5.0

# floored quotient
print(x // y)  #=> 0
print(y // z)  #=> 5
print(y // x)  #=> 3

# remainder
print(y % x)  #=> 1
print(y % z)  #=> 0
print(x % y)  #=> 3
print(z % y)  #=> 2
print(z % x)  #=> 2
print(x % z)  #=> 1

# negated
print(-x)  #=> -3
print(-z)  #=> -2

# unchanged
print(+x)  #=> 3
print(+z)  #=> 2

t = -2
print(+t)  #=> -2

# abs
print(abs(t))  #=> 2

# pow
print(pow(x, y))  #=> 59049
print(pow(z, x))  #=> 8
print(z ** x)  #=> 8
print(x ** z)  #=> 9

# ending
print(x, y, z, -t)  #=> 3 10 2 2
