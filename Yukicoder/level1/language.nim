import strutils

var
    n = readLine(stdin).parseInt
    s:seq[string] = readLine(stdin).split
    t:seq[string] = readLine(stdin).split

for i in 0..<n:
    if s[i] != t[i]:
        echo i + 1
        echo s[i]
        echo t[i]
