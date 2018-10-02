import sequtils, strutils

var id = readLine(stdin)

if id[^2..^1] == "ai":
    delete(id, id.len - 1, last = id.len)
    echo id, "AI"
else:
    echo id, "-AI"
