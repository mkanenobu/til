import strutils, sequtils, algorithm
var
    K: int = (stdin.readLine.split(" ").map(parseInt))[1]
    rate_input: seq[float] = stdin.readLine.split(" ").map(parseFloat)
    cpRate_input = rate_input
    rate: seq[float] = @[]
sort(rate_input, system.cmp[float])
for a in cpRate_input:
    if K == rate_input.len:
        K = 0
    for t in K..rate_input.len-1:
        var b = rate_input[t]
        if a == b and (b in rate):
            rate.add(a)
sort(rate, system.cmp[float])
proc maxrate(): float =
    for i in 0..rate.len-1:
        result = (result + rate[i]) / 2
    return
echo maxrate()

