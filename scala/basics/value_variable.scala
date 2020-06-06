// 値の宣言(式の結果に名前をつける)、再代入不可
val a = 1
// a = 3 コンパイルエラー

// 変数宣言
var b = 1
println("b is " + b)
b = b * 10
println("b is " + b)

// ブロック
val c = {
  val c1 = 3
  val c2 = 4
  // 最後の値がブロック全体の値になる
  c1 * c2
}
println(c)
