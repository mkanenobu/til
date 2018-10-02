import  sequtils, strutils, algorithm, math

var
  t = readLine(stdin).parseInt
  input:seq[seq[int]] = @[]
  a,b,c,d:int

for i in 0..<t:
  input.add(readLine(stdin).split.map(parseInt))

for i in 0..<t:
  (a,b,c,d) = input[i]
  if a < b or d < b or a == c * 2:
    echo "No"
  elif c <= b and d >= b and a mod b <= c and (c + d) mod b != 0:
    echo "Yes"
  else:
    echo "No"

