import strutils

var s = readline(stdin)

proc main():int =
    for i in s:
        var n = parseint($i)
        if n == 0:
            result += 10
        else:
            result += n

echo main()
