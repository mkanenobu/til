import sequtils, strutils

# seq[int] to seq[string]
var tInt = @[4,14,55]
echo tInt.map(proc(x:int):string = $x)

# seq[string] to seq[int]
var t = @["1", "2", "7"]
echo t.map(parseInt)

# seq[string] to string
var s = @["Hello", ",", "World", "!"]
echo join(s)

# string to seq[char]
var c = "abc"
echo toSeq(c.items)

