from sequtils import map

var a:seq[int] = @[]

for i in 1..100:
    a.add(i)

echo a.map(proc(x:int):int = x * 3)
