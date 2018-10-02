import  sequtils, strutils, algorithm, math

var
  s = @["a", "b"]
  str = ""
for i in s:
  str.add(i)
  echo str
