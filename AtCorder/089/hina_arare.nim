import sequtils,strutils
let
    n = readLine(stdin).parseInt
    s:seq[string] = readLine(stdin).split(" ")
proc main():string =
    if not (s.contains("Y")):
        return "Three"
    return "Four"
echo main()
