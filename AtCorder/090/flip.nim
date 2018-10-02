import sequtils, strutils
var
    input = readLine(stdin).split(" ").map(parseInt)
    n = input[0]
    m = input[1]
    reverseArea = (n - 2) * (m - 2)

proc main(): int =
    if (n == 1) and (m == 1):
        return 1
    elif (n == 1) xor (m == 1):
        return max(n, m) - 2
    else:
        return reverseArea

echo main()
