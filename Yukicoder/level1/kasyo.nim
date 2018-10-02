import sequtils, strutils

var
    n = readLine(stdin).parseInt
    l = readLine(stdin).split.map(parseInt)
    ans:seq[int] = @[]

for i in 1..6:
    ans.add(count(l, i))

proc main():int =
    for j in countdown(5,0):
        if ans[j] == max(ans):
            return j + 1

echo main()
