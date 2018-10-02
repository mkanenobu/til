import sequtils, strutils, algorithm, math
# WA

var
  n = readLine(stdin).parseInt
  s:seq[string] = mapIt(0..<n, readLine(stdin))
  maxEyes = 0
  cntEyes = 0
  numOfEyes:seq[int] = mapIt(0..<1000, 0)

for i in s:
  cntEyes = i.count('^')
  numOfEyes[cntEyes] += 1
  if cntEyes > maxEyes:
    maxEyes = cntEyes

numOfEyes = numOfEyes[1..(maxEyes)]
if count(numOfEyes, max(numOfEyes)) > 1:
  numOfEyes.reverse
  echo find(numOfEyes, max(numOfEyes)) + 1
else:
  echo find(numOfEyes, max(numOfEyes)) + 1
