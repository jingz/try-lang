# Let's explore additional Methods on Integer Types
# ------------------------------------------------

# bit_length
n = 33

print(n, bin(n), n.bit_length())

n = 0
print(bin(n), n.bit_length())

# to_bytes - return an array of bytes representing an int
n = 65
print(n.to_bytes())

n = 199
print(n.to_bytes())

# from_bytes - return the integer represented by the
# given array of bytes
x = int.from_bytes(b'\x00\x10', byteorder='big')
# byteorder is big means the most significant byte
# is at the beginning of the byte array
print(x)

x = int.from_bytes(b'\x00\x10', byteorder='little')
# little means opposite to the big endian
print(x)


# is_integer() call by float object type
n = 1.1
print(n.is_integer())

n = 2.0
print(n.is_integer())

# as_integer_ratio
print((2.5).as_integer_ratio())
print((2).as_integer_ratio())
print((0.8).as_integer_ratio())

# hex
print((3740.0).hex())

# from hex
print(float.fromhex('0x3.a7p10'))

# got different hexadecimal string !
