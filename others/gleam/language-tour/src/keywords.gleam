import gleam/io

pub fn keywords() {
  panic_if_not_true(True)
  let_assert()

  Nil
}

// todoキーワードはコンパイルするとwarningが表示され、実行すると指定したメッセージを表示してクラッシュする
// fn special_function() {
//   todo as "This function will be something special"
// }
// fn todo_without_reason() {
//   todo
// }

fn panic_if_not_true(boolean: Bool) -> Bool {
  case boolean {
    True -> False
    // panicキーワードはプログラムをクラッシュさせる
    // catchする手段が無いので通常は利用しない
    False -> panic as "This is not true!"
  }
}

fn let_assert() {
  // let assertはパターンにマッチしなかった場合にプログラムをクラッシュさせる
  // panicと同様にcatchする手段が無いので通常は利用しない

  unsafe_get_first([1, 2, 3])
  |> io.debug
  // unsafe_get_first([]) // クラッシュ
}

fn unsafe_get_first(l: List(t)) -> t {
  let assert [first, ..] = l
  first
}
