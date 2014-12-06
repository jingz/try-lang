# ------------------------------------
# 1. Primitive Datatypes and Operators
# ------------------------------------

# Integer
print 3  #=> 3
print 1 + 1  #=> 2
print 5 - 1  #=> 4
print 1 - 5  #=> -4

print 3 * 4  #=> 12
print 5 * -3  #=> -15
print 13 / 4  #=> 3
print 13 // 4  #=> 3

# Float
print 4.9  #=> 4.9
print 10.0 / 2 # which one is float  #=> 5.0
print 14 // 3.0 # truncated down to  #=> 4.0

print -16 / 3.0  #=> -5.33333333333
print -16 // 3.0 # truncated down to  #=> -6.0

# Modulo
print 9 % 4  #=> 1
print 6.4 % 5  #=> 1.4
print -17 % 4 #== (-17) - (-20)  #=> 3
print (3 + 5) % 3 # with parentheses  #=> 2

# shorthand operator
x = 1
x += 2
print x  #=> 3
x /= 2
print x  #=> 1
x *= 2
print x  #=> 2


# Boolean
t = True
f = False
print t  #=> True
print f  #=> False
print not t # negate with not  #=> False
# !t raise Error

print t or f # test with or  #=> True
print t and t  #=> True
print t and f  #=> False

print t != t # XOR  #=> False
print t == f  #=> False

# try weird experiment
print t + t # !!  #=> 2
print t + f  #=> 1
print t - 1  #=> 0
print t == 1 # ok is True is 1  #=> True
print f - t # should be -1  #=> -1
print f == 0  #=> True

# Comparisons
print 1 == 1.0  #=> True
print 1 > 10  #=> False
print 1 < 10  #=> True
print 2 <= 2  #=> True
print 2 >= 2  #=> True

print 1 < 2 < 3 # Chained  #=> True
print 1 < 3 < 10 < 20 # longer chain  #=> True
print 1 < 10 < 5  #=> False

# String
# use repr to show quote
print repr('String in single quote')  #=> 'String in single quote'
print repr("String in double quote")  #=> 'String in double quote'
print repr("wrap ' in double quote")  #=> "wrap ' in double quote"
print repr('wrap " in single quote')  #=> 'wrap " in single quote'

print repr("A" + "B")  # concat  #=> 'AB'
print repr("Some String"[0]) # string is a list of character  #=> 'S'

# format strings by using %
print repr("%s welcome back" % ("hello"))  #=> 'hello welcome back'
# or using format method
print repr("{0} come before {1}".format("A", "B"))  #=> 'A come before B'
# with labeled parameters
print repr("{name} is in {team} Team".format(team='Avangers', name='Iron Man'))  #=> 'Iron Man is in Avangers Team'
# multiline string
s = """ This is multiline string
        another line """

# string's methods
s = 'handstand pushup'
print repr(s.upper())  #=> 'HANDSTAND PUSHUP'
print repr(s.title())  #=> 'Handstand Pushup'
print repr(s.lower())  #=> 'handstand pushup'
s = 'fRoG StAnD'
print repr(s.swapcase())  #=> 'FrOg sTaNd'
print repr(s.isalnum()) # contain alphabets or numbers?  #=> False
s = 'getthingdone'
print repr(s.isalpha())  #=> True
s = 'Sarunyoo Chobpanich'
print s.istitle() # check for camelcase  #=> True
print s.isupper()  #=> False
print s.islower()  #=> False
print s.split(' ') # split into a list  #=> ['Sarunyoo', 'Chobpanich']
print "--".join(s.split(' '))  #=> Sarunyoo--Chobpanich
s = '  -simplicity-  '
print repr(s.strip())  #=> '-simplicity-'
print repr(s.lstrip())  #=> '-simplicity-  '
print repr(s.rstrip())  #=> '  -simplicity-'
print s.find('city') # return first found index  #=> 9
print s.find('town')  #=> -1
s = s.strip()
print s.startswith('-')  #=> True
print s.endswith('c')  #=> False
print len(s)  #=> 12

# None value
print repr(None)  #=> None
print "non-none" is None  #=> False
print None == None  #=> True
print None is None # some recommend to use 'is' for testing None  #=> True

# try weird exp with is
print 1 == True  #=> True
print 1 is True  #=> False

