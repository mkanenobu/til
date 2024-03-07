import gleam/io

pub fn recursion() {
  io.println("Recursion")

  // gleam にはループがないので、再帰を使って繰り返し処理を行う
  factorial(5)
  |> io.debug
  factorial(7)
  |> io.debug

  factorial_tailcall(5)
  |> io.debug
  factorial_tailcall(7)
  |> io.debug

  list_recursion()
}

// 再帰関数には最低一つのベースケースが必要
pub fn factorial(x: Int) -> Int {
  case x {
    // Base case
    1 -> 1

    // Recursive case
    _ -> x * factorial(x - 1)
  }
}

// 末尾呼び出しで最適化したバージョン
// ユーザーにaccumulatorを意識させたくないのでラップする
pub fn factorial_tailcall(x: Int) -> Int {
  factorial_loop(x, 1)
}

fn factorial_loop(x: Int, accumulator: Int) -> Int {
  case x {
    1 -> accumulator

    // The last thing this function does is call itself
    // In the previous lesson the last thing it did was multiply two ints
    _ -> factorial_loop(x - 1, accumulator * x)
  }
}

import gleam/list

fn list_recursion() {
  let list = [1, 2, 3, 4, 5]
  sum_list(list, 0)
  |> io.debug

  // リスト操作は標準ライブラリ（gleam/list）にある
  list.fold(list, 0, fn(b, a) { b + a })
  |> io.debug
  // 下のsum_listのように自分で再帰を書くこともできる
}

fn sum_list(list: List(Int), total: Int) -> Int {
  case list {
    [first, ..rest] -> sum_list(rest, total + first)
    [] -> total
  }
}
