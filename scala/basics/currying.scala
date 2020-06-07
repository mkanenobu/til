// メソッドは複数のパラメータリストを持つことが出来る

object main {
  def main(args: Array[String]): Unit = {
    val numbers = List(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    val res1 = numbers.foldLeft(0)((m, n) => m + n)
    println(res1)
    // 一つのパラメータリストしか持たない場合は↓のようなコードになる
    // numbers.foldLeft(0, (m: Int, n: Int) => m + n)
    // 複数のパラメータリストを持つとScalaの型インターフェースの恩恵を受けることが出来る
    val res2 = numbers.foldLeft(0)(_ + _)
    println(res2)

    // 部分適用
    // 初期値を空のリストで初期化
    val numberFunc = numbers.foldLeft(List[Int]()) _
    val squares = numberFunc((xs, x) => xs :+ x * x)
    val cubes = numberFunc((xs, x) => xs :+ x * x * x)
    println(squares)
    println(cubes)
  }
}
