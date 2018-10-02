import strutils
let n = readLine(stdin).parseInt
var s = ""
for i in 0..<n:
    s = s & readLine(stdin)

echo s
