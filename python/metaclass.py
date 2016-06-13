#!/usr/bin/env python

class MetaHookCreation(type):
    def __init__(cls, name, base, clsdict):
        if(len(cls.mro()) > 2):
            print('was subclass by ' + name)
        super(MetaHookCreation, cls).__init__(name, base, clsdict)
        

class A(object):
    __metaclass__ = MetaHookCreation


class B(A): pass

#=> was subclass by B
