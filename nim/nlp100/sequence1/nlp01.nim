import unicode

var
  s = "パタトクカシーー".toRunes
  result: string

for i, v in s.pairs:
  if i mod 2 == 1:
    result &= v

echo result
