import sequtils, strutils
proc count[T](s: openArray[T], x: T): int =
    for itm in items(s):
        if itm == x:
            inc result
var
    plus:seq[string] = @[]
    minus:seq[string] = @[]
    res:seq[int] = @[]

let n = readLine(stdin).parseInt
for i in 1..n:
    plus.add(readLine(stdin))

let m = readLine(stdin).parseInt
for i in 1..m:
    minus.add(readLine(stdin))

for str in plus:
    res.add(count(plus, str) - count(minus, str))

echo max(0, max(res))
