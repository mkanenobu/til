import  sequtils, strutils, algorithm, math
var
  k = readLine(stdin).parseFloat
  threshold = 0.0
  n, m, o = 0
  i = 0
for i in $k:
  threshold += ($i).parseFloat
threshold = k / threshold

while i <= int(k):
  for j in $n:
    m += ($j).parseInt
  if threshold >= n / m:
    echo n
    i += 1
  n += 1
