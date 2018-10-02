import sequtils, strutils, math
# WA
var
  n = readLine(stdin).parseInt
  num ,res:int
  six:seq[int] = @[]
  nine:seq[int] = @[]

for i in 0..n:
  num = 6 ^ i
  if num > n:
    break
  six.add(num)

for i in 0..n:
  num = 9 ^ i
  if num > n:
    break
  nine.add(num)

while n > 0:
  six = filter(six) do (a: int) -> bool: a <= n
  nine = filter(nine) do (a: int) -> bool: a <= n
  n = n - max(max(six), max(nine))
  res += 1

echo res
