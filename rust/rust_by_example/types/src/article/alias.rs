// `NanoSecond` を `u64`の別名として使用する。
type NanoSecond = u64;
type Second = u64;
type Inch = u64;

// 警告を抑えるアトリビュートを使用。
#[allow(non_camel_case_types)]
type u64_t = u64;

// エイリアスにはメソッドも追加出来ない
// impl NanoSecond {
//     fn to_second(&self) -> Second {
//         self / 1_000_000_000
//     }
// }

fn nano_second_to_second(nano: NanoSecond) -> Second {
    nano / 1_000_000_000
}

// より型安全にしたい場合には新しい型を定義する方法が考えられる
#[derive(Debug)]
struct MilliSecond(u64);
impl MilliSecond {
    fn to_second(&self) -> Second {
        self.0 / 1_000
    }
}

pub fn main() {
    // `NanoSecond` = `Inch` = `u64_t` = `u64`.
    let nanoseconds: NanoSecond = 5 as u64_t;
    let inches: Inch = 2 as u64_t;

    // 型のエイリアスは、元の型をより型安全にしてくれる **わけではない**
    // なぜならば、エイリアスは新たな型を定義している **わけではない** から
    println!(
        "{} nanoseconds + {} inches = {} unit?",
        nanoseconds,
        inches,
        nanoseconds + inches
    );

    // NanoSecond では無いが受けられる
    println!("{} seconds", nano_second_to_second(1_000_000_000u64));

    // エイリアスではない新しい型
    let ms = MilliSecond(1_000);
    println!("{:?} is {} seconds", ms, ms.to_second());
}
