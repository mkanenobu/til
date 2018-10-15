import sequtils
proc arrayDiff*(a: seq[int], b: seq[int]): seq[int] =
  if a.len > b.len:
    return a - b
