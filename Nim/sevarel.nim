var
    x: seq[int] = @[12,5,8]
    y: string = "foo"
    ans: string = ""
echo "x = ",x
if 12 in x:
    echo "12 is inside in x"
x.add(20)

for i in x:
    echo i

echo y
y.add("bar")
echo y
for i in y:
    echo i
    ans.add(i)
echo ans
