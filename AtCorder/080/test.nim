import sequtils,strutils,random
#var
#    s:seq[int] = readLine(stdin).split(" ").map(parseInt)
#    a:seq[int]
#for i in 1..<len(s):
#    echo s[i]
#    a.add(s[i])
randomize()
for i in 0..10:
    echo random([1,-1])
