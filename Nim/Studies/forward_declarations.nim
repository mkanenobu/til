from strutils import parseInt
proc even(n: int): bool
# すべての変数やprocは使う時点で宣言されている必要がある
# しかし相互回帰なprocを使う場合，このルールに従うことができない
# その場合，=と中身を省略したprocを宣言すればよい
proc odd(n: int): bool =
    assert(n >= 0) # nが負数になり無限ループすることが無いようにする
    if n == 0: false
    else:
        n == 1 or even(n-1)

proc even(n: int): bool =
    assert(n >= 0)
    if n == 1: false
    else:
        n == 0 or odd(n-1)

var input: int = readLine(stdin).parseInt
if odd(input):
    echo "odd"
else:
    echo "even"
