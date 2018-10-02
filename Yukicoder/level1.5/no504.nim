import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  rate:int
  k_point = readLine(stdin).parseInt
  res = 1

echo res
for i in 1..<n:
  rate = readLine(stdin).parseInt
  if k_point < rate:
    res += 1
  echo res
