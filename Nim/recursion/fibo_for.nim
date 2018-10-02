import strutils,os
var
    a = 0
    b = 1
proc fibo(n:int):int =
    for i in 0..n:
        result = b
        (a,b) = (b, a + b)
    return

echo fibo(commandLineParams()[0].parseInt)
