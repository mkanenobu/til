import gleam/io
import gleam/int

// Erlang VMで実行する場合、Int型には上限と下限がない
pub fn int_example() {
  io.println("Int examples")
  let n: Int = 1
  io.debug(n + 1)

  // intモジュールにヘルパーが入っている
  int.max(1, 100)
  |> io.debug
}
