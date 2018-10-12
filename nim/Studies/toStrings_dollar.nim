# toStrings
proc `$`(x: object): string =
    discard
var y: int = 123
echo $y
# `で挟むことによって新しい演算子を定義できる
