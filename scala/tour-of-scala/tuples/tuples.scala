@main
def main(): Unit = {
  {
    // Scalaのtupleはそれぞれ独自の型を持つ固定数の要素を含む値で不変
    // tupleはメソッドから複数の値を返す場合に便利
    val ingredient = ("Sugar", 25) // ingredientの型は `(String, Int)` と推論される
    println(ingredient)
    // インデックスアクセスはtupleの要素にアクセスする方法の一つ
    println(ingredient(0))
    println(ingredient(1))
    // tupleはパターンマッチングで分解出来る
    val (name, quantity) = ingredient
    println(name)
    println(quantity)
  }

  {
    // tupleのパターンマッチングの例
    val planets = List(("Mercury", 57.9), ("Venus", 108.2), ("Earth", 149.6), ("Mars", 227.9), ("Jupiter", 778.3))

    planets.foreach {
      case ("Earth", distance) =>
        println(s"Our planet is $distance million kilomiters from the sun")
      case _ => // Do nothing
    }

    val numPairs = List((2, 5), (3, -7), (20, 56))
    for (a, b) <- numPairs do
      println(a * b)
  }

  // tupleとcase classのどちらを使うか迷うことがあるが、case classには名前付きのフィールドがある
  // 名前があることによって可読性が上がることもある
  // ↑のplanetsの例ではtupleを利用する代わりに `case class Planet(name: String, distance: Double)` のようなcase classを定義する可能性もある
}