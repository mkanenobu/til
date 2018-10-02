import strutils
var
    a = readLine(stdin).parseInt
    b = readLine(stdin).parseInt
    c = readLine(stdin).parseInt
    x = readLine(stdin).parseInt
proc coin():int =
    for i in 0..a:
        for i2 in 0..b:
            for i3 in 0..c:
                if (500 * i) + (100 * i2) + (50 * i3) == x:
                    result += 1

echo coin()
