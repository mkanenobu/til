mod a;
mod b;

fn main() {
  println!("Hello");
  println!("module a: {}", a::module_a());
  println!("module b: {}", b::module_b());
}