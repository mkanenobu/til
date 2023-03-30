use std::ops::Deref;

/**
Deref トレイトを実装することで、参照外し演算子の挙動をカスタマイズすることが出来る
**/
pub fn deref_trait() {
    deref();
    deref_coercion_converts();
}

fn deref() {
    let x = 5;
    let y = &x;
    assert_eq!(x, 5);
    assert_eq!(*y, 5);

    let x = 5;
    let y = Box::new(x);
    assert_eq!(x, 5);
    // Box は Deref トレイトを実装しているので参照と同様に参照外し演算子を使用することが出来る
    // 中身はこうなる *(y.deref())
    // deref は値への参照を返すがそれでも外側の普通の参照外しが必要なのは、deref が値を返すと値の所有権がムーブされてしまうので、参照を返して `*` で参照を外す
    assert_eq!(*y, 5);

    let s = MyBox::new(3);
    println!("{}", *s);
}

struct MyBox<T>(T);

impl<T> MyBox<T> {
    fn new(x: T) -> MyBox<T> {
        MyBox(x)
    }
}

impl<T> Deref for MyBox<T> {
    type Target = T;

    fn deref(&self) -> &T {
        &self.0
    }
}

// 参照外し型強制は Deref を実装する型への参照を Deref が元の型を変換できる型への参照に変換する
fn deref_coercion_converts() {
    // MyBox は任意の型の Deref を実装しており、 String は str を返す Deref を実装している
    // そのため↓のような型変換が暗黙的に行われる
    // &MyBox<String> -> &String -> &str
    let s = MyBox::new("Hello".to_string());
    let f = |s: &str| println!("{}", s);
    f(&s);

    // 可変参照も可能、この場合には DerefMut を使う
    let mut s = Box::new("Hello".to_string());
    let f = |s: &mut String| *s = "World!".to_string();
    println!("{}", s);
    f(&mut s);
    println!("{}", s);

    // 可変参照を不変参照に変換することも可能、逆は不可能
    // この場合には DerefMut ではなく Deref が使われる
    let f2 = |s: &String| println!("{}", s);
    f2(&s);
}
