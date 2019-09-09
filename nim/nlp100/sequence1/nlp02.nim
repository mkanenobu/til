import strutils, unicode

var
  s1 = "パトカー".toRunes
  s2 = "タクシー".toRunes
  result: string

for i in 0..<4:
  result &= s1[i]
  result &= s2[i]

echo result

