#!/usr/bin/env python3
# coding: utf-8

import MySQLdb

con = MySQLdb.connect(host='localhost',
                      port=3306,
                      db="test_db",
                      user="root",
                      passwd='root1234',
                      charset='ascii')
cur = con.cursor()
# connected = con.is_connected()
# print(connected)
# if (not connected):
#     con.ping(True)

cur.execute('SELECT * FROM test_table1')
table = cur.fetchall()
print(table)
