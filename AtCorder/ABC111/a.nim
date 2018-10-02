import sequtils, strutils, algorithm, math

var s:string = readLine(stdin)
s = s.replace("9", "5")
s = s.replace("1", "9")
echo s.replace("5", "1")
