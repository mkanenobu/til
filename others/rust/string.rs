// str はプリミティブでスライス
// String は標準ライブラリが提供する型でベクタ
fn string_slice() -> &'static str {
    "Hello, World!"
}

fn str_to_string(s: &str) -> String {
    s.to_string()
}

fn main(){
    let mut s: String = "Hello, ".to_string();
    s.push_str("World");

    println!("{}", s);

    s.push('!');

    println!("{}", s);

    s.pop();

    println!("{}", s);
}
