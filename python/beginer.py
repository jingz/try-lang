myint = 7
print myint

myfloat = float(7)
print myfloat

mystring = "my string "
print mystring + "append string"
print mystring*2
print "mystring has %d length" % len(mystring)
print "index of r in mystring is %d" % mystring.index("r")
print "how many t in mystring? .. %d" % mystring.count("t")
print "mystring[2:5] => %s" % mystring[2:5]
print "capital %s" % mystring.upper()
print "lower %s" % mystring.lower()
print "start with Hello ? %s" % mystring.startswith("Hello")
print "or End with string ? %s" % mystring.endswith("string ")
print "split s %s" % mystring.split("s")
myname = "Jing"
age = 28
print "Hello %s with age %d" % (myname, age)
print "my money is %.2f in the pocket" % 100

a, b = 1, 2
print a+b

print a + myfloat + b,
print mystring + str(myfloat)

mylist = [1, 2, 3]
mylist.append(4)
mylist.append(5)
mylistb = [91, 92, 93]
mylistc = [1, 2, 3, 4, 5]
print mylist
print mylist[3]
print mylist + mylistb
print mylistb * 2
print "Is 2 in mylist ? %s" % (2 in mylist)
print "Is 9 in mylist ? %s" % (9 in mylist)
# control flow
if 10 in mylist:
    print "10 is in mylist"
elif 11 in mylist:
    print "11 is in mylist"
else:
    print "10 and 11 is not in mylist"
print "is mylist == mylistc ? %s" % (mylist == mylistc)
print "is mylist same as mylistc ? %s" % (mylist is mylistc)
print "is not mylist == mylistc ? %s" % (not (mylist == mylistc))
print "Looping :"
for i in (mylist + mylistb):
    print i, "is in newlist"
for i in range(5):
    print i, "is in the range"

# operator
a, b, c = 1, 2, 3
print "Is a == b ? %s" % (a == b)
print "Is a < b ? %s" % (a < b)
print "Is a < b or a > c ? %s" % ( a < b or a > c )
print "Is a < b and a > c ? %s" % ( a < b and a > c )

print "Fuction:"
def hello_in_what(say = "nothing to say"):
    print "hello world with %s" % say
hello_in_what("say something")

class FirstClass:
    var_a = "variable a"

    adict = {}
    adict['first'] = "1st properties in dict"
    adict['second'] = "2nd properties in dict"
    adict['third'] = "3rd properties in dict"
    def fn(self):
        print "printing in fn with var %s" % self.var_a

o = FirstClass()
o.fn()
print "value of var_a is %s" % o.var_a
for k, v in o.adict.iteritems():
   print k, "has value is", v
print "delete first element in dict %s" % (o.adict.pop('first'))
print "the rest %s" % o.adict
