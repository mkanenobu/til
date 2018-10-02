import sequtils, strutils, algorithm, math

var s:string = readLine(stdin)

proc main():string =
  for i in s:
    if s.count(i) > 1:
      return "NO"
  return "YES"

echo main()
