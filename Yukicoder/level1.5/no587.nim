import sequtils, strutils, algorithm, math

var
  s: string = readLine(stdin)
  twoPair:int
  reach:seq[char] = @[]

proc main(): string =
  for i in s:
    if s.count(i) == 2:
      twoPair += 1
    elif s.count(i) == 1:
      reach.add(i)
    else:
      return "Impossible"
  if twoPair != 12:
    return "Impossible"
  return $reach[0]

echo main()
