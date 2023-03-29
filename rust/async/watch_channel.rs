use tokio::sync::watch;
use tokio::sync::watch::Receiver;
use tokio::time::{self, Duration};

// watch channel は単一の producer から複数の consumer への複数の値の送信が出来る
pub async fn watch_channel() {
    let (tx, rx) = watch::channel(1u32);

    let mut rx1 = rx.clone();
    tokio::spawn(async move {
        consumer_a(&mut rx1).await;
    });

    let mut rx2 = rx.clone();
    tokio::spawn(async move {
        consumer_b(&mut rx2).await;
    });

    for i in 0..=10 {
        time::sleep(Duration::from_millis(200)).await;
        tx.send(i).unwrap();
    }
}

async fn consumer_a(receiver: &mut Receiver<u32>) {
    while receiver.changed().await.is_ok() {
        println!("consumer_a: {}", receiver.borrow().clone());
    }
}

async fn consumer_b(receiver: &mut Receiver<u32>) {
    while receiver.changed().await.is_ok() {
        println!("consumer_b: {}", receiver.borrow().clone());
    }
}
