import strutils, os, sequtils, math

var inputNumber:int = commandLineParams()[0].parseInt

proc prime_test(): string =
    for i in 2..(inputNumber-1):
        if (inputNumber mod i == 0):
            return $inputNumber & " is not prime number"
        elif toFloat(i) >= sqrt(inputNumber.toFloat):
            return $inputNumber & " is prime number!"

echo prime_test()
