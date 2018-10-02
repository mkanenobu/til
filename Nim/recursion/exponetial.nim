import strutils,math

proc expo(n:int):int =
    if n == 0: return 1
    return n * expo(n - 1)

echo expo(readLine(stdin).parseInt)
