import sugar, sequtils

# 1から10までの偶数に2を掛けた配列
echo lc[x * 2 | (x <- 1..10, x mod 2 == 0), int]
