import random, os, algorithm
var a:seq[int] = @[]
randomize()
for i in 1..100:
    a.add(i)
for i in 1..10:
    stdout.write(rand(max=10))
echo rand(a) # ランダムで一つ出力,randomプロシージャは0.18より非推奨
shuffle(a) # シャッフル
echo a
sort(a,cmp[int])
echo a
