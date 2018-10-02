import sequtils

var t = @[1,2,3,4,5]

echo filter(t, proc(x:int):bool = x <= 3)
