
type refInt = ref int
let a = new refInt

echo a[]  # -> 0
proc inc(n: refInt) = inc n[]
inc(a)
echo a[]  # -> 1

var i = 0
proc incI(n: var int) =
  n += 1

echo i # -> 0
incI(i)
echo i # -> 1
