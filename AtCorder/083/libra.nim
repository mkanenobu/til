import sequtils,strutils
let
    abcd = readLine(stdin).split(" ").map(parseInt)
    left = (abcd[0] + abcd[1])
    right = (abcd[2] + abcd[3])
proc libr():string =
    if left == right:
        return "Balanced"
    elif left > right:
        return "Left"
    elif left < right:
        return "Right"
echo libr()
