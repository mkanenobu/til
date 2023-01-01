/**
https://doc.rust-jp.rs/book-ja/ch08-00-common-collections.html
**/

fn main() {
    vec();
    elem();
    elem_borrow();
    for_loop();
    use_enum_to_hold_multi_types();
    strings();
    join_strings();
    multibyte_string();
    string_loop();
    hash_map();
    update_hashmap();
}

fn vec() {
    let mut v1: Vec<i32> = Vec::new();
    println!("{:?}", v1);
    // あらゆる変数は mutable 宣言がされていないと変更できない、Vec も同様
    v1.push(3);
    v1.push(2);
    v1.push(1);
    println!("{:?}", v1);

    // 初期化マクロ
    let v2 = vec![1, 2, 3];
    println!("{:?}", v2);
}

fn elem() {
    // Vec がドロップすると要素もドロップするので参照が複雑になる
    let v = vec![1, 2, 3, 4, 5];

    // Vec の要素を取得する方法は二つある
    // 一つは添字
    let third: &i32 = &v[2];
    println!("The third element is {}", third);

    let third = v.get(2);
    // もう一つは get メソッド, これは Option 型を返す
    match third {
        Some(third) => println!("The third element is {}", third),
        None => println!("There is no third element."),
    }

    // 添字で範囲外にアクセスするとランタイムで panic が発生する
    // let sixth = &v[5];
    // get なら None が返る
    let sixth = v.get(5);
    if let None = sixth {
        println!("There is no sixth element.");
    }
}

fn elem_borrow() {
    let mut v = vec![10, 20, 30];

    let first = &v[0];
    // 添字アクセスは不変参照で push は可変参照なのでコンパイルエラーになる
    // v.push(6);
    println!("The first element is: {}", first);

    let mut v = vec![3, 9, 15];
    // get も同様
    let first = v.get(0);
    // v.push(21);
    if let Some(first) = first {
        println!("The first element is: {}", first);
    }
}

fn for_loop() {
    let mut v = vec![100, 32, 57];
    // 走査してそれぞれの要素に50を足す
    for i in &mut v {
        // * は参照外し演算子、可変参照の実体にアクセスするために参照を外す
        *i += 50;
    }
    println!("{:?}", v);
}

fn use_enum_to_hold_multi_types() {
    // enum を使うと Vec の中に複数の型を保持できる
    // これ以外にもトレイトオブジェクトというのがある
    #[derive(Debug)]
    enum SpreadsheetCell {
        Int(i32),
        Float(f64),
        Text(String),
    }
    let row = vec![
        SpreadsheetCell::Int(3),
        SpreadsheetCell::Text(String::from("blue")),
        SpreadsheetCell::Float(10.12),
    ];
    println!("{:?}", row);
}

// String と Vec は似たようなメソッドを持つ
fn strings() {
    let data = "initial contents";
    let s = data.to_string();
    // to_string は String::from と同じ、Display トレイトを実装している型ならなんでも使用できる
    let s = "initial contents".to_string();
    let hello = String::from("こんにちは");
    println!("{}", hello);
}

// 文字列を連結するいくつかの方法
fn join_strings() {
    let mut s1 = String::from("foo");
    let s2 = "bar";
    s1.push_str(s2);
    // push_str では s2 の所有権はムーブしないので s2 を使い続けることができる
    println!("s2 is {}", s2);

    let s1 = String::from("Hello, ");
    let s2 = String::from("World!");
    // + 演算子は add メソッドを呼ぶ
    // add メソッドの self は参照ではないので所有権が s3 にムーブし、レシーバーの s1 は利用できなくなる
    // s2 は参照でムーブしないのでそのまま使用できる
    // 二つ目の引数の型は &str だが &String を渡せているのは「型強制」によるもの
    let s3 = s1 + &s2;
    println!("s3 is {}", s3);

    // format! マクロは所有権をムーブしない
    let s1 = String::from("tic");
    let s2 = String::from("tac");
    let s3 = String::from("toe");
    println!("{}", format!("{}-{}-{}", s1, s2, s3));
}

fn multibyte_string() {
    // String は Vec<u8> のラッパー
    let s = String::from("abcde");
    println!("{}", s.len());
    // そのためシングルバイトで表せないマルチバイト文字は直感的ではない動きをすることがある
    let s = String::from("こんにちは");
    println!("{}", s.len()); // -> 15

    // 以下のコードは最初の1バイトを返しそうだがコンパイルエラーになる
    // let first = &s[0];
    // println!("{}", first);

    // 文字列をスライスすることは出来るが文字の境界以外の位置でスライスするとコンパイルエラーになる
    let slice = &s[0..3];
    println!("{}", slice);
    // let invalid = &s[0..4];
}

fn string_loop() {
    // 文字列を処理するにはバイトとスカラー値と書記素クラスタ(人間が文字と呼ぶものに一番近い)の3つの方法がある

    // 文字列を走査するメソッド
    // chars メソッドは char (Unicodeスカラ)単位のコレクションを返す
    for c in "こんにちは".chars() {
        println!("{}", c);
    }
    // bytes メソッドは各バイトを返す
    for b in "こんにちは".bytes() {
        println!("{}", b);
    }
    // 書記素クラスタ単位で得る方法は複雑なので標準ライブラリでは提供されていない
}

use std::collections::HashMap;
fn hash_map() {
    // HashMap の初期化
    let mut scores = HashMap::new();
    scores.insert(String::from("Blue"), 10);
    scores.insert(String::from("Yellow"), 50);
    let red = String::from("Red");
    let red_score = 100;
    // insert は所有権をムーブするので Copy トレイトを実装していない String などの値は利用出来なくなる
    scores.insert(red, red_score);
    // i32 が Copy トレイトを実装していてコピーされるので大丈夫
    println!("{}", red_score);
    // red の所有権は scores にムーブしているので利用できない
    // println!("{}", red);

    // 2つの Vec を HashMap に変換
    let teams = vec![String::from("Blue"), String::from("Yellow")];
    let initial_scores = vec![10, 50];

    // zip でタプルのベクタを作り、collect で HashMap に変換
    // _ の型注釈は auto 的なものでコンパイラに推論させる
    let scores: HashMap<_, _> = teams.iter().zip(initial_scores.iter()).collect();

    // 値にアクセス
    let blue_score = scores.get(&String::from("Blue"));
    if let Some(score) = blue_score {
        println!("blue: {}", score);
    }
    if let None = scores.get(&String::from("Red")) {
        println!("red is not found");
    }

    // loop
    let mut scores = HashMap::new();
    scores.insert(String::from("Blue"), 10);
    scores.insert(String::from("Yellow"), 50);

    // for でハッシュマップを走査する
    for (key, value) in &scores {
        println!("{}: {}", key, value);
    }
}

fn update_hashmap() {
    let mut scores = HashMap::new();
    scores.insert(String::from("Blue"), 10);
    // 同じキーで追加すると上書きされる
    scores.insert(String::from("Blue"), 25);
    println!("{:?}", scores);

    // entry と or_insert でキーが存在しない場合にのみ値を追加する
    scores.entry(String::from("Yellow")).or_insert(50);
    scores.entry(String::from("Blue")).or_insert(50);
    // Yellow は追加されるが、Blue は追加（上書き）されない
    println!("{:?}", scores);

    // 単語カウント
    let text = "hello world wonderful world";
    let mut map = HashMap::new();
    for word in text.split_whitespace() {
        // or_insert は値があればそのまま、なければデフォルトを挿入してから値の可変参照を返す
        let count = map.entry(word).or_insert(0);
        *count += 1;
    }
    println!("{:?}", map);
}
