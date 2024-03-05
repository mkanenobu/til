import gleam/io

pub fn deprecation_attribute() {
  io.println("Deprecation attribute")

  old_function()
  new_function()
}

// deprecated attributeでコンパイラに対してwarningを出せる
@deprecated("Use new_function instead")
fn old_function() {
  Nil
}

fn new_function() {
  Nil
}