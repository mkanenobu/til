
proc tarai(x, y, z: int): int =
  if x <= y:
    return y
  else:
    return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))

echo tarai(12, 6, 0)
