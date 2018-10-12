import sequtils, strutils, algorithm

var
  a:tuple[index:int, value:int]
  b:seq[tuple[index:int, value:int]] = @[]

# tupleの代入は括弧が必要
a = (index:12, value:11)
b.add((index:3, value:15))
b.add((4, 11))
b.add((1, 31))

echo b
for i in b:
    echo "index: ", i.index," value: ", i.value

# simplest sort
echo "sorted by value"
echo b.sortedByIt(it.value)

# or

b.sort(proc(x,y:tuple[index:int,value:int]):int =
    result = cmp(x.index, y.index))

echo "Sorted by index"
for i in b:
    echo "index: ", i.index," value: ", i.value

b.sort(proc(x,y:tuple[index:int,value:int]):int =
    result = cmp(x.value, y.value))

echo "Sorted by value"
for i in b:
    echo "index: ", i.index," value: ", i.value
