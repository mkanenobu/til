import sequtils, strutils, sets

proc create_ngram(s: openArray[string] or string, n: int): HashSet[seq[char]] =
  var res: seq[seq[char]]
  for i in 0..(s.len - n):
    res.add(@[])
    for j in 0..<n:
      res[i].add(@[s[j + (i)]])
  return res.toHashSet

let
  s1 = "paraparaparadise"
  s2 = "paragraph"
  x = create_ngram(s1, 2)
  y = create_ngram(s2, 2)

echo x + y
echo x * y
echo x - y

echo x.contains(@['s', 'e'])
echo y.contains(@['s', 'e'])
