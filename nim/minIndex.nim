proc minIndex[T](x:openarray[T]):T =
  let value = min(x)
  return find(x, value)

