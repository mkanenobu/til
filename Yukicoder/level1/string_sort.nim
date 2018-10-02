import strutils

var
    a = readLine(stdin)
    b = readLine(stdin)

proc main():string =
    for i in a:
        if count(a, i) == count(b, i):
            continue
        else:
            return "NO"
    return "YES"

echo main()
