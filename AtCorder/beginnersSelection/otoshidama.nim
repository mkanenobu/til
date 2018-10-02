import sequtils, strutils

var n,y:int
(n,y) = readLine(stdin).split.map(parseInt)

proc main():string =
    for i in 0..n:
        for j in 0..n:
            var k = n - (i + j)
            if k < 0:
                continue
            if (10000 * i) + (5000 * j) + (1000 * k) == y:
               return $i & " " & $j & " " & $k
            elif i + j + k > n:
               return "-1 -1 -1"
    return "-1 -1 -1"

echo main()
