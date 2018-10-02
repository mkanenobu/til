import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  num, res = 0

for i in 1..n:
  num = 0
  if i mod 2 == 0:
    continue
  for j in 1..n:
    if i mod j == 0:
      num += 1
    if num > 8:
      break
  if num == 8:
    res += 1

echo res
