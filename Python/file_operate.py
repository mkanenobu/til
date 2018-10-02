#!/usr/bin/env python3

# モード r: 読み込み, w: 書き込み, a: 追記, b: バイナリモード
f = open('sample.txt','r')
# すべてのデータを読みこむ
print(f.read())
# 行ごとに読み込む
for line in f.readline():
    print(line)
f.close()
# 追記
f = open('sample.txt','a')
f.writelines("python file operate\n")
#f.flush()
f.close()
