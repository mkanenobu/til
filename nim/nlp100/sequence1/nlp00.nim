import strutils
var
  s = "stressed"
  result: string

for i in s:
  result = i & result

echo result