# the things evaluate to False
# None, 0 empty string/lists/dict/tubple
print bool(None)  #=> False
print bool(0)  #=> False
print bool("")  #=> False
print bool(" ") # !! string contain a space  #=> True
print bool([]) # list  #=> False
print bool([0]) # !! list of 0  #=> True
print bool({}) # dict  #=> False
print bool(()) # tupple  #=> False

# ----------------------------
# 2. Variables and Collections
# ----------------------------

hi = 'Hey dude!'
print repr(hi)  #=> 'Hey dude!'

# reassign the same variable
hi = hi + ' Wassup!'
print repr(hi)  #=> 'Hey dude! Wassup!'

# ** if access a variable not declare first. It raises an error

# multiple assign
a, b = 1, 2
print a, b  #=> 1 2

# do x if y else z expression
print 'It makes sense!' if 1 < 2 else 'non-sense?'  #=> It makes sense!
# test chain
print 'It makes sense!' if 1 < 2 > 0 else 'non-sense?'  #=> It makes sense!
print 'It makes sense!' if 2 < 1 else 'non-sense'  #=> non-sense

# List
li = []
print li  #=> []
ol = [5,6,7]
print ol  #=> [5, 6, 7]

# Adding stuff on list
# using append method
print li.append(1) # ** append method return  #=> None
print li  #=> [1]

li.append(2)
li.append(3); print li  #=> [1, 2, 3]

# by using +
li = li + [4]; print li  #=> [1, 2, 3, 4]

# Remove Stuff
print li.pop(); # pop method return  #=> 4
print li # 4 is removed by pop  #=> [1, 2, 3]

# Accession
# - using index
print li[0]  #=> 1
print li[2]  #=> 3
# li[4] raise Error becase index out of bound

# - last element
print li[-1]  #=> 3

# - slicing [start:end(exclude):step]
li.append(4)
li.append(5)
print li  #=> [1, 2, 3, 4, 5]
print li[1:3]  #=> [2, 3]
print li[1:] # omit beginning  #=> [2, 3, 4, 5]
print li[:2] # omit the end  #=> [1, 2]
print li[::2] # select every second entry start at 0 index  #=> [1, 3, 5]
print li[::-1] # revert select  #=> [5, 4, 3, 2, 1]
print li[1:4:2]  #=> [2, 4]

print li  #=> [1, 2, 3, 4, 5]
# Remove at index using 'del'
del li[2]
print li  #=> [1, 2, 4, 5]

print ol  #=> [5, 6, 7]
# Adding using +
print li + ol  #=> [1, 2, 4, 5, 5, 6, 7]
print li  #=> [1, 2, 4, 5]
# adding using extend
print li.extend(ol) # extend return  #=> None
print li # modified by extend  #=> [1, 2, 4, 5, 5, 6, 7]

# Testing a member in the list
print li  #=> [1, 2, 4, 5, 5, 6, 7]
print 5 in li  #=> True
print 10 in li  #=> False
print 4 in li[3:]  #=> False

# count the members
print len(li)  #=> 7

# enumerate
for index, element in enumerate(li):
    index + element

# zip
for x, y in zip(li, ol):
    x + y # it iterate min of members on each list times


# Tuples are like list but are imutable.
# which data separeted by comma
tup = (7, 8, 9)
print tup  #=> (7, 8, 9)
print tup[2]  #=> 9
# tup[2] = 5 Raise Error
print len(tup)  #=> 3
# - concat tuples
print tup + (1, 2, 3)  #=> (7, 8, 9, 1, 2, 3)
# - slicing as list
print tup[1:]  #=> (8, 9)
# - Testing member
print 2 in tup  #=> False
# - unpacking tuples
print tup  #=> (7, 8, 9)
a, b, c = tup
print a + b, c  #=> 15 9
# Tuples are created by default if you leave out the parenthese
d, e, f = 1, 2, 3
print d + e + f  #=> 6
a, b, c = d, e, f
print a + b + c # unpack to abc  #=> 6
a = 1, 3, 5, 7, 9
print a  #=> (1, 3, 5, 7, 9)
print type(a)  #=> <type 'tuple'>
# unpack from 'divmod' which return (quotient, remainder)
q, r = divmod(19, 5)
print q  #=> 3
print r  #=> 4


