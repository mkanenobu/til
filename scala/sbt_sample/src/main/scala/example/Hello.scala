package example

object Hello extends App {
  // 値宣言、再代入不可
  val hello = "Hello, World!"
  println(hello)

  // 変数宣言、再代入可能
  var str = "Hello, World!"
  println(str)
  str = "こんにちは、世界"
  println(str)

  // 明示的な型宣言
  val intValue: Int = 0

  // ブロック
  val num = {
    val n = 3
    // 最後の値がブロック全体の値になる
    n * n
  }
  println(num)

  // 関数
  // val 
}
