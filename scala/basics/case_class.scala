// ケースクラス
case class Point(x: Int, y: Int)

// ケースクラスはnewキーワードなしでインスタンス化可能
object main {
  def main(args: Array[String]): Unit = {
    val point = Point(1, 2)
    val anotherPoint = Point(1, 2)
    val yetAnotherPoint = Point(2, 2)

    // ケースクラスは値として評価される
    if (point == anotherPoint) {
      println(s"$point と $anotherPoint は同じです。")
    } else {
      println(s"$point と $anotherPoint は異なります。")
    } // Point(1,2) と Point(1,2) は同じです。

    if (point == yetAnotherPoint) {
      println(s"$point と $yetAnotherPoint は同じです。")
    } else {
      println(s"$point と $yetAnotherPoint は異なります。")
    } // Point(1,2) と Point(2,2) は異なります。
  }
}
