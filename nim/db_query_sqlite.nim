import db_sqlite

let db = open("sqlite_test.db", nil, nil, nil)

db.exec(sql"pragma encoding = 'UTF-8'")
db.exec(sql"DROP table if exists test_table")
db.exec(sql("""CREATE TABLE test_table (
              id integer,
              name varchar(50) not null )"""))

db.exec(sql"INSERT INTO test_table (id, name) VALUES (0, ?)", "Jack")
db.exec(sql"INSERT INTO test_table (id, name) VALUES (1, ?)", "兼信")

var allRows = db.getAllRows(sql"SELECT * FROM test_table")
echo allRows

db.close()
