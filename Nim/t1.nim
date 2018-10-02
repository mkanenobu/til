import myutils, sets, sequtils

var
    s1:seq[int] = @[1,2,3,4,5,6,7,8,9,1,2,1,2,5,10]
    s2:seq[char] = @['a','b','c','a','d']
    s3:seq[int] = @[1,3,9,10]
    t = {1,2,3}


#proc excl*[T](s: var seq[T]; x: T) =
#    var a = s.findall(x)
#    for j in a:
#        s.delete(j)


echo s1.findall(1)
s1.excl(1)
echo s1

s2.excl('a')
echo s2

for i,v in s1:
    echo i, v

for i,v in pairs(s1):
    echo i,v
