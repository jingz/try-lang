# =============================================
# Let's play 8 comparisons operations in Python
# <, <=, >, >=, ==, !=, is, is not
# =============================================
x = 1
y = 2
z = 3

# 1. '<'
print(x < y)
print(z < x)

# 2. '<='
print(x <= y)
print(y <= z)
print(z <= x)

# 3. '>'
print(x > y)
print(z > y)

# 4. '>='
print(x >= y)
print(z >= y)
print(y >= 2)

# 5. '=='
print(x == y)
print(z == y)
print(y == 2)

# 6. '!='
print(x != y)
print(x != 1)

# 7. 'is' -> applied to class objects
print(x is y)
print(x is int)
print(x.__class__ is int)
print(x.__class__ is float)

# 8. 'is not' -> applied to class objects
print(x is not y)
print(x is not x)
print(x.__class__ is not int)

# 9. Bonus! chainable comparisons
print(x < y < z)
print(z <= y < x)

# please like and share ! thanks thanks !
