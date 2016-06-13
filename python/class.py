class Person(object):
    __firstname = "First Name" # private static variable
    __lastname = "Last Name"
    _firstname = __firstname # public static variable

    def __wrap():
        # dynamic private class method
        @classmethod
        def __xxx(cls):
            return 'xxx inside wrap'
        return __xxx

    xxx = __wrap()

    _l = lambda x: x*2
    b = _l(10)
    print "inside class", b
    ll = staticmethod(_l)
    __ll = staticmethod(_l) # private

    def __init__(self, firstname, lastname):
        self.__firstname = firstname
        self.__lastname = lastname
        pass

    def __str__(self):
        return "First Name: %s , Last Name: %s" % (self.__firstname, self.__lastname)

    @property
    def fullname(self):
        return "%s %s" % (self.__firstname, self.__lastname)

    @fullname.setter
    def fullname(self, value):
        return "%s %s" % value.split(' ')

    def class_name():
        return "Person"

    @classmethod
    def some_class_method(self):
        return 'SOME CLASS METHOD'
    

p = Person("Sarunyoo", "XX");
print p
print p.fullname
print Person.ll(6)
print "call outside class", Person.b
print Person._firstname
print Person.xxx()
print Person.some_class_method()
