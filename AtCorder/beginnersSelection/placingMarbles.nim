import sequtils, strutils

let marbles = readLine(stdin).parseInt
var res = 0
for i in $marbles:
    if i == '1':
        res += 1

echo res
