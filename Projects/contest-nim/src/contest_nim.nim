# contest_nim
# Copyright mkanenobu
# Library for contest

proc isOdd*(x: SomeInteger): bool =
  if x mod 2 == 0:
    return true
  else:
    return false

proc isEven*(x: SomeInteger): bool =
  if isOdd x:
    return false
  else:
    return true

proc median*[T](x: openArray[SomeNumber]): float =
  let
    length = x.len
    middleOfX = length div 2
  if length mod 2 == 1:
    return float(x[middleOfX])
  else:
    return (x[middleOfX] + x[middleOfX + 1]) / 2
