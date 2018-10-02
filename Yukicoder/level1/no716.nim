import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  a:seq[int] = readLine(stdin).split.map(parseInt)
  diff:seq[int] = @[]
  maximum:int

maximum = abs(a[n - 1] - a[0])
for i in 0..<(a.len - 1):
  diff.add(a[i + 1] - a[i])

echo min(diff)
echo maximum