# Dictionaries store mapping
di = {}
print di # empty dict  #=> {}
di = { "first": 1, "second": 2, "third": 3 }

print di  #=> {'second': 2, 'third': 3, 'first': 1}
print di['first']  #=> 1
print di.keys()  #=> ['second', 'third', 'first']
print di.values()  #=> [2, 3, 1]
print 1 in di  #=> False
print "first" in di  #=> True
# Access non-existing key. It raise an error
# Use "get" to avoid the error.
print di.get('first')  #=> 1
print di.get('five', 1)  #=> 1
# use "setdefault" to set pair of key, value which key isn't present
di.setdefault('five', 5)
print di.get('five')  #=> 5
print di.setdefault('five', 6) # still the same  #=> 5
# dict can create from tuples of key, value maybe in python 3
# di = dict((('a', 'b', 'c'), (1, 2, 3)))
print di.setdefault('alist', []).append('first default')  #=> None
print di  #=> {'alist': ['first default'], 'second': 2, 'five': 5, 'third': 3, 'first': 1}
print di.setdefault('alist', []).append('second default')  #=> None
print di  #=> {'alist': ['first default', 'second default'], 'second': 2, 'five': 5, 'third': 3, 'first': 1}

# Set
s = set()
print s  #=> set([])
# - init with list
s = set([1, 2, 3, 4, 5])
print s  #=> set([1, 2, 3, 4, 5])
# - alternative init set
s = {1, 2, 3, 4, 5}
print s  #=> set([1, 2, 3, 4, 5])
# - adding member
print s.add(6) # * add return  #=> None
print s  #=> set([1, 2, 3, 4, 5, 6])

t = {5, 6, 7}
# - intersection
print s & t  #=> set([5, 6])
# - union
print s | t  #=> set([1, 2, 3, 4, 5, 6, 7])
# - set A - B
print s  #=> set([1, 2, 3, 4, 5, 6])
print s - t  #=> set([1, 2, 3, 4])
# - set A or B but not both
print s ^ t  #=> set([1, 2, 3, 4, 7])
print 2 in s  #=> True
print 8 in s  #=> False

# - alternative init with string
a = set("abcdefg")
b = set("hello")
print a  #=> set(['a', 'c', 'b', 'e', 'd', 'g', 'f'])
print b  #=> set(['h', 'e', 'l', 'o'])
print a - b # e is removed  #=> set(['a', 'c', 'b', 'd', 'g', 'f'])
print 'a' in a  #=> True

# List Comprehensions
a = [1, 2, 3]
# like a mapping
print [x * 5 for x in a]  #=> [5, 10, 15]
# and then nested list comp
print [x + 2 for x in [x * 5 for x in a]]  #=> [7, 12, 17]

# -------------------------------
# 3. Control Flow
# -------------------------------

x = 5
### if statement
if x == 9:
    y = 'eq'
elif x > 9:
    y = 'gt'
else:
    y = 'lt'
print repr(y)  #=> 'lt'

### while loop
res = []
while x <= 10:
    res.append(x)    
    x += 1
print res  #=> [5, 6, 7, 8, 9, 10]

### for 
res = []
li = [1, 2, 3]
for i in [y ** 2 for y in li]:
    res.append(i)
print res  #=> [1, 4, 9]

### error handling
try:
    raise IndexError('This is an type of error')
except IndexError as e:
    text = 'Index Error'
except (TypeError, NameError):
    text = 'Another Error'
else:
    text = 'All Pass!'

print repr(text)  #=> 'Index Error'

# -------------------------
# Functions
# ------------------------

def basic_fn(params):
    return 'basic_fn is called with %s' % params

print repr(basic_fn('passing params'))  #=> 'basic_fn is called with passing params'

# Local and Global variables

def change(b):
    a = 10
    return a

a = 20
print a  #=> 20
print change(a)  #=> 10
print a  #=> 20

# default args
def get_coffee(choice='Flappucino'):
    return choice

print get_coffee()  #=> Flappucino
print get_coffee('Americano')  #=> Americano

# !! remember that default value is evaluated only once
def coffee_in_the_list(c, coffee_list = []):
    coffee_list.append(c)
    return coffee_list

print coffee_in_the_list('Flappucino')  #=> ['Flappucino']
print coffee_in_the_list('Americano')  #=> ['Flappucino', 'Americano']
print coffee_in_the_list('Latte', [])  #=> ['Latte']

