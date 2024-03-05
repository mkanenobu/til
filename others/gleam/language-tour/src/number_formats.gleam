import gleam/io

pub fn number_formats() {
  io.println("Number formats")
  io.debug(1_000_000)
  io.debug(100.1)

  io.debug(0b00001101)
  io.debug(0o17)
  io.debug(0x1F)

  io.debug(7.0e7)
  io.debug(3.0e-2)
}
