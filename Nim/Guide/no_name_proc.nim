import strutils, sequtils
# 無名プロシージャ
var
    n = 10
    t = @[1,2,3,4,5,6,7,8,9]
    p = proc(x:int):int =
        return x + 1

# 偶数はそのまま出力，奇数は倍
echo t.map(proc(x:int):int =
    if x mod 2 == 0: x
    else: x * 2)

echo t.map(p)
echo p(n)
