import sequtils, strutils, algorithm, math

var
  a:string = readLine(stdin)
  b:string = readLine(stdin)

proc checker(s:string): bool =
  if isDigit(s):
    if parseInt(s) > 12345:
      return false
    if s.len > 1:
      if s[0] == '0':
        return false
  else:
    return false
  return true

if checker(a) and checker(b):
  echo "OK"
else:
  echo "NG"
