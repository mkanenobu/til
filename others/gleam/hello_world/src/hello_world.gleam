import gleam/io

pub fn hello_world() -> String {
  "Hello, World!"
}

pub fn main() {
  io.println(hello_world())
}
