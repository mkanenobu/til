import sequtils, strutils, math

# 愚直解
var
    n = readLine(stdin).parseInt
    a:seq[int] = @[0]
    list:seq[int]
    res:int
a.add(readLine(stdin).split.map(parseInt))
 
for i in 1..n:
    res = 0
    list = a
    list.delete(i)
    for j in 1..<n:
        res += abs(list[j - 1] - list[j])
        if j == n - 1:
            res += abs(list[j])
            echo res
            break
