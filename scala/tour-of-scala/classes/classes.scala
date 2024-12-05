@main
def main(): Unit = {
  val user1 = User()

  val point1 = Point(2, 3)
  println(point1)
  point1.move(1, -2)
  println(point1)

  // コンストラクタは引数を左から右に読み取るので、y（二つ目移行の値）のみを指定する場合は名前付き引数を使う
  val point2 = Point(y = 2)
  println(point2)

  val point3 = Point2()
  point3.x = 10
  point3.x = 101 // WARNING: Out of bounds
  println(point3)
  println(point3.x)
}

// 最小のクラス定義はclassキーワードと識別子だけのもの
class User

// Pointのクラス定義
// Pointクラスには変数x, yとメソッドmove, toStringの4つのメンバーを持つ
// プライマリコンストラクタがメンバー変数になる（x, y）
// val, varの付いたコンストラクタパラメータはpublicになり、キーワードが付いていないものはprivateになる
// コンストラクタにデフォルト値を指定することでコンストラクタのパラメータをオプションに出来る
class Point(var x: Int = 0, var y: Int = 0) {
  def move(dx: Int, dy: Int): Unit = {
    x = x + dx
    y = y + dy
  }

  // toStringは暗黙的なスーパータイプであるAnyRefに定義されているのでoverrideが必要
  override def toString: String =
    s"($x, $y)"
}

// プライベートメンバーとgetter/setterシンタックス
class Point2 {
  private var _x = 0
  private var _y = 0
  private val bound = 100

  // getter
  def x: Int = _x
  // setter
  def x_=(newValue: Int): Unit = {
    if newValue < bound then
      _x = newValue
    else
      printWarning()
  }

  def y: Int = _y
  def y_=(newValue: Int): Unit = {
    if newValue < bound then
      _y = newValue
    else
      printWarning()
  }

  override def toString: String =
    s"($x, $y)"

  private def printWarning(): Unit =
    println("WARNING: Out of bounds")
}