class A(object):
    arg_x = [1,2,3]


def genclass(name, l):
    return type(name, (A,), {'arg_x': l})


NewClass = genclass('EA', ['test', 'string', 'testx']);

print NewClass.arg_x
