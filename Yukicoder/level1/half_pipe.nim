import sequtils, strutils, algorithm

var
    s = readLine(stdin).split.map(parseFloat)
    avg:float
    res:string

sort(s, cmp[float])
for i in 1..<(len(s) - 1):
    avg += s[i]

res = $(avg / toFloat(s.len - 2))

if res.split(".")[1].len == 1:
    res &= "0"

echo res
