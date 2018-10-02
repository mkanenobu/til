import strutils, sequtils
var
    s,f:int
(s, f) = readLine(stdin).split.map(parseInt)

echo (s div f) + 1
