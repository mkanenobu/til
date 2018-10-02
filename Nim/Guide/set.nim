import sets, typetraits

# set型 重複不可

var
    a:array[3,char] = ['a','b','c']
    b:seq[int] = @[1,1,1,2,3,4,5,6,11,13,14]
    c = toSet(b)
    chars:set[char] = {'a'..'z'}

# incl, seqでいうadd
c.incl(13)
echo c

# excl, 要素名で削除
c.excl(11)

echo c

#
import algorithm
echo "並べ替え"
while true:
    echo a
    if a.nextPermutation() == false:
        break
