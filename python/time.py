import datetime as dt
t1 = dt.datetime.now();

print dt.timedelta(microseconds=-1)
print dt.time(11, 9, 20);
t1 = dt.datetime.now();
for i in range(2000000):
    pass
t2 = dt.datetime.now();
diff = (t2 - t1)
print diff
print diff.microseconds
