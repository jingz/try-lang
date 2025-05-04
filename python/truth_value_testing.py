# Let's play Truth Value Testing

t = None
print(t, bool(t))  #=> None False

t = False
print(t, bool(t))  #=> False False

t = 0
print(t, bool(t))  #=> 0 False

t = 0.1
print(t, bool(t))  #=> 0.1 True

t = 0.0
print(t, bool(t))  #=> 0.0 False

t = ''
print(repr(t), bool(t))  #=> '' False

t = '    '
print(repr(t), bool(t))  #=> '    ' True

t = 'e'
print(t, bool(t))  #=> e True

t = ()
print(t, bool(t))  #=> () False

t = [] # array
print(t, bool(t))  #=> [] False

t = [0]
print(t, bool(t))  #=> [0] True

t = {}
print(t, bool(t))  #=> {} False

t = set()
print(t, bool(t))  #=> set() False

t = set([0])
print(t, bool(t))  #=> {0} True
