import sequtils, strutils, math, algorithm

var
    n = readLine(stdin).parseInt
    a:seq[int] = readLine(stdin).split.map(parseInt)
    a_dedup:seq[int]
a_dedup = a.deduplicate()

# num of tsuru
proc main():int =
    if len(a_dedup) == 1:
        if a[0] div (n - 1) == 2:
            return n
        else:
            return 0
    else:
        var total = max(a_dedup) + 2
        for i in 1..n:
            if total == i * 2 + (n - i) * 4:
                return i

echo main(), " ", n - main()
# 3
# 4 4 4
# 3 0

# 3
# 8 8 8
# 0 3

# 3
# 6 6 4
# 2 1

# 4
# 10 10 8 8
# 2 2
