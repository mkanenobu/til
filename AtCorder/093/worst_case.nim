import strutils, sequtils, algorithm, math
# not complete

var
  q = readLine(stdin).parseInt
  a = newSeq[int](q)
  b = newSeq[int](q)
  res = newSeq[int](q)
  cache:seq[int] = @[]
  point:int
for i in 0..<q:
  (a[i], b[i]) = readLine(stdin).split.map(parseInt)

proc main():seq[int] =
  for i in 0..<q:
    point = a[i] * b[i] - 1
    for j in 1..(int(ceil(sqrt(float(point))))):
      var p = point div j
      if p < j: break
      if p.in(cache) or (p == a[i] and p == b[i]):
        continue
      elif not p.in([a[i], b[i]]):
        res[i] += 2
      elif p.in([a[i], b[i]]):
        res[i] += 1
      cache.add(p)
    cache = @[]
  result = res

for i in main():
  echo i
