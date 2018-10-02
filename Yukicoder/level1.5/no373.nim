import sequtils, strutils, algorithm, math

var
  a, b, c, d:int
(a,b,c,d) = readLine(stdin).split.map(parseInt)

a = a mod d
b = b mod d
c = c mod d

echo ((a * b) mod d) * c mod d
