import gleam/io

pub fn recursion() {
  io.println("Recursion")

  // gleam にはループがないので、再帰を使って繰り返し処理を行う
  factorial(5) |> io.debug
  factorial(7) |> io.debug
  
  factorial_tailcall(5) |> io.debug
  factorial_tailcall(7) |> io.debug
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