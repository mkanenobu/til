import sequtils, strutils, algorithm, math

var
  a, b:int
  anzan_flg:bool = true
(a, b) = readLine(stdin).split.map(parseInt)

for i,v in $(a.abs):
  if i == 0: continue
  if v != '0':
    anzan_flg = false

for i,v in $(b.abs):
  if i == 0: continue
  if v != '0':
    anzan_flg = false

if a.abs <= 10 or b.abs <= 10:
  anzan_flg = false

proc main() =
  if anzan_flg:
    echo a * b div 10
  else:
    var result = a * b
    if result < -99999999 or result > 99999999:
      echo 'E'
    else:
      echo result

main()
