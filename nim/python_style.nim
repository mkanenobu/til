import sugar

var
  arr = (var x: seq[int] = @[]; for i in 0..10: x.add(i); x)

echo arr
