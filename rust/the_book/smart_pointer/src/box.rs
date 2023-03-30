/**
Box は最も素直なスマートポインタで値をヒープに格納することが出来る
以下の場合によく使われる
- コンパイル時にはサイズを知ることができない型があり、正確なサイズを要求する文脈でその型の値を使用する時
- 多くのデータがあり、その所有権を移したいが、その際にデータがコピーされないようにしたい時
- 値を所有する必要があり、特定の型であることではなく、特定のトレイトを実装する型であることのみ気にかけている時
**/
pub fn heap_box() {
    let b = Box::new(5);
    println!("b = {}", b);
}

// Cons data, Box を使うと再帰的な型を定義出来る
// 本来再帰的に定義された型は必要なメモリ量を計算出来ないので
#[derive(Debug)]
enum List {
    Cons(i32, Box<List>),
    Nil,
}

use List::{Cons, Nil};

pub fn cons_list() {
    let list = Cons(1, Box::new(Cons(2, Box::new(Cons(3, Box::new(Nil))))));
    println!("list = {:?}", list);
}
