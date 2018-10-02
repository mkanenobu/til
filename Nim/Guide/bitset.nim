let
    a:char = 'a'
    b:char = 'b'
    B:set[char] = {'a'..'z'}
    A:set[char] = {'b'..'h'}
echo a in B
# aはBに含まれるか
# 'd' in {'a'..'z'}

echo a notin B
# aはBに含まれないか
# 40 notin {2..20}

echo A + B
# AとBを結合したもの
# {'a'..'m'} + {'n'..'z'} == {'a'..'z'}

echo A - B
# AからBを除いたもの
# {'a'..'z'} - {'b'..'d'} == {'a', 'e'..'z'}

#echo A + b
## Aにbの要素を足したもの
## {'b'..'z'} + 'a' == {'a'..'z'}
#
#echo A - b
## Aからbの要素を除いたもの
## {'a'..'z'} - 'a' == {'b'..'z'}

echo A * B
# AとBどちらにも含まれているもの
# {'a'..'m'} * {'c'..'z'} == {'c'..'m'}

echo A <= B
# AはBの部分集合であるか
# {'a'..'c'} <= {'a'..'z'} # true

echo A < B
# AはBの真部分集合であるか
# {'b'..'c'} < {'a'..'z'}  # true
