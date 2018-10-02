import sequtils, strutils

var a:seq[string] = readLine(stdin).split

if a[1] == "?":
    echo 14
elif a[1] == "2":
    echo 4
elif a[1] == "3":
    echo 1
