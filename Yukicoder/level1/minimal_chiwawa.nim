import sequtils, strutils

var
    s = readLine(stdin)
    c:seq[int] = @[]
    w:seq[int] = @[]
    res:seq[int] = @[]

proc main():int =
    for i,v in s:
        if v == 'c':
            c.add(i)
        elif v == 'w':
            w.add(i)
    if c.len == 0 or w.len < 2:
        return -1
    for j in c:
        var wNum = filter(w, proc(x:int):bool = x > j)
        if wNum.len < 2: continue
        res.add(wNum[1] - j + 1)

    if res.len == 0:
        return -1
    else:
        return min(res)

echo main()
