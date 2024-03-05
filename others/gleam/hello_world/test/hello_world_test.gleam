import gleeunit
import gleeunit/should
import hello_world

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  hello_world.hello_world()
  |> should.equal("Hello, World!")
}
