import gleam/io
import gleam/bool

pub fn bools_example() {
  io.println("Bools example")

  // 演算子, && と || は短絡評価される
  io.debug(True && False)
  io.debug(True && True)
  io.debug(False || False)
  io.debug(False || True)

  bool.to_string(True)
  |> io.debug
  bool.to_int(False)
  |> io.debug
  True
  |> bool.to_int
  |> io.debug
}
