import sequtils, strutils, algorithm
# WA

var
    n,k,e,target:int
    nk = readLine(stdin).split.map(parseInt)
    s = readLine(stdin)
    rev:bool

(n,k) = nk

if k > int(len(s) / 2):
    reverse(s)
    k = s.len - k + 1
    rev = true

proc main():seq[int] =
    result = @[]
    for i in 0..<s.len:
        if i == k - 1:
            target = e
        if s[i] == '(':
            e += 1
        elif s[i] == ')':
            e -= 1
        if e == target:
            result.add(i)

if rev == true: echo len(s) - max(main())
else: echo max(main()) + 1
