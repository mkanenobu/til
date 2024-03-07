import gleam/io

pub fn tuples_example() {
  // Tupleは異なる型の要素を持つことができる
  let t = #(1, 2.2, "String")
  // タプルアクセス構文で要素にアクセスできる
  // タプルは関数から複数の要素を返したいときによく使う
  // 他のケースではカスタムタイプを使った方がいいケースが多い
  t.0
  |> io.debug
  t.1
  |> io.debug
  t.2
  |> io.debug

  // 分割代入
  let #(_, _, third) = t
  io.debug(third)

  tuple_arg(t)
}

// タプル型
fn tuple_arg(t: #(Int, Float, String)) {
  t.0
  |> io.debug
  t.1
  |> io.debug
  t.2
  |> io.debug
}
