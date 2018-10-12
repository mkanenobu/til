#!/usr/bin/env python3

# list
# 型不問, 可変長, 同じ要素あり
a = [10, 20, 30]
b = [1, 2, 3]
c = [a, b]
for i in a:
    print(i)

print("")
# ラムダ式
print(list(map(lambda x: x * 2, a)))

print("")
print(a[0])
print(a[-1])
print(a + b)
# 最後に追加
print(a)
print(c)

# 多次元配列 全走査
for i in c:
    for j in i:
        print(j)

# tuple
# listとほぼ同じだが要素を変更できない
d = (10, 20, 30)
e = (10,)
# タプルからリストに変換
print(list(d))
# リストからタプルに変換
print(tuple(a))

# dict
f = {'Yamada': 30, 'Suzuki': 40, 'Tanaka': 50}
# 要素へアクセス
print(f['Yamada'])
for i, v in f.items():
    print(i, v)
for i in f.keys():
    print(i)
for v in f.values():
    print(v)
