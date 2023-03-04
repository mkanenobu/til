// 構造体とenumにderive属性を使ったときに追加されるコードを指定する、カスタムの#[derive]マクロの例
// 中身は hello_macro/hello_macro_derive/src/lib.rs にある
use hello_macro::HelloMacro;
use hello_macro_derive::HelloMacro;

#[derive(HelloMacro)]
struct Pancakes;

pub fn custom_derive_macro_example() {
    Pancakes::hello_macro();
}
