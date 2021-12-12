use std::env;

fn main() {
    // exists
    println!("{}", env::var("HOME").expect("Failed to get"));

    // not exists
    let r = env::var("HOGEHOGE");
    match r {
        Ok(v) => println!("{}", v),
        Err(err) => println!("{}", err)
    }
}
