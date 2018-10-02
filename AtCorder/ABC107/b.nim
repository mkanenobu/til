import sequtils, strutils, algorithm, math

var
  h, w:int
  a:seq[string] = @[]
  prev_a:seq[string]
  yoko_delete_list:seq[int] = @[]
  tate_delete_list:seq[int] = @[]
  str = ""
  cat = ""

(h, w) = readLine(stdin).split.map(parseInt)
for i in 0..<h:
  a.add(readLine(stdin))
proc yoko() =
  for i in 0..<w:
    if not a[i].contains('#'):
      yoko_delete_list.add(i)

  if yoko_delete_list.len > 0: reverse(yoko_delete_list)
  w -= len(yoko_delete_list)
  for j in yoko_delete_list:
    a.delete(j)
  yoko_delete_list = @[]

proc tate() =
  for i in 0..<(a[0].len):
    for j in 0..<a.len:
      str.add(a[j][i])
    if not str.contains('#'):
      tate_delete_list.add(i)
    str = ""

  if tate_delete_list.len > 0: reverse(tate_delete_list)
  h -= len(tate_delete_list)
  for k in tate_delete_list:
    for j in 0..<a.len:
      a[j].delete(k, k)
  tate_delete_list = @[]

for i in a:
  cat.add(i)

if count(cat, '#') == 1:
  echo "#"
else:
  while true:
    prev_a = a
    yoko()
    tate()
    if prev_a == a:
      break
  for i in a:
    echo i
