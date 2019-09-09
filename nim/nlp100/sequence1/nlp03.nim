import strutils

var
  s = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."
  result: seq[int]

for word in s.split:
  result.add(word.len)

echo result
