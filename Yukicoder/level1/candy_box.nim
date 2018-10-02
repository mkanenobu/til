import sequtils, strutils, algorithm

var
    n,m:int
    c:seq[int]
    candies = 0
(n, m) = readLine(stdin).split.map(parseInt)
c = readLine(stdin).split.map(parseInt)

proc main():int =
    for i,v in sorted(c, cmp[int]):
        candies += v
        if candies == m:
            return i + 1
        elif candies > m:
            return i

echo main()
