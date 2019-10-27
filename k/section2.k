/// List

1 2 3 4 5 * 10
1 2 3 + 10
1 2 3 + 10 20 30

// Generate list
/ &N - N zeros
&3 + 10
/ !N - 0 through N-1
!10
/ rand N - N random numbers drawn uniformly from [0, 1]
(rand 3) * 10
/ rand -N - N random numbers drawn from a normal distribution with μ=0 and σ=1
(rand -2) * 10

/ variable
x: !10
x * 3

/ random list
/ generate randomly with replacement (can be duplicate)
10 rand 50
/ generate randomly with without replacement (no duplicates)
-10 rand 10


// Cut and reshape

a: !12
/ reshape list

/ cutting list into chunks
0 2 6 _ a

/ cut list into same size chunks (3 * 4 length chunk)
3 4 # a

/ 2x2x3 matrix
3 2 2 # a

/ 2x2 matrix
(1 2;3 4)

/ 要素が足りないと先頭の値が再利用される
10 # !4

/ ',' operater specify next
5 5 # 1,&5

/ k には0または1つのリストを作成する方法が明らかではない
/ なので0#または1#を使用してアトムをリストに再整形する
1 # 42 / returs ,42

/ ','は要素を一つのリストに変換する関数
/ リストに適用するとそのリストを要素に持つリストに変換される
2#1 2 3 / take first 2 elements
2#,1 2 3 / repeat twice

/ `,`がリストとアトムの間にある場合，アトムがリストに結合される
(1,2 3;4 5,6)

/ リストまたは行列のリストを結合すると行が結合される
x,x:!-3  / !-3は3x3の行列

/ 列を結合するには`,'`演算子を使用する
x,'x:!-3

/ リストをフラットにするには `,/` 関数を使用する
,/(1;2 3;4 5 6)

/ ネストされたリストを再帰的にフラットにするには `,//` 関数を使用する
,//(1;!-2;(1 2;3 4))


// List from atoms and back

/ split interger into digits
10\:123456789

/ join interger list
10/:1 2 3 4 5 6 7 8 9

/ vector from scalar (\:) operater and scalar from vector (/:)

/ use 2 instead 10 in binary expansion
2\:42

/ 同じ演算子を利用して秒単位の時間を日，時間，分に分割出来る
/ 3時間25分45秒
24 60 60\:12345
24 60 60/:3 25 45


// Generating 2d data

/ k には単一の操作でリストを生成するいくつかのプリミティブが存在する
/ =N - NxN の初期化されたマトリクスを作成
/ !v - odometer
/ prm N - 0からN-1までの数字の全ての順列
/ M cmb N - 0からN-1までのM個の数の全ての組み合わせ

/ Eye operater
!-3

/ Odometer operater
/ 最下行が基数3, 2番目が基数2, 最上行が基数1
!1 2 3

/ Combinatorics
prm 3
2 cmb 3

\\
