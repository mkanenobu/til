import math, strutils

var x,y:int
x = 2
y = 3
echo x + y # 足し算
echo x - y # 引き算
echo x * y # 掛け算
echo x / y # 割り算
echo ceil(x / y) # 切り上げ
echo floor(x / y) # 切り捨て
echo x div y # 割り算の商
echo x mod y # 割り算のあまり
echo x ^ y # べき乗 depends on "math"
echo x and y # 論理和
echo x or y # 論理積
echo x xor y # 排他的論理和
echo(not x) # ビット反転
echo x shl y # 左シフト
echo x shr y # 右シフト
echo parseInt("100") # 文字列から数値への変換
echo int("hello world"[0]) # ascii codeの取得
