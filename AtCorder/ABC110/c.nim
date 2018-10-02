import sequtils, strutils, algorithm, math

let
  s_org:string = readLine(stdin)
  t_org:string = readLine(stdin)
var
  s = s_org
  t = t_org
  s_count:seq[int] = @[]
  t_count:seq[int] = @[]

for i,v in s:
  s_count.add(s.count(v))
  s = s.replace($v)

for j,w in t:
  t_count.add(t.count(w))
  t = t.replace($w)

if s_count.sorted(cmp[int]) == t_count.sorted(cmp[int]):
  echo "Yes"
else:
  echo "No"
