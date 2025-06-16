using Dates

# Date
today = Dates.today()
println(today)


# DateTime
now = Dates.now()
println(now)

# format
date_format = DateFormat("YYYY/MM/dd HH:mm")
println(Dates.format(now, date_format))


sleep(1)
dt2 = Dates.now()
diff = dt2 - now
println((diff, typeof(diff)))

println(now - DateTime(1970, 1, 1, 0, 0))
