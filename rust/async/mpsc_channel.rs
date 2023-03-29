use tokio::sync::mpsc;

async fn some_computation(input: u32) -> String {
    println!("computing {}", input);
    tokio::time::sleep(tokio::time::Duration::from_millis((500 * input) as u64)).await;
    format!("the result of computation {}", input)
}

// mpsc チャネルは、単一の consumer への複数の producer からの複数の値の送信が出来る
pub async fn mpsc_channel() {
    let (tx, mut rx) = mpsc::channel(100);

    for i in 0..=10 {
        let tx = tx.clone();
        tokio::spawn(async move {
            // それぞれの some_computation の実行開始はほぼ同時
            // 結果が返ってくるのはそれぞれの実行開始から 500ms * i ms 後なので、受信側は 500ms づつずれて一つづつ受信する
            let res = some_computation(i).await;
            tx.send(res).await.unwrap();
        });
    }

    while let Some(res) = rx.recv().await {
        println!("got = {}", res);
        if res == "the result of computation 10" {
            break;
        }
    }
}
