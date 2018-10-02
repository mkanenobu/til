import sequtils, strutils, math, algorithm

var
  t:seq[int] = sorted(readLine(stdin).split.map(parseInt), cmp[int])

proc main():int =
  if t[0] == t[1] and t[0] == t[2]:
    return 0
  t[0] += t[2] - t[1]
  result += t[2] - t[1]
  if (t[2] - t[0]) mod 2 == 0:
    result += (t[2] - t[0]) div 2
    return
  elif (t[2] - t[0]) mod 2 == 1:
    result += int(ceil(float((t[2]) - t[0]) / 2)) + 1

echo main()
