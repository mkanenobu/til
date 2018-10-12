require "luasql.mysql"

dbname = "test_db"
dbhost = "localhost"
dbuser = "root"
dbpass = "root1234"

env = assert(luasql.mysql())
con = assert(env:connect(dbname, dbuser, dbpass, dbhost))

cur = con:execute("SELECT * FROM test_table1")
row = cur:fetch({}, "a")
while row do
  print(string.format("#%03d %s (%s)", row.id, row.name))
  row = cur:fetch({}, "a")
end

cur:close()
con:close()
env:close()
