import os
import std/db_sqlite

proc openDb*(): DbConn =
  open(getEnv("DB_PATH"), "", "", "")