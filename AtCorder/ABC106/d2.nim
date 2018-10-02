import sequtils, strutils, algorithm, math

let
  input = readLine(stdin).split.map(parseInt)
  n = input[0]
  m = input[1]
  q = input[2]
var
  lr_tmp:seq[int]
  lr:seq[seq[int]] = newSeqWith(m, newSeq[int](n))
  pq:seq[seq[int]] = @[]

for i in 0..<m:
  lr_tmp = readLine(stdin).split.map(parseInt)
  lr[lr_tmp[0] - 1][lr_tmp[1] - 1] += 1

for i in 0..<q:
  pq.add(readLine(stdin).split.map(parseInt))

# for i in 0..<q:
echo lr

