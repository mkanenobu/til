import strutils, sequtils, math, algorithm

var
  l = readLine(stdin).parseInt
  n = readLine(stdin).parseInt
  s:seq[string] = readLine(stdin).split
  length = l - s[0].len
  variation = 2 ^ length

echo s.len * variation
