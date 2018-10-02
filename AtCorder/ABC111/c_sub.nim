import sequtils, strutils, algorithm, math

var
  n = readline(stdin).parseint
  v = readline(stdin).split.map(parseint)
  oddnum:seq[int] = @[]
  oddnumcount:seq[int] = @[]
  evennum:seq[int] = @[]
  evennumcount:seq[int] = @[]
  cnt:int

proc main():int =
  if (v.deduplicate).len == 1:
    return n div 2
  for i in 0..<n:
    if i mod 2 == 1:
      evennum.add(v[i])
    else:
      oddnum.add(v[i])

  for i in oddnum:
    cnt = 0
    for j in oddnum:
      if i == j: cnt += 1
    oddnumcount.add(cnt)
  for i in evennum:
    cnt = 0
    for j in evennum:
      if i == j: cnt += 1
    evennumcount.add(cnt)
  return (n div 2) - max(oddnumcount) + (n div 2) - max(evennumcount)

echo main()
