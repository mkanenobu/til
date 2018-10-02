import sequtils, strutils

var
    s = readLine(stdin)
    res = ""

for i in 1..len(s):
    var charInt = int(s[i - 1]) - i
    while charInt < 65:
        charInt += 26
    res.add(char(charInt))

echo res
