use  std::{thread, time};

async fn async_function() -> String {
  let five_seconds = time::Duration::from_secs(5);
  thread::sleep(five_seconds);
  "Hello".to_string()
}

#[tokio::main]
async fn main() {
    let result = async_function().await;
    println!("{}", result);
}