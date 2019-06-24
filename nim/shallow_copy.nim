
var s1, s2: ref seq[int]
s1 = new seq[int]
s1[] = @[1,2,3,4,5]
echo s1[]
s2 = s1
s2[0] = 10
echo s1[]
