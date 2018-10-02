import sequtils, strutils, algorithm, math

var
  s = readLine(stdin)
  k = readLine(stdin).parseInt
  one: int

proc main():char =
  for i, c in s:
    if c != '1':
      if one >= k:
        return '1'
      return s[i]
    one += 1
  return '1'

echo main()
