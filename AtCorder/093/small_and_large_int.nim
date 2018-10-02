import sequtils, strutils

var
  a,b,k:int
(a,b,k) = readLine(stdin).split.map(parseInt)


proc main() =
  if k * 2 > b - a:
    for k in a..b:
      echo k
    return
  for i in a..(a + (k - 1)):
    echo i
  for j in (b - (k - 1))..b:
    echo j

main()
