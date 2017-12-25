print('hello python')  #=> hello python

print(3)  #=> 3
print(1+1)  #=> 2
print(2 * 8)  #=> 16
print(33 / 5)  #=> 6.6

print(10 // 3)  #=> 3
print(11.0 // 3.3)  #=> 3.0
print(-11.0 // 3.3)  #=> -4.0

print(10 / 3)  #=> 3.3333333333333335
print(7 % 3)  #=> 1
print(17 % 3)  #=> 2
print(6 % 3)  #=> 0

print(2 ** 4)  #=> 16
print(1 + 3 * 2)  #=> 7

print(True)  #=> True
print(False)  #=> False
print(not False)  #=> True
print(0 and 551)  #=> 0
print('' or 551)  #=> 551

print(1 == 2)  #=> False
print(1 == 1)  #=> True
print(1 != 1)  #=> False
print(1 != 2)  #=> True
print(1 >= 2)  #=> False
print(1 < 2)  #=> True

print(1 < 5 < 3)  #=> False

a = [1, 2, 3, 4, 5]
b = a
print(b is a)  #=> True
print(b == a)  #=> True

b = [1, 2, 3, 4, 5]
print(b == a)  #=> True
print(b is a)  #=> False

c = [1, 2, 3, 4]
print(c == a)  #=> False

s = "This is a string."
print(s)  #=> This is a string.
s = 'This is also a string.'
print(s)  #=> This is also a string.
print(s + ' world!')  #=> This is also a string. world!
print("Hello " "World!")  #=> Hello World!
print(s[1])  #=> h
print(len(s))  #=> 22

f = "{} can be {}".format("first", "second")
print(f)  #=> first can be second

a = ["first", "second", "third"]
f = "{0} can nimble {2} xxxx {1}".format(*a)
print(f)  #=> first can nimble third xxxx second

a = dict(firstname="Hello", lastname="World!")
f = "{firstname} with {lastname}".format(**a)
print(f)  #=> Hello with World!

f = "%s can be %s the %s %d"
print( f % ("x1", "x2", "x3", 123))  #=> x1 can be x2 the x3 123

print(None)  #=> None
print("" == None)  #=> False

print(bool(123))  #=> True
print(bool(0))  #=> False
print(bool(' '))  #=> True
print(bool(''))  #=> False
print(bool({}))  #=> False
print(bool([]))  #=> False
print(bool(()))  #=> False

r = "yahoo!" if 2 > 2 else "yaheee!" 
print(r)  #=> yaheee!

li = []
print(li)  #=> []

ol = [1, 2, 3, 4, 5, 6]
print(ol)  #=> [1, 2, 3, 4, 5, 6]

ol.append(7)
print(ol)  #=> [1, 2, 3, 4, 5, 6, 7]
ol.insert(0, 0)
print(ol)  #=> [0, 1, 2, 3, 4, 5, 6, 7]

ol.pop()
print(ol)  #=> [0, 1, 2, 3, 4, 5, 6]

print(ol[-1])  #=> 6
print(ol[1:3])  #=> [1, 2]
print(ol[4:])  #=> [4, 5, 6]
print(ol[:4])  #=> [0, 1, 2, 3]
print(ol[::2])  #=> [0, 2, 4, 6]
print(ol[:4:-1])  #=> [6, 5]
print(ol[5::-2])  #=> [5, 3, 1]

del ol[0]
print(ol)  #=> [1, 2, 3, 4, 5, 6]

ol.remove(4)
print(ol)  #=> [1, 2, 3, 5, 6]

ol.insert(3, 4)
print(ol)  #=> [1, 2, 3, 4, 5, 6]

print(ol.index(4))  #=> 3

li = [9, 8 ,7]
print(ol + li)  #=> [1, 2, 3, 4, 5, 6, 9, 8, 7]
print(ol)  #=> [1, 2, 3, 4, 5, 6]
li.extend(ol)
print(li)  #=> [9, 8, 7, 1, 2, 3, 4, 5, 6]

print(19 in li)  #=> False
print(1 in li)  #=> True
print(len(li))  #=> 9

t = (1, 2, 3, 4, 5,)
print(t)  #=> (1, 2, 3, 4, 5)
print(t[1])  #=> 2

print( type( () ) )  #=> <class 'tuple'>
print( type( (1 + 3) ) )  #=> <class 'int'>
print( type( (1,) ) )  #=> <class 'tuple'>
print(t[2:])  #=> (3, 4, 5)

x = (1, 2, 3)
a = x[0]
print(a)  #=> 1
a, b, c = x
print(a + b + c)  #=> 6
y = x + (4, 5, 6)
print(y)  #=> (1, 2, 3, 4, 5, 6)
print(6 in y)  #=> True

a, *b, c = y
print(a)  #=> 1
print(b)  #=> [2, 3, 4, 5]
print(c)  #=> 6
print(a + c)  #=> 7
print(b[2])  #=> 4

d = {}
print(d)  #=> {}
print(type(d))  #=> <class 'dict'>

d = { 'x': 1, 'y': 2 }
print(d)  #=> {'x': 1, 'y': 2}
print(d['x'])  #=> 1
print(list(d.keys()))  #=> ['x', 'y']

print(d.values())  #=> dict_values([1, 2])
print("x" in d)  #=> True
print("z" in d)  #=> False
print(1 in d)  #=> False

print(d.get("x"))  #=> 1
print(d.get("z"))  #=> None
print(d.get("z", 'zzz'))  #=> zzz

d.setdefault('z', 3)
print(d)  #=> {'x': 1, 'y': 2, 'z': 3}

d.setdefault('y', 3)
print(d)  #=> {'x': 1, 'y': 2, 'z': 3}

# [] list  v
# () tuple !!!
# {} dict  k => v
# {} set   v

d.update({'b': 4})
print(d)  #=> {'x': 1, 'y': 2, 'z': 3, 'b': 4}
d.update({'x': 4})
print(d)  #=> {'x': 4, 'y': 2, 'z': 3, 'b': 4}
print(d['x'])  #=> 4

del d['b']
print(d)  #=> {'x': 4, 'y': 2, 'z': 3}

e = {**d, 'g': 5, 'f': 6, 'x': 14}
print(e)  #=> {'x': 14, 'y': 2, 'z': 3, 'g': 5, 'f': 6}

s = set([1, 2, 3, 4, 5])
print(s)  #=> {1, 2, 3, 4, 5}
s = {1, 2, 3, 4, 5, 6}
print(s)  #=> {1, 2, 3, 4, 5, 6}
s = { (1,2,3,), 4, 5 }
print(s)  #=> {4, 5, (1, 2, 3)}
print(len(s))  #=> 3
s.add(6)
print(s)  #=> {4, 5, 6, (1, 2, 3)}
r = { 3, 4, 5, 6 }
print(s & r)  #=> {4, 5, 6}
print(s - r)  #=> {(1, 2, 3)}
print(s | r)  #=> {3, 4, 5, 6, (1, 2, 3)}
print(s ^ r)  #=> {3, (1, 2, 3)}
print(s >= r)  #=> False
print(s <= r)  #=> False
print(3 in s)  #=> False
