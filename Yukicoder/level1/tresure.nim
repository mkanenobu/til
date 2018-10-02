import sequtils, strutils, math

var
    s:string = readLine(stdin)
    x,y:int

y += count(s, 'N')
x += count(s, 'E')
x -= count(s, 'W')
y -= count(s, 'S')

echo sqrt(float((x * x) + (y * y)))
