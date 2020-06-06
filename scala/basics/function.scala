// 関数
// 一般的な関数型言語と同じように無名関数に名前をつけるかんじ
val addOne = (x: Int) => x + 1
println(addOne(1))

// 複数の引数
val add = (x: Int, y: Int) => x + y
println(add(13, 11))

// 引数なし
val one = () => 1
println(one())

// ブロック使用
val blockFunc = (x: Int) => {
  val tenTimes = x * 10
  tenTimes * 10
}
println(blockFunc(3))