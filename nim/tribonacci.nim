import sequtils,strutils,os
proc tri(n:int):int =
    if n == 0:return 0
    elif n == 1: return 0
    elif n == 2: return 1
    return tri(n - 1) + tri(n - 2) + tri(n - 3)

while true:
    var input:int = readLine(stdin).parseInt
    echo tri(input)
