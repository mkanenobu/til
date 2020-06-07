class Point {
  private var _x = 0
  private var _y = 0
  private val bound = 100

  // プライベートメンバーにアクセスするためのゲッター
  def x = _x
  // セッター構文
  // ゲッターメソッド名に `_=` サフィックスをつける
  def x_=(newValue: Int): Unit = {
    if (newValue < bound) _x = newValue else printWarning
  }

  def y = _y
  def y_=(newValue: Int): Unit = {
    if (newValue < bound) _y = newValue else printWarning
  }

  private def printWarning = println("WARNING: Out of bounds")
}

object main {
  def main(args: Array[String]): Unit = {
    val point1 = new Point
    point1.x = 99
    point1.y = 101 // 警告が出力される
    println(point1.x)
    println(point1.y)

    class Num1(val value: Int)
    val n1 = new Num1(10)
    println(n1.value)
    // n1.value = 100 // コンストラクタがvalで宣言されているので代入不可

    // コンストラクタがval, varのどちらもなしで宣言されているとプライベートメンバーになる
    // valと同様に代入は不可
    class Num2(value: Int) {
      def v = value
      // def double = value = value * 2 // 内部的にはvalと同じなようなので再代入も不可
    }
    val n2 = new Num2(33)
    // n2.value // エラー
  }
}
