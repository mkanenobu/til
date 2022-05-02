import strutils
import std/options
import std/db_sqlite
import std/sequtils
import ../db

type
  User = ref object of RootObj
    id: int
    name: string

proc mapRowToUser(row: Row): Option[User] =
  try:
    if row.len == 0:
      return none(User)
    return some(User(id: parseInt(row[0]), name: row[1]))
  except:
    return none(User)

proc getAllUsers*(): seq[Option[User]] =
  let db = openDb()
  let res = db.getAllRows(sql"SELECT * FROM users")
  db.close()

  return res.map(mapRowToUser)

proc getUser*(id: string): Option[User] =
  let db = openDb()
  let user = db.getRow(sql"SELECT * FROM users WHERE id = ?", id)
  db.close()
  return user.mapRowToUser
