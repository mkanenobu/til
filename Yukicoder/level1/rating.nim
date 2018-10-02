import strutils, sequtils
let s = readLine(stdin).split.map(parseInt)
var res = s[1] - s[0]
if res > 0:
    echo "+",res
else:
    echo res
