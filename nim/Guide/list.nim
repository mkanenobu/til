
# リスト内包表記

# (返り値になる変数定義; オプション{for文とか}; 最初に定義した変数)
let a = (var x:seq[int] = @[]; for i in 0..10: x.add(i); x)
echo a

