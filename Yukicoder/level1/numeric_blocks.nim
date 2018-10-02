import sequtils, strutils, algorithm

var
    l = readLine(stdin).parseInt
    n = readLine(stdin).parseInt
    w:seq[int] = readLine(stdin).split.map(parseInt)
    width:int

sort(w, cmp[int])
proc main():int =
    for i,v in w:
        width += v
        if width > l:
            return i
    return n

echo main()
