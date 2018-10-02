import strutils,os

proc fibo(n:int):int =
    if n == 0: return 0
    elif n == 1: return 1
    echo fibo(n - 1) + fibo(n - 2)

echo fibo(commandLineParams()[0].parseInt)
