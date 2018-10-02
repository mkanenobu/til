import sequtils, strutils, math

var
    x = readLine(stdin).parseInt
    y = readLine(stdin).parseInt
    l = readLine(stdin).parseInt

proc main():int =
    result += int(ceil(x.abs / l) + ceil(y.abs / l))
    if x == 0:
        if y > 0:
            return
        elif y < 0:
            return result + 2
    elif y == 0:
        return result + 1
    elif x > 0:
        if y > 0:
            return result + 1
        elif y < 0:
            return result + 2
    elif x < 0:
        if y > 0:
            return result + 1
        elif y < 0:
            return result + 2

echo main()
