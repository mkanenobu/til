import sequtils, strutils, algorithm, math

proc odds(n: int): seq[int] =
  toSeq(0..<n).filterIt(it mod 2 != 0)

echo odds(10)
