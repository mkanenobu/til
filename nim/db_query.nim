import db_mysql

let db_schema = open("localhost", "root", "root1234", "okayama-rivets")

# 全ての行を取得
echo db_schema.getAllRows(sql("""SELECT * FROM dl_datas"""))

# クエリ結果を一行ずつ渡すイテレータ
for x in db_schema.fastRows(sql("SELECT * FROM dl_datas")):
  echo x
db_schema.close()
