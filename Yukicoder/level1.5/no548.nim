import sequtils, strutils, algorithm, math

let
  s:string = readLine(stdin)
var
  chars:string = "abcdefghijklm"
  cnt:int
  pair:seq[char] = @[]

proc main(): string =
  for i in s:
    if not contains(chars, i):
      return "Impossible"
    cnt = s.count(i)
    if cnt == 1:
      continue
    elif cnt == 2:
      pair.add(i)
    elif cnt > 2:
      return "Impossible"
    else:
      return "Impossible"

  if pair.len == 2:
    for i in s:
      chars = chars.replace($i, "")
    return chars
  elif pair.len == 0:
    return chars
  else:
    return "Impossible"

let res = main()
if res != "Impossible":
  for i in res:
    echo i
else:
  echo res
