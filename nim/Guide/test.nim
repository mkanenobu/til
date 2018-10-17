import sequtils, strutils, algorithm, math

var a = toSeq('a'..'z')

for i,v in a:
  echo i

echo ""
echo a.len
