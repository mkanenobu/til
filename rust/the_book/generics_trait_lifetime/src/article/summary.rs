/**
https://doc.rust-jp.rs/book-ja/ch10-03-lifetime-syntax.html#%E3%82%B8%E3%82%A7%E3%83%8D%E3%83%AA%E3%83%83%E3%82%AF%E3%81%AA%E5%9E%8B%E5%BC%95%E6%95%B0%E3%83%88%E3%83%AC%E3%82%A4%E3%83%88%E5%A2%83%E7%95%8C%E3%83%A9%E3%82%A4%E3%83%95%E3%82%BF%E3%82%A4%E3%83%A0%E3%82%92%E4%B8%80%E5%BA%A6%E3%81%AB
**/

pub fn main() {
    let a = "short";
    let b = "loooong";
    let r = longest_with_an_announcement(a, b, "The longest string is");
    println!("{}", r);
}

use std::fmt::Display;

// ジェネリクス、トレイト境界、ライフタイムのまとめ
// ライフタイムは一種のジェネリクスなので 'a と T が最初の <> の中に
// 引数 x と y には同じライフタイム 'a が指定されており、'a は x と y のうちライフタイムが短い方にバインドされる
// 引数 ann には T が指定されており、これは where 句の中の宣言で Display トレイトを実装している型を取る
fn longest_with_an_announcement<'a, T>(x: &'a str, y: &'a str, ann: T) -> &'a str
where
    T: Display,
{
    println!("Announcement! {}", ann);
    if x.len() > y.len() {
        x
    } else {
        y
    }
}
