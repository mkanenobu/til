import strutils
let
    ab:seq[string] = readLine(stdin).split(" ")
    a = ab[0].parseInt
    b = ab[1].parseInt

proc main(): int =
    for i in a..b:
        var n = $i
        if (n[0] == n[^1]) and (n[1] == n[^2]):
            result += 1
    return

echo main()
