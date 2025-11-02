def encode(n):
    return chr(n+97)

def decode(c):
    return ord(c) - 97

def to_nl(x):
    y = 1
    i = 0
    while y < x:
        i += 1
        y = pow(26, i)
    
    l = []
    r = i - 1
    while r > 0:
        y = pow(26, r)
        z = x / y
        l.append(z) 
        x = x - (y*z)
        r -= 1

    l.append(x % 26)
    return l

def to_dec(word):
    wl = map(decode, word)
    ll = [ x * (pow(26, len(wl) - 1 - i)) for i, x in enumerate(wl) ]
    return sum(ll)

def to_word(n):
    cl = to_nl(n)
    return "".join(map(encode, cl))

# {[([dota + is + ijlegcod]/[a*(game^of^love) + b])*zanroo ] + tmfafj = }
# {[([dota + is + ijlegcod]])*zanroo ] + tmfafj = }
# simplify to [ a*b ] + c
a = to_dec("dota") + to_dec("is") + to_dec("ijlegcod")
b = to_dec("zanroo")
c = to_dec("tmfafj")
r = a*b+c
print r  #=> 19967177491402245277
print to_word(r)  #=> ibgdotaallstar
