import gleam/io
import gleam/float

pub fn float_example() {
  io.println("Float examples")
  let f: Float = 1.01
  io.debug(f +. 2.0)
  io.debug(f -. 2.0)
  io.debug(f /. 2.0)
  io.debug(f *. 2.0)

  io.debug(f == 1.01)

  float.ceiling(1.01)
  |> io.debug
  float.max(1.01, 2.0)
  |> io.debug
}
