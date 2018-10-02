import sequtils
var
    a : seq[int]
# 長さ3のseq
    b = newSeq[int](3)
# 3x3の2次元配列
    c = newSeqWith(3, newSeq[int](3))

# 配列の結合 可変長引数なので引数の数はいくつでもいい
a = concat(@[3, 5, 7], @[9, 11, 13], @[15, 17, 19, 21])
echo a


# map関数も実装されている ここではすべての要素を2倍にしている
echo @[1, 2, 3].map(proc(x: int): int = 2 * x)
echo @[1, 2, 3].map(proc(x: int): int = 3 * x)

# 偶数だけを取り出すフィルター
echo @[1, 2, 3, 4, 5, 6, 7].filter(proc(x: int):bool = x mod 2 == 0)

echo a

# del, 指定したindexの要素を削除し，一番最後の要素をindexに持ってくる
a.del(4)
echo a

# delete, 指定したindexの要素を削除
a.delete(3)
echo a
