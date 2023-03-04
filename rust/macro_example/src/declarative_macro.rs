// macro_rules! を使う宣言的(declarative）マクロ の例
// 簡略化した vec! の再実装
// macro_export はマクロが定義されているクレートがスコープに入った時点で無条件でマクロが利用可能になるべきという宣言
#[macro_export]
macro_rules! vec2 {
    // マクロパターン記法　https://doc.rust-lang.org/reference/macros.html
    ( $( $x:expr ),* ) => {
        {
            let mut temp_vec = Vec::new();
            // vec2![1, 2, 3] という呼び出しの場合、$x は 1, 2, 3 となり↓のように展開される
            // temp_vec.push(1);
            // temp_vec.push(2);
            // temp_vec.push(3);
            $(
                temp_vec.push($x);
            )*
            temp_vec
        }
    };
}

pub fn declarative_macro_example() {
    println!("{:?}", vec2![1, 2, 3]);
}
