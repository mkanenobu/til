import strutils, math

# String
var
  str = "strings"
  # encode
  hexStr = toHex(str)

echo hexStr
# decode
echo parseHexStr(hexStr)


# Int
var
  n = 13
  # encode
  hexNum: string = toHex(n)
  octNum: string = toOct(n, 10)
  binNum: string = toBin(n, 10)

echo hexNum
echo octNum
echo binNum

# decode
echo parseHexInt(hexNum)
echo parseOctInt(octNum)
echo parseBinInt(binNum)
