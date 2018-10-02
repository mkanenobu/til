import sequtils, strutils, algorithm, math
# 途中

var
  t = readLine(stdin).parseInt
  s:seq[string] = @[]
  trn_num:int
  trn1:seq[int] = @[]
  trn2:seq[int] = @[]
  cnt:int

for i in 0..<t:
  s.add(readLine(stdin))

proc main(n:string):int =
  for i in n:
    trn2.add(i)
  cnt = n.len
  while len(trn2) != 1:
    for i in 1..<cnt:
      trn_num = parseInt($(n[i - 1])) + parseInt($n[i])
      if trn_num >= 10:
        trn_num = 1 + trn_num - 10
      trn1.add(trn_num)
      trn2 = trn1
      trn1 = @[]
      cnt -= 1

for i in s:
  echo main(i)
