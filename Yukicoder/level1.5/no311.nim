import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseBiggestInt
  m15, m5, m3: int64
m15 = n div 15
m5 = n div 5 - m15
m3 = n div 3 - m15

echo m15 * 4 + (m5 + m3) * 2
