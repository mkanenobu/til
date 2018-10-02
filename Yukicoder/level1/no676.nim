import sequtils, strutils, algorithm, math

var s:string = readLine(stdin)
s = s.replace('I', '1')
s = s.replace('l', '1')
s = s.replace('O', '0')
s = s.replace('o', '0')
echo s
