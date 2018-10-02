import strutils, algorithm
var
    s:string = readLine(stdin)
    res = ""
for i in reversed(s):
    if i == '>':
        res &= '<'
    else:
        res &= '>'

echo res
