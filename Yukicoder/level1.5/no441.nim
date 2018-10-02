import sequtils, strutils, algorithm, math

var
  a, b: int
  input = readLine(stdin).split
  a_pre = input[0]
  b_pre = input[1]

if a_pre.len > 16:
  a = parseInt(a_pre[0..8])
else:
  a = parseInt(a_pre)

if b_pre.len > 16:
  b = parseInt(b_pre[0..8])
else:
  b = parseInt(b_pre)

if a == 0 and b == 0:
  echo "E"
elif a == 2 and b == 2:
  echo "E"
elif a == 0 or b == 0:
  echo "S"
elif a == 1 or b == 1:
  echo "S"
else:
  echo "P"
