pub fn as_ref_example() {
    as_ref_arg("Hello".to_string());
    as_ref_arg("Hello");
}

// AsRef はもともと効率的に借用出来ることを意味するが、引数の型を柔軟にするために使われる
// 下のコードの引数は AsRef<str>　を実装した型、つまり &str として借用出来る型ならなんでも取ることが出来る
fn as_ref_arg<T: AsRef<str>>(s: T) {
    let s = s.as_ref();
    println!("{:?}", s);
}
