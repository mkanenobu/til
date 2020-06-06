// メソッド
def add(x: Int, y: Int): Int = x + y
println(add(1, 4))

// メソッドは複数のパラメータリストを受け取ることができる
def addThenMultiply(x: Int, y: Int)(multiplier: Int): Int = (x + y) * multiplier
println(addThenMultiply(1, 2)(3)) // 9

// パラメータリストを一つも受け取らないこともできる, 値宣言と違い呼び出しごとに再評価される
def name: String = System.getProperty("user.name")
println("Hello, " + name + "!") // 空のパラメータリストすら受け取らないのでカッコは不要

// ブロック使用
def getSquareString(input: Double): String = {
  val square = input * input
  square.toString
}
println(getSquareString(2.5)) // 6.25