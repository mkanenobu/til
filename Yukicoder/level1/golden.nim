import sequtils, strutils

var
    c1 = readLine(stdin)
    c2 = readLine(stdin)
    s = c1 & c2
    res:seq[int] = @[]

for j in s.split("x"):
    res.add(count(j, 'o'))

echo max(res)
