import strutils

var s = readLine(stdin)

echo min(@[count(s, "t"), count(s, "r"), (count(s, "e") div 2)])
