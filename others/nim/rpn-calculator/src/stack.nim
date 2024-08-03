import std/options

type
  Stack*[T] = ref object
    data*: seq[T]

proc newStack*[T](): Stack[T] =
  return new(Stack[T])

proc push*[T](s: Stack[T], x: T) =
  s.data.add(x)

proc pop*[T](s: Stack[T]): Option[T] =
  if s.data.len == 0:
    return none(T)
  return some(s.data.pop())

proc peak*[T](s: Stack[T]): Option[T] =
  if s.data.len == 0:
    return none(T)
  return some(s.data[s.data.len - 1])

proc len*[T](s: Stack[T]): int =
  return s.data.len
