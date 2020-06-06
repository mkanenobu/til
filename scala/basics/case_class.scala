// ケースクラス
case class Point(x: Int, y: Int)

// ケースクラスはnewキーワードなしでインスタンス化可能
val point = Point(1, 2)
val anotherPoint = Point(1, 2)
val yetAnotherPoint = Point(2, 2)

// ケースクラスは値として評価される
if (point == anotherPoint) {
  println(point + " と " + anotherPoint + " は同じです。")
} else {
  println(point + " と " + anotherPoint + " は異なります。")
} // Point(1,2) と Point(1,2) は同じです。

if (point == yetAnotherPoint) {
  println(point + " と " + yetAnotherPoint + " は同じです。")
} else {
  println(point + " と " + yetAnotherPoint + " は異なります。")
} // Point(1,2) と Point(2,2) は異なります。