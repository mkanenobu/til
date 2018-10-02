import sequtils, strutils
var
    a = readLine(stdin).split('.').map(parseInt)
    b = readLine(stdin).split('.').map(parseInt)

proc main():string =
    for i in 0..2:
        if a[i] > b[i]:
            return "YES"
        elif a[i] == b[i]:
            continue
        elif a[i] < b[i]:
            return "NO"
    return "YES"

echo main()
