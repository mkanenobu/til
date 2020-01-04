import norm/sqlite
from db_sqlite import sql, getValue
import logging # logging generated SQL statements
import unicode, sugar, options
import gimei

db("petshop.db", "", "", ""):
  type
    User* = object
      name {. formatIt: ?capitalize(it) .}: string # Name is stored in DB capitalized
      age: Positive # Option field are allow Null in DB
      # Pragmas: parser, formatter, parseIt, formatIt
      salary: Option[int]

  type Pet* = object
    name: string
    age: Positive
    # relation
    owner {.
      dbCol: "userId",
      dbType: "INTEGER",
      fk: User,
      formatIt: ?it.id,
      onDelete: "CASCADE"
    .}: User

addHandler newConsoleLogger()

withDb:
  createTables(force=true)

  var user1 = User(
    age: 23,
    name: $gimeiName(),
  )

  user1.insert()
  dump user1.id

  var petOwnedByUser1 = Pet(
    name: "Pochi",
    age: 6,
    owner: user1
  )
  petOwnedByUser1.insert()

withDb:
  var users = User.getMany(1, cond="name LIKE '%'")
  echo users

# db_sqlite
block:
  let db = open("petshop.db", "", "", "")
  defer: db.close()
  echo db_sqlite.getValue(db, sql"SELECT name FROM pet WHERE id = ?", "1")
