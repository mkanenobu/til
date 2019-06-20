import unicode

type
  IntSeq = seq[int]

var s: IntSeq = @[1,2,3]

for i in s:
  echo i
