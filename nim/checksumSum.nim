import sequtils, strutils, md5

let
  str = readLine(stdin)
  checksum = $(toMD5(str))
var
  res:int = 0

for i in checksum:
  res += parseHexInt($i)

echo res
