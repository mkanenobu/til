import sequtils, strutils, algorithm

var
    n = readLine(stdin).parseInt
    x = readLine(stdin).split.map(parseInt)

sort(x, cmp[int])

proc main():string =
    var m = x[1] - x[0]
    if m == 0:
        return "NO"
    for i in 1..<n:
        if x[i] - x[i - 1] == m:
            continue
        else:
            return "NO"
    return "YES"

echo main()
