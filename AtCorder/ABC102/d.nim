import  sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  a:seq[int] = readLine(stdin).split.map(parseInt)
  b,c,d,e:seq[int]
  p,q,r,s:int

if a.len >= 7:
