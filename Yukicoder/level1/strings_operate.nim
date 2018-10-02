import sequtils, strutils

var
    n:int = readLine(stdin).parseInt
    s:string = readLine(stdin)
    t:string = readLine(stdin)
    res:int

for i in 0..<n:
    if s[i] != t[i]:
        res += 1

echo res
