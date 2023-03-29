mod mpsc_channel;
mod watch_channel;

use crate::mpsc_channel::mpsc_channel;
use crate::watch_channel::watch_channel;
use std::{thread, time};

async fn async_function() -> String {
    let five_seconds = time::Duration::from_secs(3);
    thread::sleep(five_seconds);
    "Hello".to_string()
}

#[tokio::main]
async fn main() {
    let result = async_function().await;
    println!("{}", result);
    message().await;
    watch_channel().await;
    mpsc_channel().await;
}

use tokio::sync::oneshot;

async fn message() {
    let (tx, rx) = oneshot::channel();

    tokio::spawn(async move {
        tokio::time::sleep(time::Duration::from_secs(3)).await;
        tx.send("Hoge".to_string()).unwrap();
    });

    let res = rx.await.unwrap();
    println!("received: {}", res);
}
