import sequtils, strutils, algorithm, math
#WA
let
  m = readLine(stdin).parseInt
var
  n = 2017 * 2017
  res:int

for i in 1..2017:
  n = (n * n) mod m

echo (n + 2017) mod m
