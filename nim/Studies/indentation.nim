var 
    x = true
    y = false
# 一つのステートメントではインデントは必要ない
if x: x = false

# if文ではネストする必要がある
if x:
    if y:
        y = false
    else:
        y = true

# 複数のステートメントのときは，インデントが必要
if x:
    x = false
    y = false


#[
if thisIsLongCondition() and
    thisIsAnotherLongCondition(1,
        2, 3, 4,):
    x = true
この形での改行は可能]#

# 括弧とセミコロンを使うことで式しかゆるされない場所でも文が使える
# fac(4),つまり4の階乗をコンパイル中に計算する
const fac4 = (var num = 1; for i in 1..4: num *= i; num)
echo fac4
