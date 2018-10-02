import sequtils, strutils

let n = readLine(stdin).parseInt
var d:seq[int] = @[]
for i in 0..<n:
    d.add(readLine(stdin).parseInt)

echo len(deduplicate(d))
