import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).split.map(parseInt)[0]
  s:seq[string] = @[]

for i in 0..<n:
  s.add(readLine(stdin))

proc main(): string =
  for i in 0..<n:
    if find(s[i], "LOVE") != -1:
      return "YES"
  return "NO"

echo main()
