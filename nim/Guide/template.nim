
template once(n) =
  var x {.global.} = false
  if not x:
    x = true
    n

proc p() =
  once:
    echo "1st time call of p"
  echo "some call of p"

p()
once:
  echo "test"
p()

template htmlTag(tag):untyped =
  proc tag():string =
    "<" & astToStr(tag) & ">"

htmlTag(br)
htmlTag(html)
echo br()
echo html()

# もしxがuntypedのときxをint型として初期化
template declareInt(x: untyped) =
  var x:int

declareInt(a)
a = 12
