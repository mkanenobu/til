fn serve_order() {}
mod back_of_house {
    fn fix_incorrect_order() {
        cook_order();
        // 親モジュールから始まる相対パスは super で表せる
        super::serve_order();
    }

    fn cook_order() {}

    // 構造体を公開してもフィールドは公開されない、フィールドは個別に公開する必要がある
    pub struct Breakfast {
        pub toast: String,
        seasonal_fruit: String,
    }

    impl Breakfast {
        // Breakfast は非公開のフィールドを持つのでこのようなコンストラクタを提供しないとインスタンスを作成出来ない
        pub fn summer(toast: &str) -> Breakfast {
            Breakfast {
                toast: String::from(toast),
                seasonal_fruit: String::from("peaches"),
            }
        }
    }

    // enum は構造体と異なり、enum を公開するとバリアントも全て公開される
    pub enum Appetizer {
        Soup,
        Salad,
    }
}

mod front_of_house;

// use を使うと指定したものをスコープに展開出来る
// use で展開したものは非公開だが pub use を使うと再公開が出来る
pub use crate::front_of_house::hosting;
// 直接関数を展開することも出来るが慣例的ではない
// use crate::front_of_house::hosting::add_to_waitlist;
// 構造体や enum などは直接展開する方が慣例的
use std::collections::HashMap;
// 同じ名前のものが同じスコープに存在出来ないので as を使って別名を付ける
use std::fmt::Result;
use std::io::Result as IoResult;
// 複数を一度に
use std::{char, cmp::Ordering};
// 親と子を一度に use std::io; use std::io::Write; と同じ
use std::io::{self, Write};
// glob, 普通に使うとスコーピングが分かりづらくなる、テストによく使われる
use std::collections::*;

pub fn eat_at_restaurant() {
    // 絶対パス
    crate::front_of_house::hosting::add_to_waitlist();
    // 相対パス
    front_of_house::hosting::add_to_waitlist();
    // use
    hosting::add_to_waitlist();

    // 夏 (summer) にライ麦 (Rye) パン付き朝食を注文
    let mut meal = back_of_house::Breakfast::summer("Rye");
    // Change our mind about what bread we'd like
    // やっぱり別のパンにする
    meal.toast = String::from("Wheat");
    println!("I'd like {} toast please", meal.toast);

    // 下の行のコメントを外すとコンパイルできない。食事についてくる
    // 季節のフルーツ(seasonal_fruit)を知ることも修正することも許されていないので
    // meal.seasonal_fruit = String::from("blueberries");
}

#[cfg(test)]
mod tests {
    use super::*;

    // #[test]
    // fn it_works() {
    //     let result = add(2, 2);
    //     assert_eq!(result, 4);
    // }
}
