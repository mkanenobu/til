// クラス識別子のみのクラス(最小のクラス)
class User

// コンストラクタ付き
class Point(var x: Int, var y: Int) {
  def move(dx: Int, dy: Int): Unit = {
    // コンストラクタは自動でメンバー変数になる
    x = x + dx
    y = y + dy
  }

  // Anyで定義済みのtoStringをオーバーライド
  override def toString: String =
    s"($x, $y)"
}

// デフォルト値を持つコンストラクタ
class PointWithDefault(var x: Int = 0, var y: Int = 0) {
  def move(dx: Int, dy: Int): Unit = {
    x = x + dx
    y = y + dy
  }

  override def toString: String =
    s"($x, $y)"
}

object main {
  def main(args: Array[String]): Unit = {
    val user1 = new User
    println(user1)

    var point1 = new Point(2, 3)
    println(point1.x)
    println(point1)
    point1.move(1, 1)
    println(point1)
    var point2 = new PointWithDefault()
    println(point2)
    var point3 = new PointWithDefault(10)
    println(point3)
    // 引数の順番を飛ばす場合名前を指定する必要がある
    var point4 = new PointWithDefault(y = 10)
    println(point4)
  }
}
