proc printSeq(s: seq, nprinted: int = -1) =
    var nprinted = if nprinted == -1: s.len else:min(nprinted,s.len)
    for i in 0 .. <nprinted:
        echo s[i]

printSeq(@[1,-1,12],3)
# procの中身に記述されたパラメータは定数として扱われる
# つまり何も変更しないとパラメータの値は変えられない
# ミュータブルな変数が使いたければproc内でvar文を使って宣言しなければならない


proc divmod(a, b: int; res, remainder: var int) =
    res = a div b  # 整数型の計算
    remainder = a mod b # 整数型のmod計算

var
    x, y:int
divmod(8, 5, x, y) # xとyを変更
echo x
echo y

# resとremainderがvarパラメータ
# varパラメータはproc内で変更することが可能で，呼び出し先にも変数の変更が伝わる
# しかし上の例ではvarパラメータよりタプルを返したほうが適切である
