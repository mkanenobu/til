/**
https://doc.rust-jp.rs/book-ja/ch04-02-references-and-borrowing.html
**/

fn main() {
    move_example();
    reference();
    change_ref();
    // dangling_example();
    slice();
}

fn move_example() {
    let s1 = string();
    let mut s2 = String::from("");
    println!("{}", s2);

    // s2へのs1の代入でs1はs2にムーブされs1を参照しようとするとコンパイルエラーになる
    // s2 = s1;
    // println!("{}", s1);

    // clone を使えば deep copy 出来る
    s2 = s1.clone();
    println!("s1: {}, s2: {}", s1, s2);

    // ムーブするかは値の型が Copy トレイトに適合しているかに依る（適合しているとムーブしない）
    // 大抵のスカラー型は Copy である
    let n1 = 5;
    let n2 = n1;
    println!("n1: {}, n2: {}", n1, n2);
}

fn string() -> String {
    let mut s = String::from("Hello");
    s.push_str(", world!");
    s
}

fn reference() {
    let s1 = String::from("Hello");
    // 普通に渡すと s1 が calculate_length にムーブされるので参照を使う
    // 参照を渡すときは & をつける
    let len = calculate_length(&s1);
    // 参照を渡していると所有権がムーブしないので s1 を使える
    println!("The length of '{}' is {}.", s1, len);
}

// 参照を取ることを借用と呼ぶ
fn calculate_length(s: &String) -> usize {
    s.len()
    // この関数が終わると s はスコープから外れるが参照は所有権を持っている訳では無いのでドロップされない
}

fn change_ref() {
    let mut s = String::from("Hello");
    println!("{}", s);
    // 参照を変更する場合は &mut を使い可変な参照とする必要がある
    change(&mut s);
    println!("{}", s);

    // 同じスコープで同じ値に対しては可変な参照は一つしか生成出来ない（不変な参照はいくつでも生成可能）
    // 不変な参照と可変な参照を同時に生成することも出来ない
    // let s1 = &mut s;
    // let s2 = &mut s;
    // let s3 = &s;
    // println!("{}, {}, {}", s1, s2, s3);
}

fn change(s: &mut String) {
    s.push_str(", World!");
}

// fn dangling_example() {
//     let reference_to_nothing = dangle();
// }
// fn dangling() -> &String {
//     // この関数が終わると s がドロップされるので、戻り値の参照の参照先が無くなる
//     // Rust ではこれを防ぐために参照が無効になるような場合にはコンパイルエラーになる（ライフタイム）
//     let s = String::from("Hello");
//     &s
// }

fn slice() {
    let mut s = String::from("hello world");
    let fw = first_word(&s);
    // l は s に紐づくが、コード嬢は関係が無いので s が変更されても同期されない
    println!("The first word of string: '{}' is: {}", s, fw);
    s.clear();
    println!("The first word length of string: '{}' is: {}", s, fw); // -> The first word of string: '' is: 5

    let s = String::from("hello world");
    // これを解決するために文字列スライスがある
    // 文字列スライスは文字列の一部への参照
    let hello = &s[0..5];
    let world = &s[6..11];
    println!("{} {}", hello, world);

    let mut s = String::from("hello world");
    let fw = first_word_slice(&s);
    // コンパイラは fw が s の一部を参照していることを知っているので変更しようとするとコンパイルエラーになる
    // s.clear();
    println!("The first word of string: '{}' is: '{}'", s, fw);
    // 配列のスライスもある
    let a = [1, 2, 3, 4, 5];
    let slice = &a[1..3];
    println!("{:?}", slice);
}

fn first_word(s: &String) -> usize {
    let bytes = s.as_bytes();

    // 空白があればそこまでの長さを返す
    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return i;
        }
    }
    // それ以外は文字列の長さを返す
    s.len()
}

fn first_word_slice(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[..i];
        }
    }
    // それ以外は文字列の長さを返す
    &s[..]
}
