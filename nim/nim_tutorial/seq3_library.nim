import lib/helloWorld

# 識別子の最後に `*` をつけることで外から使用できる
proc hoge*(): string = "hoge"

echo helloStr & ", Nim!"

proc hello(str: string): string =
  "Hello, " & str

proc hello(): string =
  "Hello, Local Scope"

echo hello()
# 名前空間が違うのでオーバーライドはされない
echo helloWorld.hello()

echo hello("Sample")
