/**
Drop トレイトを使うことで値がスコープを抜けそうになったときに実行される処理を実装することができる
**/
pub fn drop_trait() {
    let c = CustomSmartPointer {
        data: String::from("my stuff"),
    };

    // std::mem::drop で明示的にドロップすることも可能
    drop(c);
    // drop メソッドは二重解放エラーになるので使えない
    // c.drop();

    #[allow(unused_variables)]
    let d = CustomSmartPointer {
        data: String::from("other stuff"),
    };
    println!("CustomSmartPointers created."); // CustomSmartPointerが生成された
}

struct CustomSmartPointer {
    data: String,
}

impl Drop for CustomSmartPointer {
    fn drop(&mut self) {
        println!("Dropping CustomSmartPointer with data `{}`!", self.data);
    }
}
