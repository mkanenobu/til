import sequtils, strutils, algorithm, math
import strformat

var
  n = readLine(stdin).parseInt
  nums = [1..(n ^ 2)]
  res = newSeqWith(n, newSeq[int](3))


