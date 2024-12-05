@main
def main(): Unit = {
  // expression
  1 + 1

  // print
  {
    println(1)
    println(1 + 1)
    println("Hello!")
    println("Hello," + " world!")
  }

  {
    // values
    // valは値を宣言するためのキーワード
    val a = 1 + 1
    println(a)
    // valで定義した値はイミュータブルなので代入出来ないため次のコードはエラーになる
    // x = 3

    // 値の型は推論に任せて省略も出来るし明示することも出来る
    val b: Int = 1 + 1
  }

  {
    // 変数
    var c = 1 + 1
    c = 3
    println(c)
    // 変数の型も値と同様に省略することも明示することも出来る
    var d: Int = 1 + 1
  }

  {
    // ブロック
    // 最後の式の結果がブロック全体の結果になる
    println({
      val x = 1 + 1
      x + 1
    })
  }

  {
    // 関数
    val addOne = (x: Int) => x + 1
    println(addOne(1))
    // メソッド呼び出し
    println(add(1, 2))
    println(addThenMultiply(1, 2)(3))
    println(name)
  }

  {
    // インスタンスの作成
    // Scala3であればnewキーワードは省略可能
    val greeter = GreeterC("Hello, ", "!")
    greeter.greet("Scala developer")
  }

  {
    // ケースクラスのインスタンスの作成
    // ケースクラスのインスタンスはデフォルトでイミュータブルかつ値で比較される
    // そのためパターンマッチングにもよく使われる
    val point = Point(1, 2)
    val anotherPoint = Point(1, 2)
    val yetAnotherPoint = Point(2, 2)

    // 参照ではなく値で比較される
    println(s"$point equals to $anotherPoint: ${point == anotherPoint}")
    println(s"$point equals to $yetAnotherPoint: ${point == yetAnotherPoint}")
  }

  {
    // オブジェクトの利用
    val newId = IdFactory.create()
    println(newId)
    val newerId = IdFactory.create()
    println(newerId)
  }
}

// メソッド
// Scalaではdefでメソッドを定義し、関数とは区別される
// メソッドと関数は性質も異なる
def add(x: Int, y: Int): Int = x + y
// メソッドは複数のパラメータリストを取ることが出来る
def addThenMultiply(x: Int, y: Int)(multiplier: Int): Int = (x + y) * multiplier
// パラメータリストを持たないメソッドも定義出来る
def name: String = System.getProperty("user.name")

// クラス
class GreeterC(prefix: String, suffix: String) {
  def greet(name: String): Unit =
    println(prefix + name + suffix)
}

// ケースクラス
case class Point(x: Int, y: Int)

// オブジェクト
// オブジェクトはそれ自身の定義の単一のインスタンス、そのクラスのシングルトンと考えることも出来る
object IdFactory {
  private var counter = 0
  def create(): Int =
    counter += 1
    counter
}

// トレイト
// トレイトは特定のフィールドとメソッドを含む抽象的なデータ型
// クラスの継承は他のクラスを1つだけしか継承出来ないが、複数のトレイトをextends出来る
trait Greeter {
  // トレイトはデフォルト実装を持てる
  def greet(name: String): Unit =
    println("Hello, " + name + "!")
}
// トレイトをextendしたクラス
class DefaultGreeter extends Greeter

// トレイトをextendしつつ、実装をオーバーライドしたクラス
class CustomizedGreeter(prefix: String, postfix: String) extends Greeter {
  // overrideキーワードで実装をオーバーライド出来る
  override def greet(name: String): Unit = {
    println(prefix + name + postfix)
  }
}
