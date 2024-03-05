import gleam/io

pub fn labeled_argument() {
  io.println("Labeled argument")

  calculate(1, add: 2, multiply: 3)
  |> io.debug
  // ラベル付き引数は順番を入れ替えられる
  calculate(1, multiply: 3, add: 2)
  |> io.debug
  // ラベルを付けるかどうかは呼び出し側で自由
  calculate(1, 2, 3)
  |> io.debug
}

// ラベル付き引数
// ラベル 関数内の引数名: 型
// ラベル付き引数はラベルなし引数の後に指定する
fn calculate(value: Int, add addend: Int, multiply multiplier: Int) {
  value * multiplier + addend
}
