import strutils, os, sequtils, math

var
    #inputNumber: int = readLine(stdin).parseInt
    inputNumber: int = commandLineParams()[0].parseInt

proc prime_test() {.discardable.} =
    for i in 2..(inputNumber-1):
        if (inputNumber mod i == 0):
            echo inputNumber, " is not prime number"
            break
        elif toFloat(i) >= sqrt(inputNumber.toFloat):
            echo inputNumber, " is prime number!"
            break
prime_test()
