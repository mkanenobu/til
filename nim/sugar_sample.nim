import sugar

# macros

# `(int, int) -> int` 整数の引数を2つ取り、整数を返す関数型
proc passTwoAndTwo(f: (int, int) -> int): int = f(2, 2)

# `(x, y) => x + y` 無名関数
echo passTwoAndTwo((x, y) => x + y)

# like JavaScript's arrow function style
const f = (x: int, y: int) => x + y
echo f(1, 6)
