#[macro_use]
extern crate anyhow;
mod redis_client;

fn main() {
    println!("Hello, world!");
    let foo = redis_client::get("foo".to_string());
    println!("foo: {:?}", foo);

    let saveRes = redis_client::set("foo".to_string(), "123".to_string());
    println!("saveRes: {:?}", saveRes);

    let foo = redis_client::get("foo".to_string());
    println!("foo: {:?}", foo);
}
