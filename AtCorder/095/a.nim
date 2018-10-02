import  sequtils, strutils, algorithm, math

var
  s = readLine(stdin)
  res = 700

res += 100 * count(s, 'o')
echo res
