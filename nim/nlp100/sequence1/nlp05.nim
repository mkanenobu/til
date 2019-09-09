import sequtils, strutils

proc create_ngram(s: openArray[string] or string, n: int): seq[seq[string]] =
  for i in 0..(s.len - n):
    result.add(@[])
    for j in 0..<n:
      result[i].add(@[$s[j + (i)]])

echo create_ngram("string", 3)
echo create_ngram("I am an NLPer", 2)
