import gleam/io
import gleam/string

pub fn pipeline() {
  io.println("Pipeline example")

  // パイプラインなし
  io.debug(string.drop_right(string.drop_left("abcde", 2), 1))

  // パイプラインあり
  "abcde"
  |> string.drop_left(2)
  |> string.drop_right(1)
  |> io.debug

  // キャプチャを使って引数の順番を変える
  // パイプラインで渡した場合、キャプチャを利用しなければ最初の引数として渡される
  "1"
  |> string.append("2")
  |> string.append("3", _)
  |> io.debug
}
