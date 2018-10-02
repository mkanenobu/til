import sequtils,strutils,os
proc main(n:int):int =
    var
        a:int = 0
        b:int = 1
    if n == 0: return 0
    else:
        for i in 1..<n:
            (a, b) = (b, a + b)
        return b

echo main(commandLineParams()[0].parseInt)
