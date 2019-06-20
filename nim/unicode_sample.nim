import unicode, strutils

type UnicodeString = seq[Rune]

var str: UnicodeString = "こんにちは".toRunes

echo $str
echo str[0..2]
echo str.len

for i in str:
  echo i
