import times

proc tak(x, y, z: int64): int64 =
  if x <= y:
    return y
  else:
    return tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y))


var
  x, y, z, res: int64
  bTime = epochTime()
x = 12
y = 6
z = 0

res = tak(x, y, z)
echo epochTime() - bTime
echo res
