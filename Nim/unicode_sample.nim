import unicode,strutils
var str:seq[Rune] = "こんにちは".toRunes
echo $str
echo str[0..2]
echo str.len
