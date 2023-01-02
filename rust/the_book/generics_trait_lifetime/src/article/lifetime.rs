pub fn main() {
    dangling_reference();
    lifetime_specifier();
    structure_lifetime();
    omit_lifetime_specifier();
    static_lifetime();
}

// ライフタイムの主な目的はダングリング参照を回避すること
// ダングリング参照になる例
fn dangling_reference() {
    // Rust には null 値が無いが変数の宣言時に値を初期化しないことは出来る
    // 未初期化状態の変数を使用しようとするとコンパイルエラーになる
    let r;
    {
        let x = 5;
        r = &x;
        // ここで x はドロップする
    }
    // r（xへの参照）は↑で x がドロップしているため失敗する、それを回避するためにコンパイルエラーになる
    // これを検知できるのはスコープがそれぞれライフタイムを持っており、借用チェッカーがそれをチェックしているから
    // println!("r: {}", r);
}

fn lifetime_specifier() {
    let mut r: &str;
    let a = String::from("loooooooong");

    {
        let b = String::from("short");
        r = longest(&a, &b);
        println!("r: {}", r);
    }
    // r は a の参照になるが longest の返り値のライフタイムは a と b の短い方（つまり b のライフタイム）になるので、
    // このスコープで r を参照しようとするとコンパイルエラーになる
    // println!("r: {}", r);
}

// x と y のうち長い方を返すが、返しているのが x と y のどちらかコンパイラが分からないのでコンパイル出来ない
// fn longest(x: &str, y: &str) -> &str {
//     if x.len() > y.len() {
//         x
//     } else {
//         y
//     }
// }

// ライフタイム指定子付き
// 全ての参照が少なくとも 'a より長いライフタイムを持つ文字列スライスを指す
// x と y のライフタイムが異なる場合 'a は短い方に合わせられる、つまり返り値のライフタイムも短い方と同じになる
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}

// このような場合、 y は x や戻り値とは関係無いので x だけに 'a のライフタイム引数を付ければいい
fn returns_first<'a>(x: &'a str, y: &str) -> &'a str {
    x
}

// 関数の戻り値にライフタイム引数を指定する場合、引数のうちどれかのライフタイム引数と一致する必要がある
// ↓は動かない
// fn longest<'a>(x: &str, y: &str) -> &'a str {
//     // 本当に長い文字列
//     let result = String::from("really long string");
//     result.as_str()
// }

// 構造体定義のライフタイム注釈
// この場合、ImportantExcerpt のライフタイムが part フィールドの参照のライフタイムに制限される
struct ImportantExcerpt<'a> {
    part: &'a str,
}

fn structure_lifetime() {
    let novel = String::from("Call me Ishmael. Some years ago...");
    let first_sentence = novel.split('.').next().expect("Could not find a '.'");
    let i = ImportantExcerpt {
        part: first_sentence,
    };
}

fn omit_lifetime_specifier() {
    println!("{}", first_word("hello world"));
}

// 特定の規則に則るものはライフタイム注釈を省略出来る
/**
規則1: 参照である各引数が独自のライフタイム引数を得ること
例）
fn f<'a>(x: &'a i32) {}
fn f<'a, 'b>(x: &'a i32, y: &'b i32) {}

規則2: 1つだけ入力ライフタイム引数があるなら、そのライフタイムが全ての出力ライフタイム引数に代入される
例）
fn f<'a>(x: &'a i32) -> &'a i32 {}

規則3: 複数の入力ライフタイム引数があっても、そのうちの一つが &self や &mut self の場合、self のライフタイムが全出力ライフタイム引数に代入される
**/

// first_word は実際にはこのようなライフタイム注釈が付くが、規則1と規則2に従い省略出来る
// fn first_word<'a>(s: &'a str) -> &'a str
// 上にある longest は引数 x と引数 y のライフタイムが同じなので、規則2に当てはまらずライフタイム注釈を省略出来ない
fn first_word(s: &str) -> &str {
    s.split(' ').collect::<Vec<&str>>().get(0).unwrap()
}

fn static_lifetime() {
    // スタティックライフタイムは特殊なライフタイムで、プログラムの実行中全期間生存出来る
    let s: &'static str = "I have a static lifetime.";
    println!("{}", s);
}
