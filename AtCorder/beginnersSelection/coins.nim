import sequtils, strutils
let
    a = readLine(stdin).parseInt
    b = readLine(stdin).parseInt
    c = readLine(stdin).parseInt
    x = readLine(stdin).parseInt

proc main():int =
    for i in 0..a:
        for j in 0..b:
            for k in 0..c:
                if i == 0 and j == 0 and k == 0:
                    continue
                if x == ((i * 500) + (j * 100) + (k * 50)):
                    result += 1

echo main()
