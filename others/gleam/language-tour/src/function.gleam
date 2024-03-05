import gleam/io

// mainは予約後のようでモジュール側で利用できない
// pub fn main() {
//   io.println("Function example")
// }

pub fn function() {
  io.println("Function example")

  let x = add(1, 2)
  io.debug(x)
  let x = multiple(5, 10)
  io.debug(x)

  let x = twice(5, double)
  io.debug(x)

  // 無名関数
  let x = twice(5, fn(x: Int) { x * 3 })
  io.debug(x)

  let triple = fn(x: Int) { x * 3 }
  let x = triple(5)
  io.debug(x)

  // 関数キャプチャ構文、下二つは同じ
  let _add_one_v1 = fn(x) { add(x, 1) }
  let add_one_v2 = add(_, 1)
  add_one_v2(2)
  |> io.debug

  let x = twice_v2(5, add(_, 1))
  io.debug(x)
}

// 型アノテーションはオプショナル
fn add(x, y) {
  x + y
}

fn multiple(x: Int, y: Int) -> Int {
  x * y
}

fn double(x: Int) -> Int {
  multiple(x, 2)
}

// 高階関数
fn twice(n: Int, func: fn(Int) -> Int) -> Int {
  func(func(n))
}

// ジェネリクス、型変数は小文字で表現する
// 型変数はanyとは異なり、呼び出しごとに特定の型にバインドされる
fn twice_v2(n: value, func: fn(value) -> value) -> value {
  func(func(n))
}
