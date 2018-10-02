import sequtils, strutils
let input = readLine(stdin).split(" ").map(parseInt)
var
    n = input[0]
    k = input[1]

# bを固定して考える
proc main(): int =
    if k == 0: return n * n
    for b in k..n:
        var
            remain = b mod k


echo main()
