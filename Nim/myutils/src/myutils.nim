# nim library for contest
# Copyright mkanenobu
import sequtils, strutils, algorithm, typetraits, sets

# Find all items
proc findAll*[T,S](a: T, item: S):seq[int] =
    result = @[]
    for i,v in pairs(a):
        if v == item:
            result.add(i)
    return

proc rfindAll*[T,S](a: T, item: S):seq[int] =
    result = @[]
    for i,v in pairs(a):
        if v == item:
            result.add(i)
    return reversed(result)

## excl for seq
# FIXME: Improve, more faster
proc excl*[T](s: var seq[T]; x: T) =
    var l:seq[int] = @[]
    for i,v in pairs(s):
        if v == x:
            l.add(i)
    for j in reversed(l):
        s.delete(j)

proc excl*[T](s: var seq[T]; other: seq[T]) =
    var o = other
    if T.type.name == "string":
        o.sort(system.cmp)
    else:
        o.sort(system.cmp[T])
    for i in reversed(o):
        excl(s, i)

proc maxIndex*[T](x:openarray[T]):int =
    let value = max(x)
    return find(x, value)

proc minIndex*[T](x:openarray[T]):int =
    let value = min(x)
    return find(x, value)

proc maxIndexAll*[T](x:openarray[T]):seq[int] =
    let value = max(x)
    result = @[]
    for i,v in pairs(x):
        if v == value:
            result.add(i)
    return

proc minIndex*[T](x:openarray[T]):untyped =
    let value = min(x)
    result = @[]
    for i in x:
        if i == value:
            result.add(i)
    return

proc deduplicateFast*[T](x:seq[T]):seq[T] =
    result = @[]
    let s = toSet(x)
    for i in s:
        result.add(i)
    return

proc getInt*():int =
    return readLine(stdin).parseInt

proc getInts*(delimiter = ' '):seq[int] =
    return readLine(stdin).split(delimiter).map(parseInt)

proc getString*():string =
    return $(readLine(stdin))

proc getStrings*(delimiter = ' '):seq[string] =
    return readLine(stdin).split(delimiter)


