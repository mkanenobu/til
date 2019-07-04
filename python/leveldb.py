#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import plyvel

# LevelDB はすべてをバイト列として保存する
db = plyvel.DB('./leveldb_db', create_if_missing=True)

# put item
db.put(b'hoge', b'huga')
db.put(b'foo', b'bar')

# sbapshot
sn = db.snapshot()

# delete
# キーの存在にかかわらず返り値はNone
res = db.delete(b'foo')  # => None
print('res', res)

# get
print(db.get(b'hoge'))
print(db.get(b'foo'))  # => None
print(sn.get(b'foo'))  # => bar


print(db.closed)


db.close()
