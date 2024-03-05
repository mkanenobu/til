import gleam/io
import lib/mod

pub fn main() {
  io.println("Hello from moduling_example!")

  mod.module_function() |> io.debug
}
