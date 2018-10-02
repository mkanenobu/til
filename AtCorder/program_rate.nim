import strutils, sequtils, algorithm
var
    NK: seq[int] = stdin.readLine.split(" ").map(parseInt)
#    N: int = NK[0]
#    K: int = NK[1]
    rate_input: seq[float] = stdin.readLine.split(" ").map(parseFloat)
sort(rate_input, system.cmp[float])
reverse(rate_input)
proc rate(): float =
    result = 0
    for i in countdown(min(NK)-1,0):
        result = (result + rate_input[i]) / 2
    return
echo rate()
