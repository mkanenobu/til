import strutils, sequtils

var s:string = readLine(stdin)
s = s.replace("-", "")
echo count(s, "min")
