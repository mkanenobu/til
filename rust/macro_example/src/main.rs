mod custom_derive_macro;
mod declarative_macro;

/**
macro の種類

1. macro_rules! を使う宣言的(declarative）マクロ
  - macro_rules! を使わない宣言的マクロが導入される予定らしく、そのときには macro_rules! は非推奨になるらしい
2. 手続き的(procedural)マクロ
  1. 構造体とenumにderive属性を使ったときに追加されるコードを指定する、カスタムの#[derive]マクロ
  2. 任意の要素に使えるカスタムの属性を定義する、属性風のマクロ
  3. 関数のように見えるが、引数として指定されたトークンに対して作用する関数風のマクロ
**/

fn main() {
    declarative_macro::declarative_macro_example();
    custom_derive_macro::custom_derive_macro_example();
}
