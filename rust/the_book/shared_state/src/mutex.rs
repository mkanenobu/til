use std::sync::{Arc, Mutex};
use std::thread;

pub fn mutex() {
    single_thread_mutext();
    multi_thread_mutex();
}

fn single_thread_mutext() {
    let m = Mutex::new(5);
    {
        // ロックはスコープ内でしか有効ではない
        let mut lock = m.lock().unwrap();
        *lock = 6;
    }

    {
        // ↑のロックは↑のブロック内でしか有効ではないので再度ロックを取ることができる
        let mut lock = m.lock().unwrap();
        *lock = 7;
    }
    println!("m = {:?}", m);
}

fn multi_thread_mutex() {
    // スレッドセーフな参照カウンタが必要な場合には Arc (Atomically Reference Counted)を使う
    // スレッドセーフではない参照カウンタが必要な場合には Rc を使う
    // ビルトインの型が Arc で実装されていないのはパフォーマンス上の理由
    let counter = Arc::new(Mutex::new(0));
    let mut handles = vec![];

    for _ in 0..10 {
        let counter = Arc::clone(&counter);
        let handle = thread::spawn(move || {
            let mut num = counter.lock().unwrap();
            *num += 1;
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("Result: {}", *counter.lock().unwrap());
}
