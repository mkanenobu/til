import sequtils, strutils, algorithm

var
    n = readLine(stdin)
    a:seq[int] = readLine(stdin).split.map(parseInt)
    alice = 0
    bob = 0
sort(a, system.cmp[int])
for i,v in reversed(a):
    if i mod 2 == 0:
        alice += v
    else:
        bob += v

echo alice - bob
