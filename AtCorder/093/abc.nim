import sequtils, strutils

var s = readLine(stdin)

proc main():string =
  if not(s.count('a') == 1):
    return "No"
  elif not(s.count('b') == 1):
    return "No"
  elif not(s.count('c') == 1):
    return "No"
  else: return "Yes"

echo main()
