import sequtils, strutils
var
    s:string = readline(stdin)
    words = @["eraser", "erase", "dreamer", "dream"]

for i in words:
    s = s.replace(i, "")

if s.len == 0: echo "YES"
else: echo "NO"
