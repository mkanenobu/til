import sequtils, strutils, algorithm, math

var
  s:string = readLine(stdin)
  i_char:char
  j_char:char
  i,j:int
(i, j) = readLine(stdin).split.map(parseInt)

i_char = s[i]
j_char = s[j]

s[i] = j_char
s[j] = i_char
echo s
