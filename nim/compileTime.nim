import sequtils, strutils, algorithm, math

static:
  var a {.global.} = @[5, 3, 8, 13, 1, 0, 2]
  sort(a, system.cmp)
  echo a

echo a
const arr = @[5,4,3,2,1].sorted(system.cmp)
echo arr
