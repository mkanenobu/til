import sequtils, strutils, algorithm, math
# TLE

var
  input = readLine(stdin).split.map(parseInt)
  n = input[0]
  m = input[1]
  question = input[2]
  lr:seq[seq[int]] = @[]
  lr_tmp:seq[seq[int]]
  pq:seq[seq[int]] = @[]

for i in 0..<m:
  lr.add(readLine(stdin).split.map(parseInt))
for i in 0..<question:
  pq.add(readLine(stdin).split.map(parseInt))

for i in 0..<question:
  lr_tmp = filter(lr, proc(x:seq[int]):bool = (x[0] >= pq[i][0] and x[1] <= pq[i][1]))
  echo len(lr_tmp)
