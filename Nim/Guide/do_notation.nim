import strutils, sequtils

var
    s = readLine(stdin)
    res:seq[char] = toSeq(s.items)

res = res.map do (x:char) -> char:
    if isLowerAscii(x):
        toUpperAscii(x)
    else:
        toLowerAscii(x)

echo join(res)
