class Money(object):
    def __init__(self, dollars, cent):
        self.total_cents = dollars * 100 + cent


    @property
    def display(self):
        return "I have {:d} dollars and {:d} cents".format(self.dollars, self.cents)


    @property
    def dollars(self):
        return self.total_cents // 100


    @dollars.setter
    def dollars(self, d):
        # XXX DO NOT use +=
        self.total_cents = (d * 100 + self.cents)


    @property
    def cents(self):
        return self.total_cents % 100


    @cents.setter
    def cents(self, c):
        # XXX DO NOT use +=
        self.total_cents = (self.dollars * 100 + c)



money = Money(10, 5)
print money.display  #=> I have 10 dollars and 5 cents

money.dollars += 10
money.cents += 10
print money.display  #=> I have 20 dollars and 15 cents
print money.total_cents  #=> 2015
