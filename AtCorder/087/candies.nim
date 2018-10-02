import sequtils,strutils
var
    n:int = readLine(stdin).parseInt
    a1:seq[int] = readLine(stdin).split(" ").map(parseInt)
    a2:seq[int] = readLine(stdin).split(" ").map(parseInt)
    candySum:seq[int] = @[]
proc candies():int =
    for i in 1..n:
        var candy:int = 0
        for i2 in 0..<n:
            if i2 == (i - 1):
                candy += a2[i - 1]
            if i2 >= i:
                candy += a2[i2]
            else:
                candy += a1[i2]
            candySum.add(candy)
    return max(candySum)

echo candies()
