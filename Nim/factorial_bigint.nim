import os
import bigints, strutils

proc fact(n:string):untyped =
    var
        i = 1.initBigInt
        nInt = n.initBigInt
    while nInt != 0:
        i *= nInt
        nInt -= 1
    return i
echo fact(commandLineParams()[0])
