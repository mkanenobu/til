import typeinfo, sugar

proc `<<`*[T](arr: var seq[T], elem: T) = arr.add(elem)
proc `<<`*(target: var string, p: char or string) = target &= p
proc `||=`*[T](target: var T, init: T) =
  if target.isNil: target = init

proc `&.`*[T](receiver: T, f: proc(x: T,  y: varargs) -> T): T =
  if receiver.isNil:
    return nil
  else:
    receiver.f

