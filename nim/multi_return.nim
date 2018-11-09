import sequtils, strutils

proc main(x, y: int): tuple[n, m: int] =
  return (x, y)

echo main(1, 2)
