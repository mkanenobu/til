import sequtils, strutils, algorithm, math

var
  s:seq[char] = toSeq(readLine(stdin).items)
  t:string = readLine(stdin)
  lastChar:char

proc main(str:seq[char]):string =
  var str = str
  for i in 0..<len(str):
    var s1 = ""
    lastChar = str.pop
    str.insert(lastChar, 0)
    for i in str:
      s1.add(i)
    if s1 == t:
      return "Yes"
  return "No"

echo main(s)
