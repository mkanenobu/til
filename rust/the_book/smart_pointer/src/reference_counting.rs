use std::rc::Rc;

/**
https://doc.rust-jp.rs/book-ja/ch15-04-rc.html

Rc は参照カウント方式のスマートポインタ
参照カウントは値への参照の数を追跡して、値への参照が無くなると値を解放する
**/
pub fn reference_counting() {
    shared_cons_list();
}

fn shared_cons_list() {
    enum BoxedList {
        Cons(i32, Box<BoxedList>),
        Nil,
    }

    // a への参照を持つ b と c のリストがある
    // ./box.rs のように Box で実装しようとしても b が a を参照した時点で a の所有権が移っているので c は a を参照出来ない
    let a = BoxedList::Cons(5, Box::new(BoxedList::Cons(10, Box::new(BoxedList::Nil))));
    #[allow(unused_variables)]
    let b = BoxedList::Cons(3, Box::new(a));
    // let c = BoxedList::Cons(4, Box::new(a));

    enum List {
        Cons(i32, Rc<List>),
        Nil,
    }

    use List::{Cons, Nil};

    let a = Rc::new(Cons(5, Rc::new(Cons(10, Rc::new(Nil)))));
    println!("count after creating a = {}", Rc::strong_count(&a)); // --> 1
                                                                   // Rc::clone は参照を増やす
                                                                   // 値の clone メソッドを使うことも出来るが、clone メソッドは値のディープコピーなので高コスト
                                                                   // Rc::clone は参照カウントをインクリメントするだけなので高速
    #[allow(unused_variables)]
    let b = Cons(3, Rc::clone(&a));
    println!("count after creating b = {}", Rc::strong_count(&a)); // --> 2
    {
        #[allow(unused_variables)]
        let c = Cons(4, Rc::clone(&a));
        println!("count after creating c = {}", Rc::strong_count(&a)); // --> 3
    }
    // c の参照が外れるので 2 になる
    println!("count after c goes out of scope = {}", Rc::strong_count(&a)); // --> 2
}
