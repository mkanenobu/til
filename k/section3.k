/// List operations

// Atomic oprations
/ 4つの算術演算子+、-、*、および％は、スカラーと任意の形状の配列の両方で動作できます。
/ これらの演算子を「アトミック」と呼びます。

b:0 2 6 _ &12
b
/ 要素にスカラーを取る場合，それぞれの要素に作用する
b + 2
/ 要素に配列を取る場合，それぞれの行に作用する
b + 1 2 3

/ 複雑な例
(3 2 # !6) + 3 2 2 # &12

/ 以下の演算子にも同じ規則が適用される
/ & - and/min
/ | - or/max
/ <, > and = - comparison


// Reduction operations
/ リストを引数に取り単一の値を返す関数
r: 10 rand 300
r
count r
first r
last r
max r
min r
avg r


// Full list operations
/ k にはリスト全体を一度に処理する操作があるので，
/ リストの一つづつの要素に処理を行う必要はほとんどない

/ 降順，昇順に並び替え
asc r
dsc r

/ `|` でリストを逆順に出来る
/ `~` でリスト同士の比較，1: true, 0: false
(dsc r) ~ |asc r


// Selection operations
/ インデックス
z: 22 + !10
z
z[0] / same as first
z[3]
z[3 5]
z[2+!6]
z[(#z)-1] / same as last
z[_ (#z) % 2]

/ マトリクスのインデックス
mymulti: (1 2 3;4 5 6;7 8 9;10 11 12)
mymulti
mymulti[0;0]
mymulti[2;0]
mymulti[1;2]
/ get full rows
mymulti[1]
/ get full columns
mymulti[;0]

\\

