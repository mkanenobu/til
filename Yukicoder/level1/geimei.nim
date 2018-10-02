import sequtils, strutils

var
    input = readLine(stdin).split
    s: string
    t, u: int

s = input[0]
t = input[1].parseInt
u = input[2].parseInt


proc main():string =
    s.delete(max(t, u), max(t, u))
    if t == u:
        return s
    s.delete(min(t, u), min(t, u))
    return s

echo main()
