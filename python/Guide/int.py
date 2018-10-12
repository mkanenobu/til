#!/usr/bin/env python3

a = 111
b = 20

print(a / b)  # 除算
print(a % b)  # 余り
print(a ** b)  # べき乗
print(a // b)  # 切り捨て除算
# divmod, 商と余りをタプルで返す
res, mod = divmod(a, b)
print(res, mod)

# ビット演算子
print(~a)  # ビット反転
print(a & b)  # AND:論理積(aもbも1のビットが1)
print(a | b)  # OR:論理和(aまたはbが1のビットが1)
print(a ^ b)  # XOR:排他的論理和(aまたはbが1のビットが1)
print(a << b)   # b ビット左シフト
print(a >> b)   # b ビット右シフト

# 比較演算子
print(a == b)      # a が b と等しい
print(a != b)      # a が b と異なる
print(a < b)       # a が b よりも小さい
print(a > b)       # a が b よりも大きい
print(a <= b)      # a が b 以下である
print(a >= b)      # a が b 以上である
print(a is b)      # a が b と等しい
print(a is not b)  # a が b と異なる
print(a in b)      # a が b に含まれる
print(a not in b)  # a が b に含まれない
