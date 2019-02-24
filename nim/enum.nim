
type Speed = enum
  slow,
  normal,
  fast

proc returnSpeed(n: int): Speed =
  if n == 0:
    return slow
  elif n == 1:
    return normal
  elif n >= 2:
    return fast
  else:
    raise newException(Exception, "invalid parameter")

echo returnSpeed(1)
