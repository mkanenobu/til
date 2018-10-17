import sequtils, strutils, algorithm, math

var
  r,c: int
  field: seq[string]
  line_s: seq[int] = @[]
  leftEnds: seq[int] = @[]
  rightEnds: seq[int] = @[]

(r, c) = readLine(stdin).split.map(parseInt)
field = mapIt(0..<c, readLine(stdin))

proc main(): string =
  for i,v in field:
    if v.count("*") >= 1:
      if line_s.len >= 2 and i - line_s[^1] != 1:
        return "NO"
      line_s.add(i)
      leftEnds.add(field[i].find('*'))
      rightEnds.add(field[i].rfind('*'))

  if len(leftEnds.deduplicate) >= 2 or len(rightEnds.deduplicate) >= 2:
    return "NO"
  for i in line_s:
    if field[i][leftEnds[0]..rightEnds[0]].count(".") != 0:
      return "NO"
  return "YES"

echo main()
