import  sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  s = readLine(stdin)
  turning:seq[int] = @[]
  t = 0
  wCount = count(s, 'W')
  ecount = count(s, 'E')

for i in 0..n:
  t = 0
  t += count(s[0..(i - 1)], 'W')
  t += count(s[(i + 1)..(s.len)], 'E')
  turning.add(t)

echo min(turning)
