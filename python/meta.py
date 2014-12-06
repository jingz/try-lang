#!/usr/bin/python

class Meme(object):
    _filters = 'field1', \
               'field2', \
               { 'field3': 'combo', 'xxx': 'test' }, \
               { 'field3': 'combo', 'display': 'testset' }

    _grid_columns = 'field1', \
                    'wherer', \
                    'what'

print eval('Meme')._filters
print eval('Meme')._grid_columns