# keyword args
def todo_workout(name, rep=10, s=3):
    return "we make %s with %d reps in %d sets" % (name, rep, s)

print todo_workout('pushup')  #=> we make pushup with 10 reps in 3 sets
print todo_workout('leg-raise', s=2)  #=> we make leg-raise with 10 reps in 2 sets
print todo_workout('pull-up', s=2, rep=8)  #=> we make pull-up with 8 reps in 2 sets

# function in a function
def simple_map(fn, li):
    _li = []
    for v in li:
        _li.append(fn(v))
    return _li

def double_value(a):
    return a * a

print simple_map(double_value, [1, 2, 3])  #=> [1, 4, 9]

# -----------------------------------------------------
# 4. Class
# -----------------------------------------------------

class Human(object):
    head = True
    body = True
    def say(self, what):
        return "I'm saying %s" % what

    def think(self):
        return "Yes, I'm thinking."

h = Human()
print dir(h)[-3:]  #=> ['head', 'say', 'think']

class Animal(object):
    def say(self, what):
        return "It's yelling %s" % what

    def is_bite(self):
        return True


# inherit from human
class Person(Human):
    # initialize method
    def __init__(self, name):
        self.name = name
        # private property
        self.__feeling = 'Good'

    @property
    def feeling(self):
        return self.__feeling

    @feeling.setter
    def feeling(self, value):
        self.__feeling = value
        pass
    

p = Person('test')
print p.name, p  #=> test <__main__.Person object at 0x1077a6e10>
print p.say('hello')  #=> I'm saying hello
# *** p.__feeling raise AttributeError: 'Person' object has no attribute '__feeling'
print p.feeling  #=> Good
p.feeling = 'very great'
print repr(p.feeling)  #=> 'very great'

# multiple inheritance
class Creature(Animal, Human):
    #* if inherited method is collided the one in 
    #* the first inherited class(Animal) is called
    pass

c = Creature()
print c.say('555')  #=> It's yelling 555
print c.is_bite()  #=> True
print c.think()  #=> Yes, I'm thinking.

# -------------------------------------------------------
# 5. Iterators, Generators And Decorators
# -------------------------------------------------------

### Iterators
# is used in for and in statements
# The Iterator Protocol
# It must implement '__iter__' and 'next' method
# '__iter__' must return object itself
# 'next' must return the next value or raise 'StepIteration' if no more items
class Counter(object):
    def __init__(self, l, h):
        self.current = l
        self.hight = h

    def __iter__(self):
        return self

    def next(self):
        if self.current > self.hight:
            raise StopIteration
        else:
            self.current += 1
            return self.current - 1

c = Counter(1, 9)
print c.next()  #=> 1
print next(c)  #=> 2

for i in c:
    i  # 3, 4, 5

print c.current  #=> 10

### Generators 
# is an easier way to create iterators using
# a keyword 'yield'

def gen():
    yield 'x'
    yield 'y'
    yield 'z'

b = ''
for a in gen():
    b += a
print b  #=> xyz

# reusable generator
class XCounter(object):
    def __init__(self, l, h):
        self.low = l
        self.high = h

    def __iter__(self):
        counter = self.low
        while self.high >= counter:
            yield counter
            counter += 1

c = XCounter(5, 10)
b = []
for i in c:
    b.append(i)

print b  #=> [5, 6, 7, 8, 9, 10]

b = []
for i in c:
    b.append(i)
print b  #=> [5, 6, 7, 8, 9, 10]

### Generator Expression
g = (x*2 for x in range(1, 10))
print g  #=> <generator object <genexpr> at 0x10778ee60>
print sum(g)  #=> 90

### Decorators
# is usually used when we want
# - Arguments Checking
# - Logging
# - Caching
# - Proxy; User Authen
# - Context Provider; Before Filter, After Filter

# example Argumented decorator
def halter(halt=False):
    def _halter(func):
        def __halter(*args, **kwargs):
            if halt:
                return 'The Function is halted.'
            return func(*args, **kwargs)
        return __halter
    return _halter

@halter()
def simple_add(a, b):
    return a+b

print simple_add(1, 2)  #=> 3

@halter(True)
def must_be_halted():
    return 'Hello'

print must_be_halted()  #=> The Function is halted.
