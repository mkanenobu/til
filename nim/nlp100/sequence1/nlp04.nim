import sequtils, strutils, tables

var
  s = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."
  l = [1, 5, 6, 7, 8, 9, 15, 16, 19]
  result = initTable[int, string]()

for index, word in pairs(s.split):
  if index in l:
    result.add(index, $word[0])
  else:
    result.add(index, word)

echo result
