import sequtils, strutils

# multi return
proc main(x, y: int): tuple[n, m: int] =
  return (x, y)

echo main(1, 2)
echo main(1, 2).n
echo main(1, 2).m
