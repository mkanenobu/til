import sequtils, strutils
var
  a, b, diff, res: int
(a, b) = readLine(stdin).split.map(parseInt)
diff = b - a

for i in 0..diff:
  res += i

echo res - b
