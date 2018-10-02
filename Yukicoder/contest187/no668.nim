import sequtils, strutils

var
    n = stdin.readLine
    res:float = n[0..1].parseFloat
    zeros = n.len - 1

if ($n[2]).parseInt >= 5:
    res += 1.0

if res >= 100:
    zeros += 1
    res = res / 10

echo ($res)[0], ".", ($res)[1], "*10^", zeros
