import datetime
today = datetime.date.today()
birthday = datetime.date(1994,10,18)
life = today - birthday
print(life.days)

