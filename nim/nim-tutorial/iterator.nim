import sequtils, strutils

iterator myCountup(n, m: int): int =
  var count = n
  while count <= m:
    yield count
    count.inc

for i in myCountup(0, 10):
  echo i

