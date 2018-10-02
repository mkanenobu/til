import sequtils, strutils
let input = readLine(stdin).split(" ").map(parseInt)
var
    n = input[0]
    k = input[1]

# bを固定して考える
proc main(): int =
    if k == 0: return n * n
    for b in k..n:
        #var
            #m = n mod b
            #p = n div b
            #s = p * (b - k)
            #s = (n div b) * (b - k)
            #t = max(0, m - (k - 1))
            #t = max(0, (n mod b) - (k - 1))
        #result += (s + t)
        result += ((n div b) * (b - k)) + max(0, (n mod b) - (k - 1))

echo main()
