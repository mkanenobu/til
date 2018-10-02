import sequtils, strutils, algorithm, math

var n = readLine(stdin).parseInt

proc main():string =
    if n == 3:
        return "7"
    elif n mod 2 == 0:
        return ("1".repeat(n div 2))
    else:
        return ("7" & "1".repeat((n div 2) - 1))

echo main()
