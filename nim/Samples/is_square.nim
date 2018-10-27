import sequtils, strutils, algorithm, math

var
  r,c: int
  field: seq[string]
  line_s: seq[int] = @[]
  leftEnd: int
  leftEnds: seq[int] = @[]
  rightEnd: int
  rightEnds: seq[int] = @[]

(r, c) = readLine(stdin).split.map(parseInt)
field = mapIt(0..<r, readLine(stdin))

proc main(): string =
  for i,v in field:
    if v.count("*") >= 1:
      if line_s.len >= 1 and i - line_s[^1] != 1:
        return "NO"
      line_s.add(i)
      leftEnd = field[i].find('*')
      rightEnd = field[i].rfind('*')
      if field[i][leftEnd..rightEnd].count('.') != 0:
        return "NO"
      leftEnds.add(leftEnd)
      rightEnds.add(rightEnd)

  if len(leftEnds.deduplicate) >= 2 or len(rightEnds.deduplicate) >= 2:
    return "NO"
  return "YES"

echo main()
