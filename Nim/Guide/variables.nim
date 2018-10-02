import os, algorithm

proc getAlphabet(): string =
    var accm = ""
    for letter in 'a'..'z': #see iterators
        accm.add(letter)
    return accm

const alphabet = getAlphabet()

var
    a = "foo"
    b = 0
    c: int

a.add("bar")
b += 1
c = 3

echo alphabet, a, b, c

var
    sequence: seq[int] = @[7,16,2,11]
    n1,n2,n3:int
# 代入
(n1, n2, n3) = sequence.sorted(cmp[int]).reversed
echo n1, n2, n3
