use std::ops;

#[derive(Debug)]
struct MyStupidInt(i64);

// `std::ops::Add` トレイトは `+` の振る舞いを規定するために使用される
impl ops::Add for MyStupidInt {
    type Output = MyStupidInt;

    fn add(self, rhs: MyStupidInt) -> MyStupidInt {
        let v: i64 = format!("{}{}", self.0, rhs.0).parse().unwrap();
        MyStupidInt(v)
    }
}

fn main() {
    let a = MyStupidInt(1);
    let b = MyStupidInt(2);

    let c = a + b;
    dbg!(c);
}
