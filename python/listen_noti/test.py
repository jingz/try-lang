DSN = 'dbname=aboss user=aboss password=password'
import sys, psycopg2, select, time

print "Opening connection using dns:", DSN
conn = psycopg2.connect(DSN)
conn.autocommit = True
curs = conn.cursor()

curs.execute("listen test")
print "Waiting for 'NOTIFY test'"
while 1:
    print 'waiting ...'
    #select.select([conn],[],[]) != ([],[],[]):
    select.select([conn],[],[])
    curs.execute("SELECT 1")
    n = conn.notifies.pop()
    print n.pid, n.channel, n.payload
