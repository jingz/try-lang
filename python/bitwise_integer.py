# Let's explore bitwise operations on integer types
# ------------------------------------------------

x = 1
y = 2
a = 4

print(x | y)
print(y | x)
print(x | a)
print(y | a)

print(x ^ y)
print(x ^ a)
print(y ^ x)
print(y ^ a)

print(x & y)
print(x & a)
print(y & a)
print(y & 3)

# shifted left by n bits
print(x << 1)
print(y << 1)
print(a << 1)
print(x << 2)

# shifted right
print(x >> 1)
print(a >> 1)

# inverted
print(~x)
print(~y)
print(~a)

# end :D
