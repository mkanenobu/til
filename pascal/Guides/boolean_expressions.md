#### ブール演算子

演算子|説明
----|----
<|未満
>|超過
=|等しい
<=|以下
>=|以上
<>|等しくない

操作|説明
----|----
not|否定 (negation) (~)
and|結合 (conjunction) (^)
or|選言 (disjunction) (v)
xor|排他 (exclusive-or)

NOT は単一演算子である。それは単一の値にのみ適用でき、その値を逆転させる。
- not true = false
- not false = true

AND は両方の値が TRUE であるときのみ TRUE になる。
- true and false = false
- true and true = true

OR は少なくとも1つの値が TRUE であるときに TRUE になる。
- true or true = true
- true or false = true
- false or true = true
- false or false = false

XOR は1つの式が TRUE でもう一方の式が FALSE である時に TRUE となる。
- true xor true = false
- true xor false = true
- false xor true = true
- false xor false = false

2つのブール式を関係演算子とブール演算子を用いて結合するときにはカッコの使い方に注意しなければならない。
`(3 > 5) or (650 < 1)`
その理由はブール演算子は関係演算子よりも演算の順序が上であるためである。

演算順序
1. not
2. \*, /, div, mod, and
3. \+, \-, or
4. <, >, <=, >=, =, <>

`3 > 5 or 650 < 1`では`3 > (5 or 650) < 1`の用に評価され、意味をなさない。(コンパイルエラーを返す)
