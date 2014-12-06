from pprint import pprint

class Person(object):
    __firstname = "First Name"
    __lastname = "Last Name"

    def __wrap():
        @classmethod
        def __xxx(cls):
            return 'xxx inside wrap'
        return __xxx

    xxx = __wrap()

    _l = lambda x: x*2
    b = _l(10)
    print "inside class", b
    ll = staticmethod(_l)

    def __init__(self, firstname, lastname):
        self.__firstname = firstname
        self.__lastname = lastname
        pass

    def __str__(self):
        return "First Name: %s , Last Name: %s" % (self.__firstname, self.__lastname)

    def fullname(self):
        return "%s %s" % (self.__firstname, self.__lastname)

    def class_name():
        return "Person"

    @classmethod
    def some_class_method(self):
        return 'SOME CLASS METHOD'
    

p = Person("Sarunyoo", "XX");
# print p
# print p.fullname()
print Person.ll(6)
print "call outside class", Person.b
