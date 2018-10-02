import sequtils, strutils
let
    s:seq[char] = toSeq(readLine(stdin).items)
    xy = readLine(stdin)
    x = xy[0]
    y = xy[1]
    location:array[1..8000, array[1..8000, int]]
for i in s:
    if i == 'F':
