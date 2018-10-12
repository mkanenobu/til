import strutils
import sequtils

iterator myCountUp(a,b:int):int =
    var res = a
    while res <= b:
        yield res
        inc(res)

for i in myCountUp(1,7):
    echo i


var
  s = "string"
  a = mapIt(0..<len(s), s[it])

echo a
