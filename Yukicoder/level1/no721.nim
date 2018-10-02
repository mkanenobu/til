import sequtils, strutils, algorithm, math, times

var
  s = readLine(stdin)
  today:DateTime = parse(s, "yyyy/MM/dd")
  twoDaysAgo:string = format((today + days(2)), "yyyy/MM/dd")

echo twoDaysAgo
