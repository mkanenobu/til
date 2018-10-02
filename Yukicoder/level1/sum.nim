import strutils

let n = readLine(stdin).parseInt
var res = 0
for i in 1..n:
    res += i

echo res
