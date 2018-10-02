import sequtils, strutils, algorithm

var
    n = readLine(stdin).parseInt
    x:seq[int] = readLine(stdin).split.map(parseInt)
    res:seq[int] = @[]

x = sorted(deduplicate(x), cmp[int])

if x.len < 2:
    echo 0
else:
    for i in 1..<x.len:
        res.add(abs(x[i] - x[i - 1]))
    echo min(res)
