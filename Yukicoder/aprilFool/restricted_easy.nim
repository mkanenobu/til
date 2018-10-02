import sequtils, strutils, math, algorithm

let
    t = readLine(stdin).parseInt
    zero = low(Natural)
    one = low(Positive)
    two = low(Positive) + low(Positive)
    bigNum = parseInt($one & $zero & $zero & $zero & $zero & $zero & $zero & $zero & $zero & $(two + two + two + one))
var
    n:seq[int] = @[]
    first = two
    second = one

for i in low(Natural)..<t:
    n.add(readLine(stdin).parseInt)

proc main(num:int):int =
    for i in zero..num:
        (first, second) = (second, first + second)
        return second
        #if num == zero:
        #    return two
        #elif num == one:
        #    return one
        #else:
        #    return second

for i in n:
    echo main(i) mod bigNum

