import sequtils, strutils

var
    n = readLine(stdin).parseInt
    xy:seq[seq[int]] = @[]
    res:seq[int] = @[]

for i in 0..<n:
    xy.add(readLine(stdin).split.map(parseInt))

proc main():int =
    for j in xy:
        if j[0] >= j[1]:
            return -1
        else:
            res.add(j[1] - j[0])
    if len(deduplicate(res)) != 1:
        return -1
    else:
        return res[0]

echo main()
