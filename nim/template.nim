# name, ageの定義を流し込む
template declareNameAndAge() =
  var
    name {.inject.}: string = "Hello"
    age {.inject.}: int = 26

declareNameAndAge()
echo name
echo age

# 渡された引数を自分の名前を返す関数として定義する
template toStringFunc(ast): untyped =
  proc ast(): string = astToStr(ast)

toStringFunc(str)
echo str()

toStringFunc(Function)
echo Function()

# 渡された引数をHello, World!を返す関数として定義する
template hello(f) =
  proc f(): string = "Hello, World!"

hello(sample)
echo sample()

hello(hogehoge)
echo hogehoge()
