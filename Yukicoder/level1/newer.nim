import strutils, sequtils, algorithm

var
    n = readLine(stdin).parseInt
    a:seq[string] = readLine(stdin).split
    a_dedup:seq[string] = a.deduplicate
    res = 0

# 遅すぎ
for i in a_dedup:
    if count(a_dedup, i) == 1:
        res += 1

echo res
